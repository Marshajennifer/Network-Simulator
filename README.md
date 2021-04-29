# Network-Simulator
NS2 programs are generally written using two major languages i.e C++ and TCL. NS2 supports both the types of Network i.e. wired and wireless networks. In wired networks, nodes use wired channel where as in wireless channel, node transmission takes place through wireless channels. Major aspect of any simulation is the creation of Nodes and topology. I have focused here on all the types of topology and its respective codes to get an idea about NS2 simulation. It’s just a one way of teaching to make you know few basics of NS2.

Steps:
Install NS2

Open terminal and type gedit filename.tcl

Now a filename.tcl file is opened in gedit 

Type the code that I have attached here(marsha.tcl) {All the steps are mentioned clearly in the Code}

After that Save the file and close it.

Now in Terminal you can run it . For that type:

  ns filename.tcl {in my case ns marsha.tcl}
  
  
 Now after successfully running above command 2 new files are created at the same location where filename.tcl{in my case ns marsha.tcl} is resided.
 
 Those 2 files will have the filenames filename.nam and filename.tr {in my case marsha.nam and marsha.tr}
 
 //Remember that commands for creating these 2 files are given in the code with name.

Now to view the network topology you can run the newly automatically created nam file.

For that in terminal type:

  nam filename.nam{in my case nam marsha.nam}
  
Now we can see the network formed and by clicking on the play button we can see the traffic.

Here I have attached 2 images of traffic flow 0to3cbr.png and both0to3and2to5.png.

0to3cbr.png represents the traffic flow between nodes 0 and 3 starting at time 1.0 s

both0to3and2to5.png represents the traffic flow between nodes 2 and 5 starting at time 2.0 s together with traffic flow between nodes 0 and 3 starting at time 1.0 s

And the flow stops at 10 s.
