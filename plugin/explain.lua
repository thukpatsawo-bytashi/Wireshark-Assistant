local function explain_packet(...)

    local args = {...}

    local protocol = tostring(args[19] or "Unknown")

    local src = "Unknown"
    local dst = "Unknown"

    -- IPv4
    if tostring(args[63] or ""):match("%d+%.%d+%.%d+%.%d+") then
        src = tostring(args[63])
        dst = tostring(args[67] or "Unknown")
    end

    -- IPv6
    if tostring(args[56] or ""):find(":") then
        src = tostring(args[56])
        dst = tostring(args[62] or "Unknown")
    end

    local explanation = ""

    if protocol == "TCP" then
        explanation =
            "This packet belongs to a TCP connection. TCP provides reliable communication between devices."

    elseif protocol == "DNS" then
        explanation =
            "This packet is related to DNS, which translates domain names into IP addresses."

    elseif protocol == "TLSv1.2" or protocol == "TLSv1.3" then
        explanation =
            "This packet is part of an encrypted TLS session."

    elseif protocol == "HTTP" then
        explanation =
            "This packet is part of HTTP web traffic."

    else
        explanation =
            "No protocol-specific explanation is available yet."
    end

    local output =
        "Wireshark Assistant\n" ..
        "====================\n\n" ..
        "Protocol: " .. protocol .. "\n\n" ..
        "Source: " .. src .. "\n" ..
        "Destination: " .. dst .. "\n\n" ..
        "Explanation:\n" ..
        explanation

    local win = TextWindow.new("Wireshark Assistant")
    win:set(output)

end

register_packet_menu(
    "Wireshark Assistant/Explain Packet",
    explain_packet
)