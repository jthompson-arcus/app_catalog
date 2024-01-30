box::use(
  shiny[div, tagList, tags]
)

checkbox_buttons <- function(input_id, label, choices, choice_values = choices, position = "inline") {
  choice_options <- tagList(lapply(seq_along(choices), function(i) {
    div(
      class = c("ui", "invisible", "checkbox"),
      tags$input(
        type = "radio",
        id = choice_values[i],
        name = input_id,
        value = choice_values[i]
      ),
      tags$button(
        `for` = choice_values[i],
        id = paste(input_id, choice_values[i], sep = "_"),
        class = c("ui", "button"),
        choices[i]
      )
    )
  })
  )
  
  div(
    class = c("ui", "form"),
    div(
      id = input_id,
      class = c("fields", "ss-checkbox-input", position),
      tags$label(`for` = input_id, class = "control-label", label),
      choice_options
    ),
    tags$script(sprintf("document.getElementById('%s').getElementsByClassName('button').forEach(function(element) {element.addEventListener('click', function() {element.classList.toggle('-desc')})})", input_id))
  )
}