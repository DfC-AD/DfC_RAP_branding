# ##############################################################################
# f_banner.R
# Creates HTML banner header for statistical reports with department logos and 
# NISRA branding based on department
# #############################################################################


if (!exists("nics_theme")) {
  departmental_link <- NULL
} else if (nics_theme == "dof") {
  departmental_link <- "https://www.finance-ni.gov.uk/"
} else if (nics_theme == "teo") {
  departmental_link <- "https://www.executiveoffice-ni.gov.uk/"
} else if (nics_theme == "daera") {
  departmental_link <- "https://www.daera-ni.gov.uk/"
} else if (nics_theme == "dfc") {
  departmental_link <- "https://www.communities-ni.gov.uk/"
} else if (nics_theme == "de") {
  departmental_link <- "https://www.education-ni.gov.uk/"
} else if (nics_theme == "dfe") {
  departmental_link <- "https://www.economy-ni.gov.uk/"
} else if (nics_theme == "dfi") {
  departmental_link <- "https://www.infrastructure-ni.gov.uk/"
} else if (nics_theme == "doh") {
  departmental_link <- "https://www.health-ni.gov.uk/"
} else if (nics_theme == "doj") {
  departmental_link <- "https://www.justice-ni.gov.uk/"
} else if (nics_theme == "bso") {
  departmental_link <- "https://bso.hscni.net/"
} else if (nics_theme == "adr") {
  departmental_link <- "https://www.adruk.org/about-us/working-as-a-partnership-is-fundamental-to-the-success-of-adr-uk/adr-northern-ireland/"
} else {
  departmental_link <- NULL
}

f_banner <- function(title, subtitle = "") {
  require(htmltools)
  div(
    div(
      style = "background-color: var(--nics-banner-bg); padding: 10px",
      div(
        class = "grid mtb",
        if (statistic_type == "as") {
          div(
            style = "display: flex; justify-content: space-between; align-items: center;",
            # Position nisra logo to the left
            div(
              style = "flex: 1; display: flex; justify-content: flex-start;",
              a(
                href = "https://nisra.gov.uk",
                img(src = nisra_logo, alt = "NISRA logo", width = "220px"))
            ),
            div(
              style = "flex: 1; display: flex; justify-content: center;",
              img(src = acc_official_stats, alt = nat_alt, width = "100px")
            ),
            # Position the department logo to the right
            div(
              style = "flex: 1; display: flex; justify-content: flex-end;",
              a(href = departmental_link,
                img(src = dep_logo, alt = dep_alt, width = "200px"))
            )
          )
        } else {
          # If the national statistics logo isn't present space between department and nisra logo
          div(
            style = "display: flex; justify-content: space-between; align-items: center;",
            a(
              href = "https://nisra.gov.uk",
              img(src = nisra_logo, alt = "NISRA logo", width = "220px")),
            a(
              href = departmental_link,
              img(src = dep_logo, alt = dep_alt, width = "200px"))
          )
        }
      ),
      div(
        style = "display: flex; justify-content: center; text-align: center;",
        h1(style = "color: #ffffff; font-size: 30px;", class = "toc-ignore", title)
      ),
      div(style = "font-size: 18px; color: #ffffff; display: flex;
          justify-content: center; text-align: center;", subtitle)
    ),
    div(style = paste0("background-color: var(--nics-banner-highlight);
                       height: 9px; width: 100%;"))
  )
}