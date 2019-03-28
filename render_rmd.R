library(tidyverse)
library(fs)
library(furrr)

plan(multiprocess(workers = 4))

rmarkdown::render("01_introduction_course.Rmd", envir = new.env())
rmarkdown::render("02_introduction_r.Rmd", envir = new.env())
rmarkdown::render("03_introduction_data_manipulation.Rmd", envir = new.env())
rmarkdown::render("04_introduction_ggplot2.Rmd", envir = new.env())
rmarkdown::render("05_introduction_basic_analysis.Rmd", envir = new.env())
rmarkdown::render("06_pca.Rmd", envir = new.env())
rmarkdown::render("07_rda.Rmd", envir = new.env())
rmarkdown::render("08_glm.Rmd", envir = new.env())
rmarkdown::render("09_spatial_autocorrelation.Rmd", envir = new.env())

# Generate PDF ----------------------------------------

files <- tibble(
  infile = list.files(".", "*.html", full.names = TRUE),
  outfile = path_ext_set(path_ext_remove(infile), "pdf")
)

files <- slice(files, 4)
future_map2(files$infile, files$outfile, xaringan::decktape, args = "-s=4560x2400", .progress = TRUE)
