#----------------------------------------------------------------------------------------------------------
# This R shiny is for the cbioportal v6.0
### App: cbpConverter
# File name: ui.R
# Version: 3.1
# Description: create the shiny application user interface.


# Author: Pan, Wei-Chen
# Created: 2024-06-14
# Last Updated: 2024-11-27
#----------------------------------------------------------------------------------------------------------
library(shiny)
library(shinydashboard)
library(DT)

ui <- dashboardPage(
  dashboardHeader(title = "cbpConverter", titleWidth = 300),
  dashboardSidebar(
    width = 300,
    sidebarMenu(
      menuItem(text = "meta_study", tabName = "meta_study", icon = icon("microscope")),
      menuItem(text = "meta_cancer_type", tabName = "meta_cancer_type", icon = icon("dna")),
      menuItem(text = "cancer_type", tabName = "cancer_type", icon = icon("virus")),
      menuItem(text = "meta_clinical_patient", tabName = "meta_clinical_patient", icon = icon("ghost")),
      menuItem(text = "meta_clinical_sample", tabName = "meta_clinical_sample", icon = icon("skull")),
      menuItem(text = "data_clinical_patient", tabName = "data_clinical_patient", icon = icon("ghost")),
      menuItem(text = "data_clinical_sample", tabName = "data_clinical_sample", icon = icon("skull")),
      menuItem(text = "meta_timeline_xxx", tabName = "meta_timeline_xxx", icon = icon("clock")),
      menuItem(text = "data_timeline_xxx", tabName = "data_timeline_xxx", icon = icon("poo")),
      menuItem(text = "meta_mutations", tabName = "meta_mutations", icon = icon("eye")),
      menuItem(text = "data_mutations", tabName = "data_mutations", icon = icon("fire")),
      menuItem(text = "cases_list", tabName = "cases_list", icon = icon("user"))
    )
  ),
  dashboardBody(
    tabItems(
      ## Create meta_study.txt
      tabItem(tabName = "meta_study",
              h2("Create meta_study.txt"),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    textInput("type_of_cancer", "Type of Cancer", value = ""),
                    textInput("cancer_study_identifier", "Cancer Study Identifier", value = ""),
                    textInput("name", "Name", value = ""),
                    p(style = "color: red", "*The name of the cancer study. (same with the name of study on cBioportal)"),
                    textAreaInput("description", "Description", value = ""),
                    downloadButton("downloadBtn_meta_study", "Download TXT File")
                  ),
                  mainPanel(
                    verbatimTextOutput("preview_meta_study")  # Use verbatimTextOutput for formatted preview
                  )
                )
              )
      ),
      
      ## Create meta_cancer_type.txt
      tabItem(tabName = "meta_cancer_type",
              h2("Create meta_cancer_type.txt"),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    textInput("genetic_alteration_type", "Genetic Alteration Type", value = "CANCER_TYPE"),
                    textInput("datatype", "Datatype", value = "CANCER_TYPE"),
                    downloadButton("downloadBtn_meta_cancer_type", "Download TXT File")
                  ),
                  mainPanel(
                    verbatimTextOutput("preview_meta_cancer_type")  # Use verbatimTextOutput for formatted preview
                  )
                )
              )
      ),
      
      ## Create cancer_type.txt
      tabItem(tabName = "cancer_type", 
              h2("Create cancer_type.txt"),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    textInput("cancer_type_name", "Name of Cancer Type", value = ""),
                    textInput("parent_type_of_cancer", "Parent Type of Cancer", value = "tissue"),
                    downloadButton("downloadBtn_cancer_type", "Download TXT File")
                  ),
                  mainPanel(
                    textOutput("preview_cancer_type")
                  )
                )
              )
      ),
      
      ## Create meta_clinical_patient.txt
      tabItem(tabName = "meta_clinical_patient", 
              h2("Create meta_clinical_patient.txt"),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    downloadButton("downloadBtn_meta_clinical_patient", "Download TXT File")
                  ),
                  mainPanel(
                    verbatimTextOutput("preview_meta_clinical_patient")
                  )
                )
              )
      ),
      
      ## Create meta_clinical_sample.txt
      tabItem(tabName = "meta_clinical_sample", 
              h2("Create meta_clinical_sample.txt"),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    downloadButton("downloadBtn_meta_clinical_sample", "Download TXT File")
                  ),
                  mainPanel(
                    verbatimTextOutput("preview_meta_clinical_sample")
                  )
                )
              )
      ),
      
      ## Create data_clinical_patient.txt
      tabItem(tabName = "data_clinical_patient",
              h2("Create data_clinical_patient.txt"),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    fileInput("fileInput_patient", "Choose Excel File", accept = ".xlsx"),
                    uiOutput("columnSelector_patient"),
                    downloadButton("downloadBtn_patient", "Download TXT File"),
                    p(class = "margin-top-10", style = "color: red", "Note: PATIENT_ID (required): a unique patient ID."),
                    uiOutput("dynamicInputs_patient")  # Dynamic inputs for long headers and type
                  ),
                  mainPanel(
                    DTOutput("preview_patient")
                  )
                ),
                tags$style(HTML("
            .inline {
              display: flex;
              align-items: center;
              margin-bottom: 10px;
            }
            .inline div {
              margin-right: 3px;
            }
            .checkbox-container {
              margin-bottom: 10px;
            }
            .small-label .control-label {
              font-size: 12px;  /* Adjust the size as needed */
            }
          "))
              )
      ),
      
      ## Create data_clinical_sample.txt
      tabItem(tabName = "data_clinical_sample",
              h2("Create data_clinical_sample.txt"),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    fileInput("fileInput_sample", "Choose Excel File", accept = ".xlsx"),
                    uiOutput("selectDeselectAll_sample"),  # Select or deselect all options
                    uiOutput("columnSelector_sample"),
                    downloadButton("downloadBtn_sample", "Download TXT File"),
                    p(class = "margin-top-10", style = "color: red", "Note:", br(), "1.PATIENT_ID (required): a unique patient ID", br(), "2.SAMPLE_ID (required): a unique sample ID."),
                    uiOutput("dynamicInputs_sample")   # Dynamic inputs for long headers and type
                  ),
                  mainPanel(
                    DTOutput("preview_sample")
                  )
                ),
                tags$style(HTML("
            .inline {
              display: flex;
              align-items: center;
              margin-bottom: 10px;
            }
            .inline div {
              margin-right: 3px;
            }
            .checkbox-container {
              margin-bottom: 10px;
            }
            .small-label .control-label {
              font-size: 12px;  /* Adjust the size as needed */
            }
          "))
        )
      ),
      
      ## Create meta_timeline_xxx.txt
      tabItem(tabName = "meta_timeline_xxx",
              h2("Create meta_timeline_xxx.txt"),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    textInput("data_filename", "Data Filename", value = "data_timeline_xxx.txt"),
                    p(style = "color: red", "*xxx means EVENT_TYPE !"),
                    downloadButton("downloadBtn_meta_timeline", "Download TXT File")
                  ),
                  mainPanel(
                    verbatimTextOutput("preview_meta_timeline")  # Use verbatimTextOutput for formatted preview
                  )
                )
             )
      ),
      
      ## Create data_timeline_xxx.txt
      tabItem(tabName = "data_timeline_xxx",
              h2("Create data_timeline_xxx.txt"),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    fileInput("fileInput_timeline", "Choose Excel File", accept = ".xlsx"),
                    # Choose EVENT_TYPE
                    uiOutput("columnSelector_EventType"),  
                    # Select STYLE_SHAPE
                    checkboxGroupInput("style_shape_selector", "Select STYLE_SHAPE", choices = c("Circle", "Square", "Triangle", "Diamond", "Star", "Camera"), inline = TRUE),
                    # Give a checkbox of STYLE_COLOR and fill in
                    checkboxInput("add_text_column", HTML("<b>STYLE_COLOR</b>"), value = FALSE),
                    conditionalPanel(
                      condition = "input.add_text_column == true",
                      textInput("custom_text", "Enter Custom Text", value = "")
                    ),  
                    uiOutput("column_remover"),
                    downloadButton("downloadBtn_timeline", "Download TXT File")
                  ),
                  mainPanel(
                    uiOutput("dynamicInputs_event"),
                    div(style = 'overflow-x: auto; overflow-y: auto; height: 400px;', DTOutput("preview_timeline"))  # Enable scrolling
                  )
                ),
                tags$style(HTML("
            .inline {
              display: flex;
              align-items: center;
              margin-bottom: 10px;
            }
            .inline div {
              margin-right: 3px;
            }
            .checkbox-container {
              margin-bottom: 10px;
            }
            .small-label .control-label {
              font-size: 12px;  /* Adjust the size as needed */
            }
          "))
          )
      ),
      
      ## Create meta_mutations.txt
      tabItem(tabName = "meta_mutations", 
              h2("Create meta_mutations.txt"),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    textInput("profile_description", "Profile Description", value = ""),
                    downloadButton("downloadBtn_meta_mutations", "Download TXT File")
                  ),
                  mainPanel(
                    verbatimTextOutput("preview_meta_mutations")
                  )
                )
              )
      ),
      
      ## Create data_mutations.txt
      tabItem(tabName = "data_mutations", 
              h2("Create data_mutations.txt"),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    downloadButton("downloadBtn_data_mutations", "Download TXT File")
                  ),
                  mainPanel(
                    DTOutput("preview_data_mutations")
                  )
                )
              )
      ),
      
      ## Create cast_list.txt
      tabItem(tabName = "cases_list",
              h2("Create cases_list.txt"),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    fileInput("fileInput_case", "Choose Excel File", accept = ".xlsx"),
                    textInput("cancer_study_identifier", "Cancer Study Identifier", value = ""),
                    textInput("stable_id", "Stable ID", value = ""),
                    p(style = "color: red", "*Be sure to add '_sequenced' aftter your stable_id !"),
                    textInput("case_list_name", "Case List Name", value = ""),
                    textInput("case_list_description", "Case List Description", value = ""),
                    textInput("case_list_category", "Case List Category", value = "all_cases_in_study"),
                    downloadButton("downloadBtn_case_list", "Download TXT File")
                  ),
                  mainPanel(
                    uiOutput("preview_case_list") 
                  )
                )
            )
      )
    )
  )
)


# Return the ui function
shinyUI(ui)