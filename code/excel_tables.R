###############################################
# Excel tables template
# ---------------------------------------------
# Edit the sections with your own info e.g. Title, BQR link, Pub Link etc
# and "ADD/EDIT TABLES" to create your own
# publication workbook.
###############################################

# Packages ----
library(here)

source(here("code/data_prep.R"))

# Create new workbook ####
wb <- createWorkbook(
  creator = "NISRA Tech Lab",
  title = "Mid-year population statistics for Northern Ireland 2022",
  subject = "Mid-year population statistics for Northern Ireland",
  category = "Population"
)

## Set formatting ####
modifyBaseFont(wb, fontSize = 12, fontName = "Arial")

# Introduction Page ####
addWorksheet(wb, sheetName = "Introduction")

intro_text <- c(
  "Mid-year population statistics for Northern Ireland 2022",
  "The following tables contain population and demography statistics for Northern Ireland. A list of tables is provided in the contents sheet.",
  "Linked report (and infographics):",
  "PUBLICATION LINK",
  pub_date_words_dmy,
  "Quality Information:",
  "BQR LINK",
  "Contact Information:",
  "Joe Bloggs\nTechnology and Support Lab, NISRA\nColby House\nStranmillis Court\nBelfast, BT9 5RR\n\nTelephone: 028 1234 5678\nE-mail: techlab@nisra.gov.uk"
)

writeData(wb, "Introduction",
          x = intro_text
)

addStyle(wb, "Introduction",
         rows = 1,
         cols = 1,
         style = pt
)

addStyle(wb, "Introduction",
         rows = 2:(length(intro_text)),
         cols = 1,
         style = tw,
         gridExpand = TRUE
)

heading_rows <- which(intro_text %in% c(
  "Linked report (and infographics):",
  "Topics covered:",
  "Published:",
  "Contact Information:"
))

addStyle(wb, "Introduction",
         rows = heading_rows,
         cols = 1,
         style = pt2,
         gridExpand = TRUE
)


pub_link <- "https://www.nisra.gov.uk/system/files/statistics/Statistical%20Bulletin%20-%202022%20Mid-year%20Population%20Estimates%20for%20Northern%20Ireland.pdf"
names(pub_link) <- "Mid-year population statistics for Northern Ireland 2022"
class(pub_link) <- "hyperlink"

writeData(wb,
          sheet = "Introduction",
          x = pub_link,
          startRow = which(intro_text == "PUBLICATION LINK"),
          colNames = FALSE
)

bqr_link <- "https://www.nisra.gov.uk/system/files/statistics/MYE22-quality.pdf"
names(bqr_link) <- "Background Quality Report: Mid-year population statistics for Northern Ireland"
class(bqr_link) <- "hyperlink"

writeData(wb,
          sheet = "Introduction",
          x = bqr_link,
          startRow = which(intro_text == "BQR LINK"),
          colNames = FALSE
)

setColWidths(wb, "Introduction", widths = 112, cols = 1)
setRowHeights(wb, "Introduction", rows = c(1, heading_rows), heights = 30)
setRowHeights(wb, "Introduction", rows = 2, heights = 60)

# Contents Page ####

addWorksheet(wb, sheetName = "Contents")


writeData(wb, "Contents",
          x = c(
            "Mid-year population statistics for Northern Ireland 2022",
            "Table of Contents"
          )
)

addStyle(wb, "Contents",
         style = pt,
         rows = 1,
         cols = 1
)

addStyle(wb, "Contents",
         style = pt2,
         rows = 2,
         cols = 1
)

setRowHeights(wb, "Contents", rows = 2, heights = 30)

# cr is a row counter for the contents page see f_worksheet()
cr <- 3

setColWidths(wb, "Contents", widths = 114, cols = 1)

# ADD/EDIT TABLES BELOW ---------------------------------------
# Helper function (stored in functions folder):
#   f_worksheet(wb, sheet_name, contents, title, outlining, tables)
# where `tables` is a list of lists with elements:
#   data  = data.frame
#   title = character
#   note  = character or character vector

# Please refer to "/code/demo/demo_excel_tables_new.R" for a worked example

# TABLE 1 EXAMPLE ----
# (Edit sheet_name, contents, titles, outlining and table objects)
# f_worksheet(
#   wb,
#   sheet_name = "Table_1",
#   contents   = "Table 1: [INSERT DESCRIPTION]",
#   title      = "Table 1: [INSERT TITLE]",
#   outlining  = "outlining [INSERT SHORT OUTLINE]",
#   tables     = list(
#     list(
#       data  = table1_data,
#       title = "Table 1: [INSERT TITLE]",
#       note  = "Notes: [INSERT NOTES HERE]"
#     )
#   )
# )

# TABLE 2 EXAMPLE ----
# f_worksheet(
#   wb,
#   sheet_name = "Table_2",
#   contents   = "Table 2: [INSERT DESCRIPTION]",
#   title      = "Table 2: [INSERT TITLE]",
#   outlining  = "outlining [INSERT SHORT OUTLINE]",
#   tables     = list(
#     list(
#       data  = table2_data,
#       title = "Table 2: [INSERT TITLE]",
#       note  = c(
#         "Notes:",
#         "[Add note line 1]",
#         "[Add note line 2]"
#       )
#     )
#   )
# )

# TABLE 3 EXAMPLE (with two sub-tables) ----
# f_worksheet(
#   wb,
#   sheet_name = "Table_3",
#   contents   = "Table 3: [INSERT DESCRIPTION]",
#   title      = "Table 3: [INSERT TITLE]",
#   outlining  = "outlining [INSERT SHORT OUTLINE]",
#   tables     = list(
#     list(
#       data  = table3a_data,
#       title = "Table 3a: [INSERT TITLE]",
#       note  = c(
#         "Notes:",
#         "[Add note line 1]",
#         "[Add note line 2]"
#       )
#     ),
#     list(
#       data  = table3b_data,
#       title = "Table 3b: [INSERT TITLE]",
#       note  = "Notes: [INSERT NOTES HERE]"
#     )
#   )
# )

# --------------------------------------------------------------
# Copy/paste and adapt the f_worksheet() blocks above
# for any additional tables you need.
# --------------------------------------------------------------


# SAVE WORKBOOK ----
xl_template_filename <- paste0(here(), "/outputs/RAP_template_tables.xlsx")
saveWorkbook(wb, xl_template_filename, overwrite = TRUE)
