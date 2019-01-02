#!/usr/bin/perl
# kdw hackerworkshop 2004

# have fun, klaus

use Net::RawIP;

print "Mein Ping ---> \n";


$a = new Net::RawIP ({icmp =>{}});

for($i=1;$i<20;$i++){
$a1 = int (rand(253)+1);
$a2 = int (rand(253)+1);
$a3 = int (rand(253)+1);
$a4 = int (rand(253)+1);

$address = $a1 . "." . $a2 . "." . $a3 . "." . $a4;


$a->set({ip => { daddr => "10.28.0.2", saddr => $address }, icmp => {type => 8, id => $$}});
$a->set({icmp => {data => "sorry again" }});

$a->send(); 
}

