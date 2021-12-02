# install packages
#remotes::install_github("datawookie/emayili")

# load packages
library(emayili)
library(xml2)
library(tidyverse)
library(htmltidy)
library(readxl)
library(fs)

## email list
tb <- tibble(Nombre = c("Jesus", "Dominic"), Apellido = c("Fernandéz", "Royé"), Email = c("[email_test1]", "[email_test1]"))

## email send function

aec_sendemail <- function(contactos){
  
  Sys.sleep(1)
  
  subj <- "12 Congreso de la Asociación Española de Climatología 2022"
  
  nombre <- str_c(contactos$Nombre, contactos$Apellido, sep = " ")
  
  email <- envelope() %>%
    from("congreso.12aec@usc.es") %>%
    to(contactos$Email) %>%
    subject(subj) %>%
    render("msg.md") 
  
  smtp <- server(host = "",
                 port = ,
                 username = "",
                 password = "")
  
  smtp(email, verbose = TRUE)

}



split(tb, ~Email) %>% walk(aec_sendemail)
