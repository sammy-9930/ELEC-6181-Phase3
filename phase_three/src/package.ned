package phase_three;

@license(LGPL);

import inet.common.misc.ThruputMeteringChannel;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;

@license(LGPL);
network projectphase3
{
    parameters:
        double edgeDatarate @unit(bps);
        double coreDatarate @unit(bps);
        
        @display("bgb=800,450");
    types: 
        channel coreline extends ThruputMeteringChannel
        {
            delay = 2ms;
            datarate = coreDatarate;
            thruputDisplayFormat = "b B U";
        }
        channel edgeline extends ThruputMeteringChannel
        {
            delay = 2ms;
            datarate = edgeDatarate;
            thruputDisplayFormat = "b B U";
        }
    submodules:
        H1: StandardHost {
            @display("p=39,222");
            gates:
                ethg[1];
        }
        H2: StandardHost {
            @display("p=680,222");
            gates:
                ethg[1];
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=700,50");
        }
        R1: Router {
            @display("p=115,320");   
        }
        R2: Router {
            @display("p=115,222");
            gates:
                ethg[1];
        }
        R3: Router {
            @display("p=220,320");
        }
        R4: Router {
            @display("p=220,222");
        }
        R5: Router {
            @display("p=330,222");
        }
        R6: Router {
            @display("p=430,222");
        }
        R7: Router {
            @display("p=330,320");
        }
        R12: Router {
            @display("p=430,320");
        }
        R8: Router {
            @display("p=520,222");
        }
        R9: Router {
            @display("p=600,222");
            gates:
                ethg[1];
        }
        R10: Router {
            @display("p=520,320");
        }
        R11: Router {
            @display("p=600,320");
        }
        
    connections:
        H1.ethg++ <--> Eth100M <--> R2.ethg++;
        H2.ethg++ <--> Eth100M <--> R9.ethg++;
        
        R2.pppg++ <--> edgeline <--> R1.pppg++;
        R2.pppg++ <--> edgeline <--> R4.pppg++;
        R1.pppg++ <--> coreline <--> R3.pppg++;
        R3.pppg++ <--> edgeline <--> R4.pppg++;
        R4.pppg++ <--> edgeline <--> R5.pppg++;
        R5.pppg++ <--> edgeline <--> R7.pppg++;
        R5.pppg++ <--> edgeline <--> R6.pppg++;
        R7.pppg++ <--> coreline <--> R12.pppg++;
        R12.pppg++ <--> edgeline <--> R6.pppg++;
        R6.pppg++ <--> edgeline <--> R8.pppg++;
        R8.pppg++ <--> edgeline <--> R10.pppg++;
        R10.pppg++ <--> coreline <--> R11.pppg++;
        R11.pppg++ <--> edgeline <--> R9.pppg++;
        R8.pppg++ <--> edgeline <--> R9.pppg++;
}


