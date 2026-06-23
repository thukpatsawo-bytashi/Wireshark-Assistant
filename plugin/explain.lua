local function explain_packet(...)

    local args = {...}

    -- Packet metadata discovered from the packet menu callback
    local protocol = tostring(args[19] or "Unknown")
    local src_ip   = tostring(args[63] or "Unknown")
    local dst_ip   = tostring(args[67] or "Unknown")

    -- Simple rule-based explanations
    local explanations = {
        TCP = "TCP is a reliable transport protocol that ensures ordered and error-checked delivery of data between hosts.",

        DNS = "DNS translates domain names into IP addresses so devices can locate services on a network.",

        HTTP = "HTTP is used to transfer web pages and API requests between clients and servers.",

        ["TLSv1.2"] = "TLS encrypts communication between a client and server to protect data in transit.",

        ["TLSv1.3"] = "TLS encrypts communication between a client and server using modern cryptographic standards.",

        ICMP = "ICMP is used for network diagnostics and control messages such as ping requests and replies."
    }

    local explanation =
        explanations[protocol]
        or "No explanation available for this protocol yet."

    local output =
        "Wireshark Assistant\n" ..
        "====================\n\n" ..

        "Protocol: " .. protocol .. "\n\n" ..

        "Source: " .. src_ip .. "\n" ..
        "Destination: " .. dst_ip .. "\n\n" ..

        "Explanation:\n" ..
        explanation

    local win = TextWindow.new("Wireshark Assistant")
    win:set(output)

end

register_packet_menu(
    "Wireshark Assistant/Explain Packet",
    explain_packet
)