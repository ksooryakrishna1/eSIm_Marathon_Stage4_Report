# dvsd-12-Bit_Adder_Using_4-Bit_CLA
This work is to prodece a clean GDS required to print photomasks used for the fabrication of 12-Bit Adder using CLA logic in SkyWater 130 nm PDK. 

# Design Overview
![do](https://user-images.githubusercontent.com/52724861/131190490-52b08edb-dfc4-438d-b01d-22ad6545d28e.png)

# IP specs provided
![ips](https://user-images.githubusercontent.com/52724861/131190599-90534f57-cbe0-485c-a4a7-d5c01278462d.png)

# OpenLane
OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, Fault and custom methodology scripts for design exploration and optimization. For more information check [GitHub Pages](https://openlane.readthedocs.io/en/latest/).

![openlane](https://user-images.githubusercontent.com/52724861/131204189-a078f1b7-29b2-4b99-988f-a1ded0f8d93a.png)

# OpenLane design stages

   1. Synthesis
        - yosys - Performs RTL synthesis
        - abc - Performs technology mapping
        - OpenSTA - Performs static timing analysis on the resulting netlist to generate timing reports
   2. Floorplan and PDN
        - init_fp - Defines the core area for the macro as well as the rows (used for placement) and the tracks (used for routing)
        - ioplacer - Places the macro input and output ports
        - pdn - Generates the power distribution network
        - tapcell - Inserts welltap and decap cells in the floorplan
   3. Placement
        - RePLace - Performs global placement
        - Resizer - Performs optional optimizations on the design
        - OpenDP - Perfroms detailed placement to legalize the globally placed components
   4. CTS
        - TritonCTS - Synthesizes the clock distribution network (the clock tree)
   5. Routing
        - FastRoute - Performs global routing to generate a guide file for the detailed router
        - CU-GR - Another option for performing global routing.
        - TritonRoute - Performs detailed routing
        - SPEF-Extractor - Performs SPEF extraction
   6. GDSII Generation
        - Magic - Streams out the final GDSII layout file from the routed def
        - Klayout - Streams out the final GDSII layout file from the routed def as a back-up
   7. Checks
        - Magic - Performs DRC Checks & Antenna Checks
        - Klayout - Performs DRC Checks
        - Netgen - Performs LVS Checks
        - CVC - Performs Circuit Validity Checks
        - 
# Installation

## Prerequisites

   - Preferred Ubuntu OS)
   -  Docker 19.03.12+
   - GNU Make
   - Python 3.6+ with PIP
   - Click, Pyyaml: pip3 install pyyaml click

Run the following commands to Install Openlane
   
- git clone https://github.com/The-OpenROAD-Project/OpenLane.git

- cd OpenLane/

- make openlane

- make pdk

- make test # This a ~5 minute test that verifies that the flow and the pdk were properly installed



# Running OpenLane
Use the command - make mount

![mount](https://user-images.githubusercontent.com/52724861/131204558-54a5ce8e-843d-4759-b7d3-ee096dc7b545.png)

Use the following example to check the overall setup:

./flow.tcl -design spm

To run openlane in interactive mode

./flow.tcl -interactive

# Pre-layout
## Simulation
Terminal snap (To perform pre-layout simulation)
![sw](https://user-images.githubusercontent.com/52724861/131189482-424db285-a3c6-4ddb-92a1-1d7f0bf54921.png)

#### GTKWave Output Waveform
![12bit_Adder_Simulation](https://user-images.githubusercontent.com/52724861/131189559-6e7e631b-0213-42ff-b48d-ecbad05e19a2.png)

### Synthesis
- In our design, Run - flow.tcl -design dvsd_adder_12bit -src my/dvsd_adder_12bit.v -init_design_config

![flow](https://user-images.githubusercontent.com/52724861/131204635-d3b565a0-5093-4982-9333-ed6d2ebb3e60.png)

Make the Required changes in the generated .config.tcl and Run

flow.tcl -design dvsd_adder_12bit -tag first_run

#### Synthesis Reports
![yosys](https://user-images.githubusercontent.com/52724861/131190367-30fb5795-6ab9-4d62-aadb-34d64851de76.png)
![yosys_d](https://user-images.githubusercontent.com/52724861/131191005-b9a409ac-a062-42b7-bbe4-6021ad53204a.png)

#### Yosys synthesis strategies
![syt_str](https://user-images.githubusercontent.com/52724861/131194132-b9cdbb83-3bad-4edd-ac62-92bfacf7911b.png)
![synt_str_comp](https://user-images.githubusercontent.com/52724861/131194138-68ba7ed4-cb0b-49ce-8fe8-68b8103f7060.png)

### Floorplanning
- Settings in Config.tcl File

![floor_core20](https://user-images.githubusercontent.com/52724861/131195109-cd6291c6-2c8a-4286-a40c-8494286f1fa9.png)

- Floorplan View

![fp](https://user-images.githubusercontent.com/52724861/131197719-a91e4f6b-127d-4211-8c77-79fc7711f4a5.png)

### Placement
- Placement Analysis

![placem_ana](https://user-images.githubusercontent.com/52724861/131198401-c7654856-0a51-4141-9497-ab4febd547e0.png)

- Routing Resources Analysis

![rout_ana](https://user-images.githubusercontent.com/52724861/131203035-dcc61a5c-67d0-4761-94dc-93466304077c.png)

- Final Congestion Report

![cong_rep](https://user-images.githubusercontent.com/52724861/131203060-bd16235d-c39b-4bc9-a05b-2a9db12facce.png)

- Complete Detail Routing

![comp_rout](https://user-images.githubusercontent.com/52724861/131203083-a1c5e6b8-8367-4430-aafb-1fc23cc1914b.png)

- Placement View

![placem](https://user-images.githubusercontent.com/52724861/131198167-6e192e0d-7511-492a-963a-f40ae35a504b.png)

### Layout

![layout](https://user-images.githubusercontent.com/52724861/131203118-92bb560e-e4c4-4bc6-a350-722b5235e71e.png)
- Closer View of the Final Layout Design

![layout_closer](https://user-images.githubusercontent.com/52724861/131203139-a2ff1dbd-9434-489b-bca1-5ded9a5e15b4.png)
 
### Layout vs Schematic

- Subcircuit Summary

![subckt](https://user-images.githubusercontent.com/52724861/131203167-686bd830-94ca-488e-91bf-13057ecabcde.png)

- Subcircuits Pins

![lvs_pins](https://user-images.githubusercontent.com/52724861/131203218-2a29b06a-b6b0-4448-98c4-5ff8dbb97b49.png)

## Final Summary

![final_sum](https://user-images.githubusercontent.com/52724861/131203272-aadc705b-ce25-4b5a-9bd0-e4825e2d63d3.png)



