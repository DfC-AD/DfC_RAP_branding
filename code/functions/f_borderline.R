# ##############################################################################
# f_borderline.R
# Generates a horizontal border line for visual separation in HTML reports
# #############################################################################


f_borderline <- function() {
  require(htmltools)
  div(
    div(class = "row", style = "display: flex; margin-top: 15px;
        margin-bottom: 10px"),
    div(class = "border", style = paste0(
      "background-color: var(--nics-three",
      "-bar-colour-1); float:left"
    )),
    div(class = "border", style = paste0(
      "background-color: var(--nics-three",
      "-bar-colour-2); float:left"
    )),
    div(class = "border", style = paste0(
      "background-color: var(--nics-three",
      "-bar-colour-3); float:right"
    )),
  )
}