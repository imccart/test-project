
# Meta --------------------------------------------------------------------

## Title:         Test Project
## Author:        Ian McCarthy
## Date Created:  1/18/2021
## Date Edited:   1/19/2021
## Description:   This file renders/runs all relevant code for the project


# Preliminaries -----------------------------------------------------------
renv::install('rmarkdown')
renv::install('tidyverse')
renv::install('ggplot2')
renv::install('dplyr')
renv::install('lubridate')
renv::install('knitr')
renv::install('kableExtra')
renv::install('readxl')
renv::install('scales')
renv::install('fixest')
renv::install('modelsummary')
renv::install('pacman')
renv::install('bookdown')
                
pacman::p_load(rmarkdown, tidyverse, ggplot2, dplyr, lubridate, knitr, kableExtra,
               readxl, scales, fixest, modelsummary, bookdown)

# Build data --------------------------------------------------------------
source('data-code/_build-data.R')

# Analysis ----------------------------------------------------------------
source('analysis/summary.R')
source('analysis/regression.R')


# Prepare for render ------------------------------------------------------

rm(list=c("dartmouth.data","exp.data","mort.2003","mort.2004","mort.2005","mort.2006",
          "mort.2007","mort.2008","mort.2009","mort.2010","mort.2011","mort.2012",
          "mort.2013","mort.2014","mort.2015","mort.data"))
save.image("data/R_workspace.Rdata")


# Run markdown ------------------------------------------------------------

rmarkdown::render(input = 'abstract.Rmd',
                  output_format = 'all',
                  output_file ='abstract')

rmarkdown::render(input = 'paper.Rmd',
                  output_format = 'all',
                  output_file ='paper')
