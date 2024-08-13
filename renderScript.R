library(tidyverse)

#This is a brief script I am writing to more efficiently output the data 
#checking code. Instead of editing the RMarkdown file, you should edit
#this file! This way the RMarkdown document will output for each different
#day with a different name. This is crucial for keep a log from day to day!

#This also allows us to check several days at once - by creating a loop and
#looping through different days instead of just defining one day.

#TYPE IN THE NAME OF THE DATE YOU ARE INTERESTED IN AS "%m-%d-%Y"
dateOfInterest <- as.Date(c("08-10-2024","08-11-2024"), format = "%m-%d-%Y")
#if you are interested in running multiple days at once using a single data
#dump, instead, enter these as a list separated by commas.

#CHANGE THESE TO THE NAME OF THE DATA DUMP FILES
data_SOL <- read_csv("in/Solitaired/researchstudy-8-12-24-3-05 PM.csv")
data_TMB <- read_csv("in/TMB/solitairecog_data_20240813031709.csv")

for(i in dateOfInterest){
  rmarkdown::render(input = "dataChecking.Rmd",
                    output_file = paste0("Out/analysis_", as.Date(i), ".html"),
                    params = list(dateOfInterest = as.Date(i),
                                  data_SOL = data_SOL,
                                  data_TMB = data_TMB))
}
