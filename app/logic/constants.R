# app/logic/constants.R

box::use(
  jsonlite[fromJSON]
)

#' @export
app_list <- fromJSON("apps.json", simplifyVector = FALSE)
