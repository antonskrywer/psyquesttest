library(psyquest)
library(psychTestR)
library(htmltools)
library(EDT)
library(EHI)



timeline <- join(
  NAFC_page("favourite_colour",
            "What is your favourite colour?",
            c("Red", "Green", "Blue")),
  elt_save_results_to_disk(complete = TRUE),
  final_page("Thanks for completing the survey!")
)
test <- make_test(elts = timeline)
shiny::runApp(test)

rds_files <- list.files("output/results", 
                        pattern = "\\.rds$", 
                        full.names = TRUE)
res <- readRDS(rds_files[1])
as.tibble(res)


battery(
  questionnaires = c(
                     GMS_standalone(),
                     EDT_standalone(),
                     EHI_standalone()),
  title = "Testbatterie", languages = "de",
  researcher_email = "hello@gmail.com", admin_password = "abcde")

EDT_standalone()

battery(
  questionnaires = SES(),
  title = "Musik und Prosodie", languages = "de",
  researcher_email = "schreibera@stud.hmtm-hannover.de", admin_password = "prosodie2024")
