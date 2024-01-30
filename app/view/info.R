# app/view/info.R

box::use(
  shiny[div, tags],
  shiny.semantic[icon]
)

#' @export
ui <- function(id, details) {
  div(
    class = c("ui raised segment", "card-info"),
    tags$h1(details[["Title"]]),
    div(
      class = "info-links",
      if (!is.null(details[["Links"]][["Application"]])) 
        tags$a(href = details[["Links"]][["Application"]], target = "_blank", list("app", icon("linkify"))),
      if (!is.null(details[["Links"]][["Documentation"]])) 
        tags$a(href = details[["Links"]][["Documentation"]], target = "_blank", list("doc", icon("book"))),
      if (!is.null(details[["Links"]][["Source"]])) 
        tags$a(href = details[["Links"]][["Source"]], target = "_blank", list("src", icon("code"))),
      if (!is.null(details[["Links"]][["Download"]])) 
        tags$a(href = details[["Links"]][["Download"]], target = "_blank", list("dwnld", icon("download")))
    ),
    tags$p(details[["Description"]])
  )
}