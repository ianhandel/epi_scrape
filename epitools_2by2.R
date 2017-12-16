# get results form epitools ausvet

epitools_2by2 <- function(a, b, c, d, Digits, Conf, StudyType){
  
  Sys.sleep(runif(1, 2, 10))
  
  library(tidyverse)
  library(rvest)
  
  header <- "http://epitools.ausvet.com.au/content.php?page=2by2Table&Disease=Disease&Exposure=Exposure&"
  
  call <- match.call()
  call <- stringr::str_replace_all(paste(names(call[-1]), "=",
                                         as.character(call)[-1],
                                         collapse = "&"), " ", "")
  read_html(paste0(header,call)) %>% 
    html_nodes("table") %>%
    .[c(3,5,7,9)] %>%
    map(html_table, fill = TRUE) %>%
    set_names(c("data", "expected", "rates", "tests"))
  
}


test_data <- 
  list(
    epitools_2by2(22, 33, 44, 55, 3, 0.95, 1),
    epitools_2by2(07, 11, 02, 89, 3, 0.95, 2),
    epitools_2by2(45, 33, 44, 02, 3, 0.95, 3),
    epitools_2by2(19, 19, 07, 36, 3, 0.99, 1),
    epitools_2by2(01, 15, 11, 04, 3, 0.99, 2),
    epitools_2by2(01, 12, 11, 01, 3, 0.99, 2))


save(test_data, file = "epitools_2by2.rda")
