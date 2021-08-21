# eSIm_Marathon_Stage4_Report
12 Bit adder is designed using 4 bit CLA logic 
Test bench is written to verify the design. 
Simulation is carried using iVerilog
![12 bit adder_simu](https://user-images.githubusercontent.com/52724861/130303302-c04f6e12-604e-4f2a-8241-a0b106fb23ec.png)
Installed Openlane in Ubuntu 20.04 OS in the path /home/user/EICT_FDP/
Export path is established using the command - export PDK_ROOT=/home/user/EICT_FDP/
Installation of Docker command is checked by verifying in the path /home/user/EICT_FDP/openlane using command
   - sudo docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) openlane:rc6 
If Docker window is installed properly, a Bash window will appear 
The folder 'adder_12bit' created in /home/user/EICT_FDP/openlane/designs
Tested Verilog code (adder_12bit.v) is copied to the path  - /home/user/EICT_FDP/openlane/designs/adder_12bit/src
To test the design - ./flow.tcl -design adder_12bit -init_design_config 
![design_config](https://user-images.githubusercontent.com/52724861/130303425-c1a6fc20-a90c-43f4-9ab1-867c4f98221a.png)
To store the resulting temparory files - ./flow.tcl -design adder_12bit -tag test_eict -overwrite -interactive
If this step is success, we get the % symbol as the prompt
 ![config_success](https://user-images.githubusercontent.com/52724861/130303444-804db7ba-fa37-4424-97d5-52f67904411e.png)
For synthesis - run_synthesis 
 ![synthe_success](https://user-images.githubusercontent.com/52724861/130303452-cdd3bd90-aee2-4a19-ad04-dc5ce3b6e872.png)
For Floorplan creation - init_floorplan and 4-verilog2def_openroad.def is created and is opened from the location
 /home/user/EICT_FDP/openlane/designs/adder_12bit/runs/test_eict/tmp/floorplan using klayout
 ![floorplan](https://user-images.githubusercontent.com/52724861/130303466-d23654ea-2c11-443f-96fb-09a59cbede4c.png)
To generate the power distribution network - gen_pdn -creates 4-pdn.def and is opened from the location
    /home/user/EICT_FDP/openlane/designs/adder_12bit/runs/test_eict/tmp/floorplan using klayout 
![pdn](https://user-images.githubusercontent.com/52724861/130303488-23e9ca2f-d712-4e3c-8710-602e2f2ec16a.png)
To see the effect of power distribution network and to edit the floorplan.tcl file in   /home/user/EICT_FDP/openlane/configuration/ as
    Changed the Vpitch to 180 from the existing 153.6, 
    Hpitch  to 130 from the existing 153.18, 
    Voffset to 25 from the existing 16.32 , 
    Hoffset to 10 from the existing 16.65, 
    Core Ring to 1 from 0 
These commands run to see the changes - run_synthesis, init_floorplan, gen_pdn - 6-pdn.def is created 
 ![6-pdn](https://user-images.githubusercontent.com/52724861/130303496-de46ac84-ae74-4d1a-95b5-6db8cbcfbcfb.png)
The above values are changed to the corresponding original values and saved.
Power distribution netwrok startegy is changed by editing common_pdn.tcl in 
         /home/user/EICT_FDP/sky130A/libs.tech/openlane/check common_pdn.tcl 
         Edit common_pdn.tcl and add in the place of 
        pdngen::specify_grid stdcell [subst $stdcell]
        add this. - 
            pdngen::specify_grid stdcell {
	        name grid
	        rails {
		    met1 {width 1 offset 0}
		    }
		    straps {
			met4 {width 3 pitch 27.140 offset 13.570}
			met5 {width 6 pitch 27.200 offset 13.600}
			}
			connect {{met1 met4} {met4 met5}}
		}
After editing the above in  common_pdn.tcl in /home/user/EICT_FDP/sky130A/libs.tech/openlane - Do
             run_synthesis, init_floorplan, gen_pdn and open and see the .pdn file  
             ![changed_pdn_network](https://user-images.githubusercontent.com/52724861/130303522-11124192-b5c5-4fde-8450-4299f6702814.png)
	  After running, all thhe above steps are commented and saved.   
To place the input and output pins - place_io. Giving error and not able to resolve the error 
![place_io](https://user-images.githubusercontent.com/52724861/130303539-ffa8a1cb-05d5-43f2-9361-44ed8b38340d.png)


