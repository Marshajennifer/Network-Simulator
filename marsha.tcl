#create a simulator object
set ns [new Simulator]

#create a trace file(to plot)   
set tracefile [open marsha.tr w]
$ns trace-all $tracefile

#create a animation information or NAM file creation
set namfile [open marsha.nam w]
$ns namtrace-all $namfile


#create nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

#creation of link between nodes
#link is duplex . so we can write 1 to 2 or 2 to 1
$ns duplex-link $n0 $n1 5Mb 2ms DropTail
$ns duplex-link $n1 $n2 10Mb 5ms DropTail
$ns duplex-link $n1 $n4 3Mb 10ms DropTail
$ns duplex-link $n4 $n3 100Mb 2ms DropTail
$ns duplex-link $n4 $n5 4Mb 10ms DropTail




#creation of agents 
#We have TCP agent, UDP agent, Sink agent, NULL agent
#node 0 to node 3 using UDP(Creation of UDP agent)
set udp [new Agent/UDP]
set null [new Agent/Null]
# After agent creation attach n0 to udp
$ns attach-agent $n0 $udp
#attach n3 to null
$ns attach-agent $n3 $null

#It is a virtual connection between UDP at n0 with Null at n3
$ns connect $udp $null

#node 2 to node 5 using TCP(Creation of TCP agent)

set tcp [new Agent/TCP]
set sink [new Agent/TCPSink]

# After agent creation attach n2 to tcp
$ns attach-agent $n2 $tcp
#attach n5 to sink
$ns attach-agent $n5 $sink
#It is a virtual connection between TCP at n2 with Sink  at n5
$ns connect $tcp $sink


#creation of Application CBR, FTP
# CBR- Constant Bit Rate(eg, mp3 files that have a CBR or 192 kbps,320 kbps , etc)
#FTP- File Transfer Protocol( eg, To download a file from a network)

set cbr [new Application/Traffic/CBR]
#CBR at n0 is attached to udp
$cbr attach-agent $udp


set ftp [new Application/FTP]
#FTP at n2 is attached to tcp
$ftp attach-agent $tcp

#Start the traffic
#At 1.0 start cbr traffic and at 2.0 start ftp traffic 
$ns at 1.0 "$cbr start"
$ns at 2.0 "$ftp start"

$ns at 10.0 "finish"

# procedure will be called at 10.0 seconds
proc finish {} {
	global ns tracefile namfile
	$ns flush-trace
	close $tracefile
	close $namfile
	exit 0
}
puts "Simulation is Starting..."
$ns run
