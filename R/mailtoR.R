

#' Create a friendly user interface for sending emails
#'
#' @param email the emails of the recipients
#' @param text the link text that will be displayed on the ui
#' @param subject the subject of the email. Defaults to NULL
#' @param cc the CC (carbon copy) recipients. Defaults to NULL
#' @param bcc the BCC (blind carbon copy) recipients. Defaults to NULL
#' @param body the body of the email. Defaults to NULL
#'
#' @return a user interface for sending emails
#' @export
#'
#' @examples
#'
#'
#' if (interactive()) {
#'
#'
#'
#' ui <- fluidPage(
#'
#'     mailtoR(email = "",
#'     text = "click here to send an email"),
#'     use_mailtoR()
#'
#'     )
#'
#'server <- function(input, output) {
#'
#'
#'}
#'
#'
#'shinyApp(ui, server)
#'
#'
#'
#' }


mailtoR <- function(email,
                    text,
                    subject = NULL,
                    cc = NULL,
                    bcc = NULL,
                    body = NULL) {

  if (is.null(subject) &
      is.null(cc) &
      is.null(bcc) &
      is.null(body)) {

    htmltools::a(
      class = "mailtoui",
      href = glue::glue("mailto:{toString(email)}"),
      glue::glue("{text}")
    )


  } else if (!is.null(subject) &
             is.null(cc) &
             is.null(bcc) &
             is.null(body)) {

    subject <-  utils::URLencode(subject)

    htmltools::a(
      class = "mailtoui",
      href = glue::glue("mailto:{toString(email)}?subject={toString(subject)}"),
      glue::glue("{text}")
    )


  } else if (is.null(subject) &
             !is.null(cc) &
             is.null(bcc) &
             is.null(body)) {

    htmltools::a(
      class = "mailtoui",
      href = glue::glue("mailto:{toString(email)}?cc={toString(cc)}"),
      glue::glue("{text}")
    )


  } else if (is.null(subject) &
             !is.null(cc) &
             !is.null(bcc) &
             is.null(body)) {

    htmltools::a(
      class = "mailtoui",
      href = glue::glue("mailto:{toString(email)}?bcc={toString(bcc)}"),
      glue::glue("{text}")
    )



  } else if (is.null(subject) &
             !is.null(cc) &
             is.null(bcc) &
             !is.null(body)) {

    body <-  utils::URLencode(body)

    htmltools::a(
      class = "mailtoui",
      href = glue::glue("mailto:{toString(email)}?body={toString(body)}"),
      glue::glue("{text}")
    )

  } else {

    body <-  utils::URLencode(body)
    subject <-  utils::URLencode(subject)

    href <- glue::glue(
        "mailto:{toString(email)}?subject={toString(subject)}&cc={toString(cc)}&bcc={toString(bcc)}&body={toString(body)}"
      )

    htmltools::a(class = "mailtoui",
                 href = href,
                 glue::glue("{text}"))


  }


}
