def build_prompt(packet):

    return f"""
Analyze the following network packet:

Protocol: {packet['protocol']}
Length: {packet['length']} bytes
Source IP: {packet['src_ip']}
Destination IP: {packet['dst_ip']}
Source Port: {packet['src_port']}
Destination Port: {packet['dst_port']}

Provide a concise packet analysis suitable for display inside a Wireshark popup.

Explain:
1. What the packet is doing.
2. Anything important or unusual.
3. Whether it appears normal, suspicious, or uncertain.

Requirements:
- Maximum 120 words.
- Use plain text only.
- Do not use Markdown.
- Do not use #, *, emojis, horizontal lines, or decorative symbols.
- Do not include greetings or conclusions.
- Do not use analogies.
- Do not act like an instructor.
- Do not unnecessarily explain basic networking concepts.
- Use clear cybersecurity terminology.
- Do not claim traffic is malicious based only on one packet unless there is strong evidence.
"""