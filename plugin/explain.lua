local function explain_packet()

    local win = TextWindow.new("Wireshark Assistant")

    win:set(
        "Packet menu works!"
    )

end

register_packet_menu(
    "Wireshark Assistant/Explain Packet",
    explain_packet
)