#app/view/grid.R

box::use(
  shiny[column, div, moduleServer, NS, observeEvent, renderUI, req, tagList, tags, uiOutput],
  shiny.semantic[grid, grid_template, multiple_radio]
)
box::use(
  app/logic/constants,
  app/logic/checkbox_buttons
)
box::use(
  app/view/card,
  app/view/info
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  
  div(
    checkbox_buttons$checkbox_buttons(
      ns("sorting_opts"),
      "Sort By:",
      c("Title", "Date Created", "Popularity"),
    ),
  grid(
    grid_template(
      list(areas = rbind(c("main", "info")),
           cols_width = c("2fr", "1fr"))
    ),
    main = div(
      class = "card-grid",
      id = ns("card-grid"),
      div(
        lapply(
          seq_along(constants$app_list),
          function(i) {
            card_id <- ns(paste0("card", i))
            tagList(
              card$ui(card_id, constants$app_list[[i]][["Title"]], constants$app_list[[i]][["Hex"]], constants$app_list[[i]][["Background"]]),
              tags$script(sprintf("document.getElementById('%s').addEventListener('click', function() {Shiny.setInputValue('%s', %d)})", NS(card_id, "card-box"), ns("card_selected"), i))
            )
          }
        )
      )
    ),
    info = uiOutput(ns("card_display"))
  )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    observeEvent(input$sorting_opts, {
      # browser()
    })
    
    output$card_display <- renderUI({
      req(input$card_selected)
      
      info$ui(ns("info"), constants$app_list[[input$card_selected]])
    })
  })
}
