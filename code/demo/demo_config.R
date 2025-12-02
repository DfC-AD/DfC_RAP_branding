# Demo specific configuration

library(here)

source(here("code/config.R"))

#### INPUTS AND SETTINGS ####
##### SETTINGS #####

report_final <- FALSE

ifelse(!dir.exists(here("code/demo/demo_outputs")),
  dir.create(here("code/demo/demo_outputs")),
  "Outputs folder exists already"
)

# folder for download button csv and excel files
ifelse(!dir.exists(here("code/demo/demo_outputs/figdata")),
  dir.create(here("code/demo/demo_outputs/figdata")),
  "demo figdata folder exists already"
)

# check if demo excel tables exist. Used in demo_report to embed files
demo_excel_ready <- file.exists(here("code/demo/demo_outputs/RAP_demo_tables.xlsx"))
