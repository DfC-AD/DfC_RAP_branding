# Read in the data prep script ####
library(here)
source(here("code/demo/demo_data_prep.R"))

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

# Add rest of worksheets ####

f_worksheet(wb,
            sheet_name = "Table_1",
            contents = "Table 1: Northern Ireland mid-year population estimates by age group and sex, 2022",
            title = "Table 1: Northern Ireland mid-year population estimates by age group and sex, 2022",
            outlining = "outlining mid-year population estimates by age group and sex",
            tables = list(
              list(
                data = df_t1_ss,
                title = "Table 1: Northern Ireland mid-year population estimates by age group and sex, 2022",
                note = "Notes: The estimates are produced using a variety of data sources and statistical models"
              )
            )
            )

f_worksheet(wb,
            sheet_name = "Table_2",
            contents = "Table 2: Mid-year estimates of population aged under 25s by Local Government District (LGD)",
            title = "Table 2: Mid-year estimates of population aged under 25s by Local Government District (LGD)",
            outlining = "outlining mid-year estimates of population aged under 25s by LGD",
            tables = list(
              list(
                data = df_t2_ss,
                title = "Table 2: Mid-year estimates of population aged under 25s by Local Government District (LGD)",
                note = c("Notes:",
                         "The estimates are produced using a variety of data sources and statistical models",
                         "Population aged under 25 on survey date"))
            )
)

f_worksheet(wb,
            sheet_name = "Table_3",
            contents = "Table 3: Population of under 25s and over 65s by LGD 2022",
            title = "Table 3: Population of under 25s and over 65s by LGD 2022",
            outlining = "outlining mid-year estimates of population aged under 25s and over 65 by LGD",
            tables = list(
              list(
                data = df_t3a_ss,
                title = "Table 3a: Population of young people by LGD in Northern Ireland 2022",
                note = c("Notes:",
                         "The estimates are produced using a variety of data sources and statistical models",
                         "Population aged under 25 on survey date",
                         "Youthrate is percentage of under 25s rounded to 1 decimal place")
                ),
              list(
                data = df_t3b_ss,
                title = "Table 3b: Population of elderly people by LGD in NI",
                note = "Notes: The estimates are produced using a variety of data sources and statistical models"
                )
            )
        )

# Save workbook ####

xl_filename <- paste0(here(), "/code/demo/demo_outputs/RAP_demo_tables_new.xlsx")
saveWorkbook(wb, xl_filename, overwrite = TRUE)
