#-----------------------------------------------------------------------------------------------
# This R shiny is for the cbioportal v6.0
### App: cbpConverter
# File name: server.R
# Version: 3.1
# Description: create the shiny application server.


# Author: Pan, Wei-Chen
# Created: 2024-06-14
# Last Updated: 2024-11-27
#------------------------------------------------------------------------------------------------
library(shiny)
library(shinydashboard)
library(DT)
library(readxl)

server <- function(input, output, session) {
  ## Meta_study
  meta_study <- reactive({
    list(
      type_of_cancer = input$type_of_cancer,
      cancer_study_identifier = input$cancer_study_identifier,
      name = input$name,
      description = input$description,
      add_global_case_list = "true"
    )
  })
  
  output$preview_meta_study <- renderText({
    data_meta_study <- meta_study()
    paste(
      paste0("type_of_cancer: ", data_meta_study$type_of_cancer),
      paste0("cancer_study_identifier: ", data_meta_study$cancer_study_identifier),
      paste0("description: ", data_meta_study$description),
      paste0("add_global_case_list: ", data_meta_study$add_global_case_list),
      sep = "\n"
    )
  })
  
  output$downloadBtn_meta_study <- downloadHandler(
    filename = function() { "meta_study.txt" },
    content = function(file) {
      data_meta_study <- meta_study()
      content_meta_study <- paste(
        paste0("type_of_cancer: ", data_meta_study$type_of_cancer),
        paste0("cancer_study_identifier: ", data_meta_study$cancer_study_identifier),
        paste0("name: ", data_meta_study$name),
        paste0("description: ", data_meta_study$description),
        paste0("add_global_case_list: ", data_meta_study$add_global_case_list),
        sep = "\n"
      )
      writeLines(content_meta_study, file)
    }
  )
  #----------------------------------------------------------------------------------------------
  
  ## Meta_cancer_type
  meta_cancer_type <- reactive({
    list(
      genetic_alteration_type = input$genetic_alteration_type,
      datatype = input$datatype,
      data_filename = "cancer_type.txt"
    )
  })
  
  output$preview_meta_cancer_type <- renderText({
    data_meta_cancer_type <- meta_cancer_type()
    paste(
      paste0("genetic_alteration_type: ", data_meta_cancer_type$genetic_alteration_type),
      paste0("datatype: ", data_meta_cancer_type$datatype),
      paste0("data_filename: ", data_meta_cancer_type$data_filename),
      sep = "\n"
    )
  })
  
  output$downloadBtn_meta_cancer_type <- downloadHandler(
    filename = function() { "meta_cancer_type.txt" },
    content = function(file) {
      data_meta_cancer_type <- meta_cancer_type()
      content_meta_cancer_type <- paste(
        paste0("genetic_alteration_type: ", data_meta_cancer_type$genetic_alteration_type),
        paste0("datatype: ", data_meta_cancer_type$datatype),
        paste0("data_filename: ", data_meta_cancer_type$data_filename),
        sep = "\n"
      )
      writeLines(content_meta_cancer_type, file)
    }
  )
  #----------------------------------------------------------------------------------------------
  
  ## Cancer_type
  cancer_type <- reactive({
    list(
      type_of_cancer = input$type_of_cancer,
      cancer_type_name = input$cancer_type_name,
      dedicated_color = "HotPink",
      parent_type_of_cancer = "tissue"
    )
  })
  
  output$preview_cancer_type <- renderText({
    data_cancer_type <- cancer_type()
    paste(data_cancer_type$type_of_cancer,
          data_cancer_type$cancer_type_name,
          data_cancer_type$dedicated_color,
          data_cancer_type$parent_type_of_cancer,
          sep = "\t")
  })
  
  output$downloadBtn_cancer_type <- downloadHandler(
    filename = function() { "cancer_type.txt" },
    content = function(file) {
      data_cancer_type <- cancer_type()
      content_cancer_type <- paste(data_cancer_type$type_of_cancer,
                                   data_cancer_type$cancer_type_name,
                                   data_cancer_type$dedicated_color,
                                   data_cancer_type$parent_type_of_cancer,
                                   sep = "\t")
      writeLines(content_cancer_type, file)
    }
  )
  
  #----------------------------------------------------------------------------------------------
  
  ## Meta_clinical_patient
  meta_clinical_patient <- reactive({
    list(
      cancer_study_identifier = input$cancer_study_identifier,
      genetic_alteration_type = "CLINICAL",
      datatype = "PATIENT_ATTRIBUTES",
      data_filename = "data_clinical_patient.txt"
    )
  })
  
  output$preview_meta_clinical_patient <- renderText({
    data_meta_clinical_patient <- meta_clinical_patient()
    paste(
      paste0("cancer_study_identifier: ", data_meta_clinical_patient$cancer_study_identifier),
      paste0("genetic_alteration_type: ", data_meta_clinical_patient$genetic_alteration_type),
      paste0("datatype: ", data_meta_clinical_patient$datatype),
      paste0("data_filename: ", data_meta_clinical_patient$data_filename),
      sep = "\n"
    )
  })
  
  output$downloadBtn_meta_clinical_patient <- downloadHandler(
    filename = function() { "meta_clinical_patient.txt" },
    content = function(file) {
      data_meta_clinical_patient <- meta_clinical_patient()
      content_meta_clinical_patient <- paste(
        paste0("cancer_study_identifier: ", data_meta_clinical_patient$cancer_study_identifier),
        paste0("genetic_alteration_type: ", data_meta_clinical_patient$genetic_alteration_type),
        paste0("datatype: ", data_meta_clinical_patient$datatype),
        paste0("data_filename: ", data_meta_clinical_patient$data_filename),
        sep = "\n"
      )
      writeLines(content_meta_clinical_patient, file)
    }
  )
  #----------------------------------------------------------------------------------------------
  
  ## Meta_clinical_sample
  meta_clinical_sample <- reactive({
    list(
      cancer_study_identifier = input$cancer_study_identifier,
      genetic_alteration_type = "CLINICAL",
      datatype = "SAMPLE_ATTRIBUTES",
      data_filename = "data_clinical_sample.txt"
    )
  })
  
  output$preview_meta_clinical_sample <- renderText({
    data_meta_clinical_sample <- meta_clinical_sample()
    paste(
      paste0("cancer_study_identifier: ", data_meta_clinical_sample$cancer_study_identifier),
      paste0("genetic_alteration_type: ", data_meta_clinical_sample$genetic_alteration_type),
      paste0("datatype: ", data_meta_clinical_sample$datatype),
      paste0("data_filename: ", data_meta_clinical_sample$data_filename),
      sep = "\n"
    )
  })
  
  output$downloadBtn_meta_clinical_sample <- downloadHandler(
    filename = function() { "meta_clinical_sample.txt" },
    content = function(file) {
      data_meta_clinical_sample <- meta_clinical_sample()
      content_meta_clinical_sample <- paste(
        paste0("cancer_study_identifier: ", data_meta_clinical_sample$cancer_study_identifier),
        paste0("genetic_alteration_type: ", data_meta_clinical_sample$genetic_alteration_type),
        paste0("datatype: ", data_meta_clinical_sample$datatype),
        paste0("data_filename: ", data_meta_clinical_sample$data_filename),
        sep = "\n"
      )
      writeLines(content_meta_clinical_sample, file)
    }
  )
  #----------------------------------------------------------------------------------------------
  
  ## Data_clinical_patient
  data_patient <- reactiveVal(NULL)
  
  observe({
    file_patient <- input$fileInput_patient
    if (is.null(file_patient))
      return()
    
    df.p <- read_excel(file_patient$datapath, col_names = FALSE)
    
    # Replace "." with an empty string ""
    df.p[df.p == "."] <- ""
    
    # Remove the 2nd row and 1th column
    df.p <- df.p[, -1]
    
    # Assign columns to df
    names(df.p) <- as.character(df.p[5,])
    
    # Reorder the first four rows
    reordered_first_four <- df.p[c(4, 3, 2, 1), ]
    
    # Combine the reordered first four rows with the rest of the dataframe
    df.p <- rbind(reordered_first_four, df.p[-c(1:5), ])
    
    # Ensure unique column names
    colnames(df.p) <- make.names(colnames(df.p), unique = TRUE)
    
    data_patient(df.p)
  })
  
  output$columnSelector_patient <- renderUI({
    req(data_patient())
    checkboxGroupInput("selectedCols_patient", "Manipulate Columns", choices = names(data_patient()), inline = TRUE)
  })
  
  output$dynamicInputs_patient <- renderUI({
    req(data_patient())
    cols_patient <- input$selectedCols_patient
    req(cols_patient)
    
    myUI_patient <- lapply(cols_patient, function(col) {
      # Check if the third row for the column is NUMBER
      if (data_patient()[3, col] == "NUMBER") {
        div(class = "inline",
            div(checkboxInput(inputId = paste0("col_patient_", col), label = col, value = TRUE)),
            div(class = "small-label", textInput(paste0("renameHeader_patient_", col), "Header", col)),
            div(class = "small-label", selectInput(paste0("decimal_patient_", col), "Decimals", choices = 0:6))
        )
      } else {
        div(class = "inline",
            div(checkboxInput(inputId = paste0("col_patient_", col), label = col, value = TRUE)),
            div(class = "small-label", textInput(paste0("renameHeader_patient_", col), "Header", col))
        )
      }
    })
    
    do.call(tagList, myUI_patient)
  })
  
  output$preview_patient <- renderDT({
    req(data_patient())
    if (is.null(input$selectedCols_patient)) return()
    
    df.patient <- data_patient()[, input$selectedCols_patient, drop = FALSE]
    
    # Adjust decimals if specified, but only for data rows (rows 5 and onward)
    for (col in input$selectedCols_patient) {
      if (!is.null(input[[paste0("decimal_patient_", col)]])) {
        num.decimals.p <- as.numeric(input[[paste0("decimal_patient_", col)]])
        df.patient[5:nrow(df.patient), col] <- sapply(df.patient[5:nrow(df.patient), col], function(x) {
          if (is.list(x)) {
            # Handle list elements appropriately, possibly flattening them
            x <- unlist(x)
          }
          if (is.character(x)) {
            x <- as.numeric(x)
          }
          return(format(round(x, num.decimals.p), nsmall = num.decimals.p))
        })
      }
    }
    
    datatable(df.patient, options = list(pageLength = 10, scrollX = TRUE, scrollY = "400px"))
  })
  
  output$downloadBtn_patient <- downloadHandler(
    filename = function() {"data_clinical_patient.txt"},
    content = function(file) {
      req(data_patient())
      selected.cols.patient <- input$selectedCols_patient
      df.patient <- data_patient()[, selected.cols.patient, drop = FALSE]
      
      # Rename headers (Row 5 in the output file)
      rename.header.patient <- sapply(selected.cols.patient, function(col) input[[paste0("renameHeader_patient_", col)]])
      
      # Add "#" in front of the characters (first 4 rows)
      df.patient[1, 1] <- paste0("#", df.patient[1, 1])
      df.patient[2, 1] <- paste0("#", df.patient[2, 1])
      df.patient[3, 1] <- paste0("#", df.patient[3, 1])
      df.patient[4, 1] <- paste0("#", df.patient[4, 1])
      
      # Adjust decimals if specified, but only for data rows (rows 5 and onward)
      for (col in selected.cols.patient) {
        if (!is.null(input[[paste0("decimal_patient_", col)]])) {
          num.decimals.p <- as.numeric(input[[paste0("decimal_patient_", col)]])
          df.patient[5:nrow(df.patient), col] <- sapply(df.patient[5:nrow(df.patient), col], function(x) {
            if (is.list(x)) {
              x <- unlist(x)
            }
            if (is.character(x)) {
              x <- as.numeric(x)
            }
            return(format(round(x, num.decimals.p), nsmall = num.decimals.p))
          })
        }
      }
      
      combined.df.patient <- rbind(df.patient[1:4, ], rename.header.patient, df.patient[5:nrow(df.patient), ])
      
      write.table(combined.df.patient, file, sep = "\t", col.names = FALSE, row.names = FALSE, quote = FALSE)
    })
  #----------------------------------------------------------------------------------------------
  
  ## Data_clinical_sample
  data_sample <- reactiveVal(NULL)
  
  observe({
    file_sample <- input$fileInput_sample
    if (is.null(file_sample))
      return()
    
    df.s <- read_excel(file_sample$datapath, col_names = FALSE)
    
    # Ensure the dataframe has enough rows and columns before subsetting
    if (nrow(df.s) < 4 || ncol(df.s) < 2) {
      warning("The uploaded file does not have the expected structure.")
      return()
    }
    
    # Replace "." with an empty string ""
    df.s[df.s == "."] <- ""
    
    # Replicate column 2 (patient IDs)
    df.sample.col <- df.s[, 2]
    
    # Corrected column binding
    df.s<- cbind(df.s[, 1], df.sample.col, df.s[, 2:ncol(df.s)])
    
    # Assign columns to df
    names(df.s) <- as.character(df.s[5, ])
    
    # Reorder the first four rows
    reordered.first.four.s <- df.s[c(4, 3, 2, 1), ]
    
    # Combine the reordered first four rows with the rest of the dataframe
    df.s <- rbind(reordered.first.four.s, df.s[-c(1:5), ])
    
    # Remove the first four rows and first column from df.s.new
    df.s <- df.s[, -1]
    
    # Ensure unique column names
    colnames(df.s) <- make.names(colnames(df.s), unique = TRUE)
    
    data_sample(df.s)
  })
  
  
  # Checkbox of "select all"
  output$selectDeselectAll_sample <- renderUI({
    req(data_sample())
      checkboxInput("selectAll_sample", "Select All", value = FALSE)
  })
  
  output$columnSelector_sample <- renderUI({
    req(data_sample())
    
    
    # Define the observeEvent for the select all checkbox
    observeEvent(input$selectAll_sample, {
      if (input$selectAll_sample) {
        updateCheckboxGroupInput(session, "selectedCols_sample", selected = names(data_sample()))
      } else {
        updateCheckboxGroupInput(session, "selectedCols_sample", selected = character(0))
      }
    }, ignoreInit = TRUE)
    
    checkboxGroupInput("selectedCols_sample", "Manipulate Columns", choices = names(data_sample()), inline = TRUE)
  })
  
  
  output$dynamicInputs_sample <- renderUI({
    req(data_sample())
    cols_sample <- input$selectedCols_sample
    req(cols_sample)
    
    
    myUI_sample <- lapply(cols_sample, function(col) {
      # Check if the third row for the column is NUMBER
      if (data_sample()[3, col] == "NUMBER") {
        div(class = "inline",
            div(checkboxInput(inputId = paste0("col_sample_", col), label = col, value = TRUE)),
            div(class = "small-label", textInput(paste0("renameHeader_sample_", col), "Header", col)),
            div(class = "small-label", selectInput(paste0("decimal_sample_", col), "Decimals", choices = 0:6))
        )
      } else {
        div(class = "inline",
            div(checkboxInput(inputId = paste0("col_sample_", col), label = col, value = TRUE)),
            div(class = "small-label", textInput(paste0("renameHeader_sample_", col), "Header", col))
        )
      }
    })
    do.call(tagList, myUI_sample)
  })
  
  output$preview_sample <- renderDT({
    req(data_sample())
    if (is.null(input$selectedCols_sample)) return()
    
    df.sample <- data_sample()[, input$selectedCols_sample, drop = FALSE]
    
    # Adjust decimals if specified, but only for data rows (rows 6 and onward)
    for (col in input$selectedCols_sample) {
      if (!is.null(input[[paste0("decimal_sample_", col)]])) {
        num.decimals <- as.numeric(input[[paste0("decimal_sample_", col)]])
        df.sample[5:nrow(df.sample), col] <- as.character(format(round(as.numeric(df.sample[5:nrow(df.sample), col]), num.decimals), nsmall = num.decimals))
      }
    }
    
    datatable(df.sample, options = list(pageLength = 10, scrollX = TRUE, scrollY = "400px"))
  })
  
  
  # Download handler needs to incorporate the decimal adjustment
  output$downloadBtn_sample <- downloadHandler(
    filename = function() {"data_clinical_sample.txt"},
    content = function(file) {
      req(data_sample())
      selected.cols.sample <- input$selectedCols_sample
      df.sample <- data_sample()[, selected.cols.sample, drop = FALSE]
     
      # Rename headers (Row 5 in output file)
      rename.header.sample <- sapply(selected.cols.sample, function(col) input[[paste0("renameHeader_sample_", col)]])
      
      # Add "#" in front of the characters (first 4 rows) !!
      df.sample[1, 1] <- paste0("#", df.sample[1, 1])
      df.sample[2, 1] <- paste0("#", df.sample[2, 1])
      df.sample[3, 1] <- paste0("#", df.sample[3, 1])
      df.sample[4, 1] <- paste0("#", df.sample[4, 1])
      
      
      # Adjust decimals if specified, but only for data rows (rows 5 and onward)
      for (col in selected.cols.sample) {
        if (!is.null(input[[paste0("decimal_sample_", col)]])) {
          num.decimals <- as.numeric(input[[paste0("decimal_sample_", col)]])
          df.sample[5:nrow(df.sample), col] <- as.character(format(round(as.numeric(df.sample[5:nrow(df.sample), col]), num.decimals), nsmall = num.decimals))
        }
      }
      
      # Combine headers and data rows
      combined.df.sample <- rbind(df.sample[1:4, ], rename.header.sample, df.sample[5:nrow(df.sample), ])
      
      
      write.table(combined.df.sample, file, sep = "\t", col.names = FALSE, row.names = FALSE, quote = FALSE)
    })
  #----------------------------------------------------------------------------------------------
  
  ## Meta_timeline
  meta_timeline <- reactive({
    list(
      cancer_study_identifier = input$cancer_study_identifier,
      genetic_alteration_type = "CLINICAL",
      datatype = "TIMELINE",
      data_filename = input$data_filename
    )
  })
  
  output$preview_meta_timeline <- renderText({
    data_meta_timeline <- meta_timeline()
    paste(
      paste0("cancer_study_identifier: ", data_meta_timeline$cancer_study_identifier),
      paste0("genetic_alteration_type: ", data_meta_timeline$genetic_alteration_type),
      paste0("datatype: ", data_meta_timeline$datatype),
      paste0("data_filename: ", data_meta_timeline$data_filename),
      sep = "\n"
    )
  })
  
  output$downloadBtn_meta_timeline <- downloadHandler(
    filename = function() { "meta_timeline_xxx.txt" },
    content = function(file) {
      data_meta_timeline <- meta_timeline()
      content_meta_timeline <- paste(
        paste0("cancer_study_identifier: ", data_meta_timeline$cancer_study_identifier),
        paste0("genetic_alteration_type: ", data_meta_timeline$genetic_alteration_type),
        paste0("datatype: ", data_meta_timeline$datatype),
        paste0("data_filename: ", data_meta_timeline$data_filename),
        sep = "\n"
      )
      writeLines(content_meta_timeline, file)
    }
  )
  #----------------------------------------------------------------------------------------------
  
  ## Data_timeline_xxx
  # Reactive value to store the dataframes
  data_time_list <- reactiveVal(list())
  
  # Reactive value to store unique event types
  event_types <- reactiveVal(NULL)
  
  # Reactive value to store the columns
  original_columns <- reactiveVal(NULL)
  removed_columns <- reactiveVal(c())
  
  observe({
    file_time <- input$fileInput_timeline
    if (is.null(file_time))
      return()
    
    # Read the timeline table
    df.t <- read_excel(file_time$datapath, col_names = TRUE)
    
    # Store the original columns
    original_columns(names(df.t))
    
    # Split the dataframe into smaller dataframes
    n <- ceiling(nrow(df.t) / 6 )
    df.list <- split(df.t, rep(1:6, each = n, length.out = nrow(df.t)))
    
    # Store the list of smaller dataframes in reactive value
    data_time_list(df.list)
    
    # Store unique event types in reactive value
    event_types(unique(df.t$EVENT_TYPE))
    
    # Generate the column remover UI
    output$column_remover <- renderUI({
      checkboxGroupInput("remove_columns", "Remove Columns", choices = original_columns())
    })
  })  
  
  # Observe input from checkbox and text input for new column
  observe({
    df.list <- data_time_list()
    
    if (input$add_text_column) {
      req(input$custom_text)
      df.list <- lapply(df.list, function(df) {
        df$STYLE_COLOR <- input$custom_text
        df
      })
    } else {
      df.list <- lapply(df.list, function(df) {
        df$STYLE_COLOR <- NULL
        df
      })
    }
    data_time_list(df.list)
  })
  
  # Checkbox of "EVENT_TYPE"
  output$columnSelector_EventType <- renderUI({
    req(event_types())
    checkboxGroupInput("selectedRows_Event", "Select Event Types", choices = event_types(), inline = TRUE)
  })
  
  # Combine filtered dataframes from all parts
  combined_data <- reactive({
    req(data_time_list())
    req(input$selectedRows_Event)
    
    df.list <- data_time_list()
    selected_events <- input$selectedRows_Event
    
    # Filter each dataframe based on selected event types
    filtered_dfs <- lapply(df.list, function(df) {
      df[df$EVENT_TYPE %in% selected_events, ]
    })
    
    # Combine the filtered dataframes
    combined_df <- do.call(rbind, filtered_dfs)
    
    # Add the selected STYLE_SHAPE column
    if (!is.null(input$style_shape_selector) && length(input$style_shape_selector) == 1) {
      combined_df$STYLE_SHAPE <- input$style_shape_selector
    }
    
    # Remove selected columns
    if (!is.null(input$remove_columns)) {
      combined_df <- combined_df[, !names(combined_df) %in% input$remove_columns, drop = FALSE]
    }
    
    # Return the combined dataframe
    combined_df
  })
  
  output$preview_timeline <- renderDT({
    datatable(combined_data(), options = list(pageLength = 10, scrollX = TRUE, scrollY = "400px"))
  })
  
  # Download handler for combined data as txt file
  output$downloadBtn_timeline <- downloadHandler(
    filename = function() { "data_timeline_xxx.txt" },
    content = function(file) {
      write.table(combined_data(), file, sep = "\t", col.names = TRUE, row.names = FALSE, quote = FALSE, na = "")
    }
  )
  
  # UI to display the combined dataframe
  output$dynamicInputs_event <- renderUI({
    DTOutput("preview_timeline")
  })
  
  #----------------------------------------------------------------------------------------------
  
  ## Meta_mutations
  meta_mutations <- reactive({
    list(
      cancer_study_identifier = input$cancer_study_identifier,
      genetic_alteration_type = "MUTATION_EXTENDED",
      stable_id = "mutations",
      datatype = "MAF",
      show_profile_in_analysis_tab = "true",
      profile_description = input$profile_description,
      profile_name = "Mutations",
      data_filename = "data_mutations.txt"
    )
  })
  
  output$preview_meta_mutations <- renderText({
    data_meta_mutations <- meta_mutations()
    paste(
      paste0("cancer_study_identifier: ", data_meta_mutations$cancer_study_identifier),
      paste0("genetic_alteration_type: ", data_meta_mutations$genetic_alteration_type),
      paste0("stable_id: ", data_meta_mutations$stable_id),
      paste0("datatype: ", data_meta_mutations$datatype),
      paste0("show_profile_in_analysis_tab: ", data_meta_mutations$show_profile_in_analysis_tab),
      paste0("profile_description: ", data_meta_mutations$profile_description),
      paste0("profile_name: ", data_meta_mutations$profile_name),
      paste0("data_filename: ", data_meta_mutations$data_filename),
      sep = "\n"
    )
  })
  
  output$downloadBtn_meta_mutations <- downloadHandler(
    filename = function() { "meta_mutations.txt" },
    content = function(file) {
      data_meta_mutations <- meta_mutations()
      content_meta_mutations <- paste(
        paste0("cancer_study_identifier: ", data_meta_mutations$cancer_study_identifier),
        paste0("genetic_alteration_type: ", data_meta_mutations$genetic_alteration_type),
        paste0("stable_id: ", data_meta_mutations$stable_id),
        paste0("datatype: ", data_meta_mutations$datatype),
        paste0("show_profile_in_analysis_tab: ", data_meta_mutations$show_profile_in_analysis_tab),
        paste0("profile_description: ", data_meta_mutations$profile_description),
        paste0("profile_name: ", data_meta_mutations$profile_name),
        paste0("data_filename: ", data_meta_mutations$data_filename),
        sep = "\n"
      )
      writeLines(content_meta_mutations, file)
    }
  )
  #----------------------------------------------------------------------------------------------
  
  ## Data_mutations
  data_mutations <- data.frame(
    Hugo_Symbol = "CACNA1H",
    Entrez_Gene_Id = 0,
    Center = "John_Hopkins",
    NCBI_Build = "GRCh37",
    Chromosome = 16,
    Start_Position = 1248690,
    End_Position = 1248692,
    Strand = "+",
    Consequence = "inframe_deletion",
    Variant_Classification = "In_Frame_Del",
    Variant_Type = "DEL",
    Reference_Allele = "TCT",
    Tumor_Seq_Allele1 = "TCT",
    Tumor_Seq_Allele2 = "-",
    dbSNP_RS = "NA",
    dbSNP_Val_Status = "NA",
    Tumor_Sample_Barcode = 4112,
    Matched_Norm_Sample_Barcode = "NA",
    dbSNP_Val_RS = "NA",
    dbSNP_Val_Statu = "NA",
    Match_Norm_Seq_Allele1 = "NA",
    Match_Norm_Seq_Allele2 = "NA",
    Tumor_Validation_Allele1 = "NA",
    Tumor_Validation_Allele2 = "NA",
    Match_Norm_Validation_Allele1 = "NA",
    Match_Norm_Validation_Allele2 = "NA",
    Verification_Status = "NA",
    Validation_Status = "NA",
    Mutation_Status = "NA",
    Sequencing_Phase = "NA",
    Sequence_Source = "NA",
    Validation_Method = "NA",
    Score = "NA",
    BAM_File = "NA",
    Sequencer = "Illumina HiSeq",
    t_ref_count = ".",	
    t_alt_count = ".",
    n_ref_count = ".",
    n_alt_count = ".",
    HGVSc = "ENST00000348261.5:c.724_726del",
    HGVSp = "p.Phe242del",
    HGVSp_Short = "p.F242del",
    Transcript_ID = "ENST00000348261",
    RefSeq = "NM_021098.2",
    Protein_position = 240,
    Codons = "gTCTtc/gtc",
    Hotspot = 0,
    n_depth = 0,
    t_depth = 0,
    stringsAsFactors = FALSE
  )
  
  output$preview_data_mutations <- renderDT({
    datatable(data_mutations, options = list(pageLength = 10, scrollX = TRUE))
  })
  
  output$downloadBtn_data_mutations <- downloadHandler(
    filename = function() { "data_mutations.txt" },
    content = function(file) {
      write.table(data_mutations, file, sep = "\t", row.names = FALSE, quote = FALSE)
    }
  )
  #----------------------------------------------------------------------------------------------
  
  ## Case_list
  data_case <- reactive({
    req(input$fileInput_case)  # Ensure file is uploaded
    
    # Read Excel file
    df.c <- read_excel(input$fileInput_case$datapath, col_names = FALSE)
    
    # Remove the first 5 rows and first column
    df.c <- df.c[-c(1:5), -1]
    
    # Subset the first column (Patient IDs)
    case_ids <- df.c[[1]]  # Select first column
    case_ids <- as.character(case_ids)  # Convert to character vector
    
    # Return processed patient IDs
    case_ids
  })
  
  # Reactive function to generate case_list
  case_list <- reactive({
    req(data_case())  # Ensure data is available
    
    list(
      cancer_study_identifier = input$cancer_study_identifier,
      stable_id = input$stable_id,
      case_list_name = input$case_list_name,
      case_list_description = input$case_list_description,
      case_list_category = input$case_list_category,
      case_list_ids = paste(data_case(), collapse = "\t")  # Tab-delimited patient IDs
    )
  })
  
  
  # Preview case_list as formatted text
  output$preview_case_list <- renderUI({
    # Placeholder content when no file is uploaded
    if (is.null(input$fileInput_case)) {
      return(tags$div(
        style = "background-color: #f8f9fa; border: 1px solid #ddd; padding: 15px; border-radius: 5px;
        font-family: sans-serif; font-size: 12px; line-height: 1.6;",
        HTML("<span style='color: gray;'>Please upload a file and fill in the fields to preview the case list.</span>")
      ))
    }
    
    # Generate case list preview if the file has been processed
    data_case_list <- case_list()
    
    # Styled background panel for the preview
    tags$div(
      style = "background-color: #f8f9fa; border: 1px solid #ddd; padding: 15px; border-radius: 5px;
      font-family: sans-serif; font-size: 15px; line-height: 1.8;",
      HTML(paste(
        paste0("<b>cancer_study_identifier:</b> ", data_case_list$cancer_study_identifier),
        paste0("<b>stable_id:</b> ", data_case_list$stable_id),
        paste0("<b>case_list_name:</b> ", data_case_list$case_list_name),
        paste0("<b>case_list_description:</b> ", data_case_list$case_list_description),
        paste0("<b>case_list_category:</b> ", data_case_list$case_list_category),
        paste0("<b>case_list_ids:</b> ", data_case_list$case_list_ids),
        sep = "<br/>"
      ))
    )
  })
  
  
  # Download case_list.txt
  output$downloadBtn_case_list <- downloadHandler(
    
    filename = function() {"cases_list.txt"},    
    content = function(file) {

      
      # Define the directory path using `here`
      dir_path <- "case_lists"
        
      # Check if the directory exists; if not, create it
      if (!dir.exists(dir_path)) {
          dir.create(dir_path, recursive = TRUE)
        }
      
      # Build the file path within the directory
      file_path <- file.path(dir_path, "cases_list.txt")  
      
      data_case_list <- case_list()
      content_case_list <- paste(
        paste0("cancer_study_identifier: ", data_case_list$cancer_study_identifier),
        paste0("stable_id: ", data_case_list$stable_id),
        paste0("case_list_name: ", data_case_list$case_list_name),
        paste0("case_list_description: ", data_case_list$case_list_description),
        paste0("case_list_category: ", data_case_list$case_list_category),
        paste0("case_list_ids: ", data_case_list$case_list_ids),
        sep = "\n"
      )
      
      writeLines(content_case_list, file_path)
    }
  )
}


# Return the server function
shinyServer(server)
