#!/usr/bin/perl
# for education purpose only
# NEVER use this script in productive environments
# accept the law
# do NOT hack
# more about professional IT security training at
# www.itconsulting-wolfinger.de
#



use Net::RawIP qw(:pcap);
my($destination) = @ARGV;
if(@ARGV < 1) {
 die"\nUsage $0 <destination ip>\n\n";
}
#Find the Device eth0,eth1,eth2 that the packet needs to be sent over and received.
$dev = rdev($destination);

#Whats the IP address of this interface, used to specify the return address.
$ip_addr = ${ifaddrlist()}{$dev};

#New Raw Class packet type.
$a = new Net::RawIP ({icmp =>{}});

#Set Source and Destination IP header and tell $a its a ICMP packet.
$a->set({ip => { saddr => $ip_addr, daddr => $destination},
	 icmp => {type => 20, id => $$}
	 });  

#Set the options for pcap Tcpdump.
$filt = "ip proto \\icmp and src host $destination";
$size = 1500;
$tout = 30;
$pcap = $a->pcapinit($dev,$filt,$size,$tout);
$i =0;

#Fork into two parts, one listens for the ICMP packets and the other sends them.
if(fork){
	loop $pcap,-1,\&dmp,\@a; 
}
else{
	# Read STDIN AKA your terminal and send after each return/enter.
	while(<STDIN>) {
		if (length($_) > 1400) {
			print "Line too large\n";
		} else { 
			$a->set({icmp => {sequence => $i,data => $_}});
			$a->send(1,1);
			$i++
		}
	}

}

#This is called from the loop function above.
sub dmp{
	$a->bset(substr($_[2],14));
	my @ar = $a->get({ip => [qw(ttl)], icmp=>[qw(sequence data)]});
	printf("%u: %s\n",length($ar[2])+8,$ar[2]);
 }


