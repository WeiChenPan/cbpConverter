# cbpConverter

Author: Pan, Wei-Chen

##### This is an R shiny app that was created to convert Excel (.xsls) to cBioportal main 12 input formats (.txt) for clinical data.
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
11. data_mutations.txt (This is a fake data because it's just for uploading clinical data)
12. case_lists/case_list.txt


## Preparation
* step 1: Update R to the latest version.
* step 2: Install the required packages.
```
install.packages(c("shiny", "shinydashboard", "DT", "readxl"))
```
* step 3: Once the packages are installed, library them into your R session.

## Tutorial
#### The input EXCEL file format
* The file name must end with **".xlsx"**.
* Conent includes **Codebook** (row 1 ~ row 5) and **Data** (start at row 6). And the order of row 1 to row 5 should be Priority, Type, Long description, Short description, and Column_ID.

   ![Screenshot from 2024-12-12 14-41-41](https://github.com/user-attachments/assets/f74c3239-479c-4987-be3e-ee7e965c64c0)
* Missing value must be **"."**, it will be replaced with blank " " in cbpConverter for cBioportal. 
 
 
