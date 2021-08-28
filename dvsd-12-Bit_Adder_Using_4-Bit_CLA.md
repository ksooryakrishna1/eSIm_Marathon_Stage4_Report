# dvsd-12-Bit_Adder_Using_4-Bit_CLA
This work is to prodece a clean GDS required to print photomasks used for the fabrication of 12-Bit Adder using CLA logic in SkyWater 130 nm PDK. 

# Design Overview
![do](https://user-images.githubusercontent.com/52724861/131190490-52b08edb-dfc4-438d-b01d-22ad6545d28e.png)

# IP specs provided
![ips](https://user-images.githubusercontent.com/52724861/131190599-90534f57-cbe0-485c-a4a7-d5c01278462d.png)


# Running OpenLane
Use the command - make mount

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

## Layout


