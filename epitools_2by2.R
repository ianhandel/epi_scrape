library(tidyverse)
library(rvest)

epitools_web <- read_html("http://epitools.ausvet.com.au/content.php?page=2by2Table&Disease=Disease&Exposure=Exposure&a=34&b=757&c=7&d=2427&Conf=0.95&Digits=3&StudyType=1")


epitools_2by2 <- function(a, b, c, d, Digits, StudyType){
  
  "http://epitools.ausvet.com.au/content.php?page=2by2Table&Disease=Disease&Exposure=Exposure"
  "&a="
  "&b="
  "&c="
  "&d="
  "&Digits="
  "StudyType="
  
  
  
}

epi <- epitools_web %>%
  html_nodes("table") %>%
  .[c(3,5,7,9)] %>%  
  map(html_table, fill = TRUE) %>% 
  set_names(c("data", "expected", "rates", "tests"))

print(epi)
