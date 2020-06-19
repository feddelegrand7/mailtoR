
mailtoR <- function(email, text, subject = NULL, cc = NULL, bcc = NULL, body = NULL){




  # <a class="mailtoui" href="mailto:user1@example.com?subject=Hi%20there!">With subject</a>



  if (is.null(subject) & is.null(cc) & is.null(bcc) & is.null(body)){

    htmltools::a(class = "mailtoui", href = glue::glue("mailto:{toString(email)}"), glue::glue("{text}"))


  } else if (!is.null(subject) & is.null(cc) & is.null(bcc) & is.null(body)) {


    subject <- stringr::str_replace_all(string = subject, pattern = " ", replacement = "%20")

    htmltools::a(class = "mailtoui", href = glue::glue("mailto:{toString(email)}?subject={toString(subject)}"), glue::glue("{text}"))


  } else if (is.null(subject) & !is.null(cc) & is.null(bcc) & is.null(body)) {


    #<a class="mailtoui" href="mailto:user2@example.com?cc=user3@example.com">With cc</a>

    htmltools::a(class = "mailtoui", href = glue::glue("mailto:{toString(email)}?cc={toString(cc)}"), glue::glue("{text}"))


  }else if (is.null(subject) & !is.null(cc) & !is.null(bcc) & is.null(body)) {


  # <a class="mailtoui" href="mailto:user3@example.com?bcc=user1@example.com,user5@example.com">With multiple bcc</a>

    htmltools::a(class = "mailtoui", href = glue::glue("mailto:{toString(email)}?bcc={toString(bcc)}"), glue::glue("{text}"))



  } else if (is.null(subject) & !is.null(cc) & is.null(bcc) & !is.null(body)){


  body <- stringr::str_replace_all(string = body, pattern = " ", replacement = "%20")


    # <a class="mailtoui" href="mailto:user4@example.com?body=Hope%20you're%20doing%20well.">With body</a>

    htmltools::a(class = "mailtoui", href = glue::glue("mailto:{toString(email)}?body={toString(body)}"), glue::glue("{text}"))




  } else {

    body <- stringr::str_replace_all(string = body, pattern = " ", replacement = "%20")
    subject <- stringr::str_replace_all(string = subject, pattern = " ", replacement = "%20")

    href <- glue::glue("mailto:{toString(email)}?subject={toString(subject)}&cc={toString(cc)}&bcc={toString(bcc)}&body={toString(body)}")
    htmltools::a(class = "mailtoui", href = href, glue::glue("{text}"))


    # <a class="mailtoui" href="mailto:user5@example.com,user2@example.com?subject=Winter%20is%20coming&cc=user3@example.com,user4@example.com&bcc=user1@example.com&body=Fear%20cuts%20deeper%20than%20swords.">With all fields</a>





  }







}














