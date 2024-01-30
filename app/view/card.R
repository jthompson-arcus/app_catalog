#app/view/card.R

box::use(
  shiny[div, NS]
)

#' @export
ui <- function(id, title, hex = NULL, background = NULL) {
  ns <- NS(id)
  
  div(
    class = "card-box",
    id = ns("card-box"),
    div(
      class = "card-inner-box",
      style = 
        if (!is.null(hex)) {
          sprintf('background-image: url("%s")', hex)
        } else if (!is.null(background)) {
          sprintf('background-image: url("%s")', background)
        },
      if (is.null(hex))
        div(
          class = "card-title",
          title
        )
    )
  )
}