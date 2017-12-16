# get results form epitools ausvet

epitools_2by2 <- function(a, b, c, d, Digits, Conf, StudyType){
  
  library(tidyverse)
  library(rvest)
  
  header <- "http://epitools.ausvet.com.au/content.php?page=2by2Table&Disease=Disease&Exposure=Exposure&"

  call <- match.call()
  call <- stringr::str_replace_all(paste(names(call[-1]), "=",
                                         as.character(call)[-1],
                                         collapse = "&"), " ", "")
  epi <- read_html(paste0(header,call)) %>% 
    html_nodes("table") %>%
    .[c(3,5,7,9)] %>%
    map(html_table, fill = TRUE) %>%
    set_names(c("data", "expected", "rates", "tests"))
}
