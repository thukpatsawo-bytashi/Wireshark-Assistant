local function hello()
    local win = TextWindow.new("Wireshark Assistant")
    win:set("Plugin loaded successfully!")
end

register_menu(
    "Wireshark Assistant/Hello",
    hello,
    MENU_TOOLS_UNSORTED
)