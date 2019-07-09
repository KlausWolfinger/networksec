#!/usr/bin/perl
#require 'getopts.pl';
# ---- ip header ----------
use Net::RawIP;
$tcp = new Net::RawIP;
$saddr = "192.168.1.80";
$daddr = "192.168.1.239";
# ------- tcp header -----------
$source = 1050; $dest = 113;
for (;;){
for ($i=0;$i<256;$i++){
$res1=0;$res2=0;$urg=0;$ack=0;$psh=0;$rst=0;$syn=0;$fin=0;
if($i & 128){$res1=1};
if($i & 64){$res2=1};
if($i & 32){$urg=1}; 
if($i & 16){$ack=1};
if($i & 8){$psh=1}; 
if($i & 4){$rst=1}; 
if($i & 2){$syn=1}; 
if($i & 1){$fin=1};
print "$res1:$res2:$urg:$ack:$psh:$rst:$syn:$fin\n";
$check = 0;


$tcp->set({ ip => {
	saddr => $saddr,
	daddr => $daddr
	},
tcp => {
source => $source, dest => $dest,
res1 => $res1,
res2 => $res2, urg => $urg,
ack => $ack, psh => $psh,
rst => $rst, syn => $syn,
fin => $fin, 
data => "flagtest"
} } );
### --- and send ---->>>>>
$tcp->send();
# ----- that's it
} }