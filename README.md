# cbpConverter

Author: Pan, Wei-Chen

##### This is a R shiny app that was created to convert Excel (.xsls) to cBioportal main 10 input formats (.txt) for clinical data.
1. meta_study.txt
2. meta_cancer_type.txt               
3. cancer_type.txt                    
4. meta_clicinal_patient.txt          
5. meta_clicinal_sample.txt
6. data_clinical_patient.txt
7. data_clinical_sample.txt
8. meta_timeline_xxx.txt
9. data_timeline_xxx.txt
10. meta_mutations.txt
11. data_mutations.txt (It's a fake data if just for upload clinical data)
12. case_lists/case_list.txt


## Preparation
* step 1: Update R to the latest version.
* step 2: Install the required packages.
```
install.packages(c("shiny", "shinydashboard", "DT", "readxl"))
```
* step 3: Once the packages are installed, library them into your R session:

## Tutorial
