#-------------------------------------------------------------------------------------------------------------------
### App: cbpConverter
# File name: cbp_app-v2.0.R
# Version: 2.0
# Description: This is a R shiny app created for converting excel (.xsls) to cBioportal main 7 input formats (.txt).
#              And also convert timeline table from excel to txt format. 
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

## Requirements:
# 1.Data&Codebook.xlsx
# 2.ui.R, server.R

# Author: Pan, Wei-Chen
# Created: 2024-07-22
#-------------------------------------------------------------------------------------------------------------------
library(shiny)

# Source the UI and server code
source("ui.R")
source("server.R")

# Launch the app
shinyApp(ui = ui, server = server)
