#!/usr/bin/perl

use Net::RawIP;
use NetPacket::IP qw(:strip);
#use NetPacket::TCP;
use NetPacket::UDP;

$sip = "INVITE sip:192.168.2.80 SIP/2.0\n";
$sip .= "Via: SIP/2.0/UDP 192.168.2.19:5060;rport;branch=z9hG4bK907478200\n";
$sip .= "From: <sip:student@127.0.0.1>;tag=41610221\n";
$sip .= "To: kdw <sip:192.168.2.80>\n";
$sip .= "Call-ID: 923017852@192.168.2.19\n";
$sip .= "CSeq: 20 INVITE\n";
$sip .= "Contact: <sip:student@192.168.2.19:5060>\n";
$sip .= "Max-Forwards: 5\n";
$sip .= "User-Agent: Linphone-1.0.0/eXosip\n";
$sip .= "Subject: Phone call\n";
$sip .= "Expires: 120\n";
$sip .= "Allow: INVITE, ACK, CANCEL, BYE, OPTIONS, REFER, SUBSCRIBE, NOTIFY, MESSAGE\n";
$sip .= "Content-Type: application/sdp\n";
$sip .= "Content-Length:   355\n";

$sip .= "v=0\n";
$sip .= "o=student 123456 654321 IN IP4 192.168.2.19\n";
$sip .= "s=A conversation\n";
$sip .= "c=IN IP4 192.168.2.19\n";
$sip .= "t=0 0\n";
$sip .= "m=audio 7078 RTP/AVP 0 3 8 110 111 115 101\n";
$sip .= "b=AS:20\n";
$sip .= "a=rtpmap:0 PCMU/8000/1\n";
$sip .= "a=rtpmap:3 GSM/8000/1\n";
$sip .= "a=rtpmap:8 PCMA/8000/1\n";
$sip .= "a=rtpmap:110 speex/8000/1\n";
$sip .= "a=rtpmap:111 speex/16000/1\n";
$sip .= "a=rtpmap:115 1015/8000/1\n";
$sip .= "a=rtpmap:101 telephone-event/8000\n";
$sip .= "a=fmtp:101 0-11\n";

$sip_call = new Net::RawIP({
			    ip   => {
				     daddr => "192.168.2.80",
				     ttl => 64,
				     tos => 0x00 ,
				     frag_off => 0,
				     id => int(rand(65536))
				    },
			    udp  => {
				     dest => 5060,
				     source => 5060,
				     data => $sip,
				check => 0
				    }
			   });

$packet = NetPacket::UDP->decode(ip_strip($sip_call));
$cksum  = $packet->{cksum} if !($checksum);

$sip_call ->set({udp  => {check => $cksum
				    }});

$sip_call->send;
print $sip."\n\n";