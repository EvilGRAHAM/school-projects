# Libraries ----------
library(shiny, warn.conflicts = FALSE, quietly = TRUE)
library(shinythemes, warn.conflicts = FALSE, quietly = TRUE)
library(shinydashboard, warn.conflicts = FALSE, quietly = TRUE)
library(tidyverse, warn.conflicts = FALSE, quietly = TRUE)


# Dashboard Header ----------
db_header <- dashboardHeader(
  title = "PANSS Testing"
)


# Dashboard Sidebar ----------
db_sidebar <- dashboardSidebar(
  sidebarMenu(
    selectizeInput(
      inputId = "question_set"
      ,label = "Questions Displayed"
      ,choices = 
        c(
          "Positive" = "P"
          ,"Negative" = "N"
          ,"Generic" = "G"
        )
    )
    ,checkboxInput(
      inputId = "by_lang"
      ,"Facet by Language"
      ,value = FALSE
    )
    ,numericInput(
      inputId = "rater_num"
      ,label = "Enter your Rater ID"
      ,value = 1
      ,min = 1
      # ,max = 81
      ,step = 1
    )
  )
)


# Dashboard Body ----------
db_body <- dashboardBody(
  fluidRow(
    column(
      width = 12
      ,box(
        title = "Results"
        ,width = NULL
        ,dataTableOutput("results")
      )
    )
  )
  ,fluidRow(
    column(
      width = 6
      ,box(
        title = "Histograms"
        ,width = NULL
        ,plotOutput("hist")
      )
      ,box(
        title = "Proportions"
        ,width = NULL
        ,plotOutput("prop")
      )
    )
    ,column(
      width = 6
      ,box(
        title = "Violin Plots"
        ,width = NULL
        ,plotOutput("violin")
      )
      ,box(
        title = "Logistic Regression"
        ,width = NULL
        ,verbatimTextOutput("logit")
        #,print(xtable(panss_passes_logit))
      )
    )
  )
)


# UI ----------
shinyUI(
  function(request) {
    dashboardPage(
      skin = "black"
      
      ,db_header
      
      ,db_sidebar
      
      ,db_body
      
    )
  }
)
