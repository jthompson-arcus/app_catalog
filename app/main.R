box::use(
  shiny[div, moduleServer, NS, renderUI, tags, uiOutput],
  shiny.semantic[semanticPage]
)
box::use(
  app/view/grid
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  semanticPage(
    grid$ui(ns("grid"))
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    grid$server("grid")
  })
}
