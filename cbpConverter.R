#-------------------------------------------------------------------------------------------------------------------
# This R shiny is for the cbioportal v6.0
## App: cbpConverter
# File name: cbpConverter.R
# Version: 3.1
# Description: This is an R shiny app created for converting excel (.xsls) to cBioportal main 7 input formats (.txt).
#              And also convert timeline table from excel (.xsls) to txt format. 
#              * Additional function: in the sessions of data_clinical_patient and data_clinical_sample, the users can 
#                adjust the decimal they want.
#
#
## Output: 
# 1. meta_study.txt
# 2. meta_cancer_type.txt
# 3. cancer_type.txt
# 4. meta_clicinal_patient.txt
# 5. meta_clicinal_sample.txt
# 6. data_clinical_patient.txt
# 7. data_clinical_sample.txt
# 8. meta_timeline_xxx.txt
# 9. data_timeline_xxx.txt
# 10. case_lists/ases_list.txt
# 11. meta_mutations.txt
# 12. data_mutations.txt (This is a fake data because it's just for upload clinical data)

## Requirements:
# 1.Data&Codebook.xlsx
# 2.ui.R, server.R

# Author: Pan, Wei-Chen
# Created: 2024-07-31
# Last Updated: 2024-11-27
#----------------------------------------------------------------------------------------------------------------------------
library(shiny)

# Source the UI and server code
source("ui.R")
source("server.R")

# Launch the app
shinyApp(ui = ui, server = server)