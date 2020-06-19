

#' Enable the MailtoUI javascript library
#' @description The function activates the capabilities of the MailtoUI javascript library. The user needs to set it at the end of the shiny ui.
#'
#' @return called for the side effect of activating the MailtoUI library
#' @export
#'
#' @examples \donttest{
#'
#' # Put the function at the bottom of the ui
#'
#' use_mailtoR()
#'
#'
#'
#' }



use_mailtoR <- function(){


  htmltools::tags$script(src = "https://cdn.jsdelivr.net/npm/mailtoui@1.0.3/dist/mailtoui-min.js")



}







