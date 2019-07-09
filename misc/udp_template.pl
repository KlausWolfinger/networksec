#!/usr/bin/perl
require 'getopts.pl';
use Net::RawIP;
Getopts('d:p:s:n:');
# ---- ip header ----------
$version = 4; $ihl = 5; $tos = 10;
$tot_len = 100; $id = 16; $frag_off = 0;
$ttl = 32; $protocol = 17;

$saddr = "192.168.1.237";
# ------- udp header -----------
#$opt_i
#$opt_p
$data = "hallo";
$check = 0;$dest = 53;
$udp = new Net::RawIP({udp=>{}});
$udp->set({ ip => {
#version => $version, ihl => $ihl,
#tos => $tos, tot_len => $tot_len,
#id => $id, frag_off => $frag_off,
#ttl => $ttl, protocol => $protocol,
#check => $check, 
saddr => $saddr,
daddr => $opt_d,
},
udp => {
dest => $dest,
source => 20000,
#len => $len, 
check => $check,
data => $data,
}
});
### --- and send ---->>>>>
$udp->send(1,1);
