# tf-module-vpc

This repo is the backend module which contains all the code needed to provision the vpc on AWS

### Information of vpc_id , subnet id , cidrs are important and are needed by other modules which are created  remotely

```
so , how are we going to pass  this information between two different statefiles

* whatever the information that you would like to share  , print that output

* once you print something as an output , that information will also be recorded on the STATEFILE .

* once something is recorded in the statefile , other resources can access it by using "terraform remote state datasource"

```