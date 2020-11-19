rmarkdown::render("paper/paper.Rmd",
                  rmarkdown::md_document(
                    preserve_yaml = TRUE),
                  output_file = "paper.md"
                    )
