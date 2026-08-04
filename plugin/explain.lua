local json = require("dkjson")

print("Wireshark Version:", get_version())
print("dkjson loaded successfully!")
local json = require("dkjson")

print("Wireshark Version:", get_version())
print("Plugin directory:", plugin_dir)
print("dkjson loaded successfully!")

local function explain_packet(...)

    local args = {...}

    -- Extract packet metadata
    local protocol = tostring(args[19] or "Unknown")
    local length   = tostring(args[14] or "Unknown")

    local src_ip   = tostring(args[63] or "Unknown")
    local dst_ip   = tostring(args[67] or "Unknown")

    local src_port = tostring(args[73] or "Unknown")
    local dst_port = tostring(args[74] or "Unknown")

    -- Create JSON payload
    local payload = string.format(
        '{"protocol":"%s","length":%s,"src_ip":"%s","dst_ip":"%s","src_port":%s,"dst_port":%s}',
        protocol,
        length,
        src_ip,
        dst_ip,
        src_port,
        dst_port
    )

    -- Save payload
    local file = io.open("/tmp/packet.json", "w")

    if file then
        file:write(payload)
        file:close()
    else
        local win = TextWindow.new("Wireshark Assistant")
        win:set("Failed to create packet.json")
        return
    end

    -- Call Flask backend
    os.execute(
        'curl -s -X POST http://127.0.0.1:5000/explain ' ..
        '-H "Content-Type: application/json" ' ..
        '-d @/tmp/packet.json ' ..
        '-o /tmp/response.json'
    )

    -- Read response
    local response_file = io.open("/tmp/response.json", "r")

    if not response_file then
        local win = TextWindow.new("Wireshark Assistant")
        win:set("Could not read /tmp/response.json")
        return
    end

    local response = response_file:read("*all")
    response_file:close()

    -- Decode JSON
    local data, pos, err = json.decode(response)

    if err then
        local win = TextWindow.new("Wireshark Assistant")
        win:set(
            "JSON Decode Error\n\n" ..
            tostring(err) ..
            "\n\nRaw Response:\n\n" ..
            response
        )
        return
    end

    -- Display result
    local output =
        "Wireshark Assistant\n" ..
        "====================\n\n" ..

        "Summary\n" ..
        "-------\n" ..
        (data.summary or "N/A") ..
        "\n\n" ..

        "Explanation\n" ..
        "-----------\n" ..
        (data.explanation or "N/A")

    local win = TextWindow.new("Wireshark Assistant")
    win:set(output)

end

register_packet_menu(
    "Wireshark Assistant/Explain Packet",
    explain_packet
)