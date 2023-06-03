#Set working Directory
setwd("C:/Users/97150/Desktop/Dubai Property Project") 

#Import file Valuation.csv
Valuation <- read.csv ("Valuation.csv")

View(Valuation) #View the imported data frame

library(dplyr) #Load dplyr library

#selecting the columns I'd be working on and assigning it to a new data frame
Valuation_selected_cols <- select(Valuation,actual_worth,property_type_en,area_id,area_name_en, actual_area,property_total_value)

View(Valuation_selected_cols)
# checking the data type of the columns
str(Valuation_selected_cols)

library("tidyr") #load the tidyr library

# Replacing the null values to NA in the data set which are found in property_total_value

Valuation_selected_cols [Valuation_selected_cols =="null"] <- NA

# Convert NA values to 0 
Valuation_selected_cols[is.na(Valuation_selected_cols)] <- 0

#check if there are any NA values
sum(is.na(Valuation_selected_cols))

#changing data type for three columns to numeric to analyse the data
#actual_worth, actual_area, property_total_value

library(dplyr)
Valuation_selected_cols <- Valuation_selected_cols %>% mutate_at(c('actual_worth','actual_area','property_total_value'),as.numeric)

#checking if columns actual_worth and property_total_value are identical 
Valuation_selected_cols %>% filter(actual_worth != property_total_value)

#checking the data type for each column
sapply(Valuation_selected_cols, class)

View(Valuation_selected_cols)

#Export dataframe [Valuation_selected_cols] into a csv file

write.csv(Valuation_selected_cols, "C:\\Users\\97150\\Desktop\\Dubai Property Project\\Valuation_For_Analysis.csv", row.names=FALSE)
#Next I used excel to merge the valuation_selected_cols with Districts_coordinates table and used VLOOKUP to fill the latitude and longitude for each area name
# Next I created Tableau Viz using the data
#Next question to answer is -	What areas are most popular areas for buyers in Dubai? we can do this by analyzing the Transactions dataset

#Import file Transactions.csv
Transactions <- read.csv ("Transactions.csv")
#selecting the columns I'd be working on and assigning it to a new data frame
Transactions_selected_cols <- select(Transactions,transaction_id,area_name_en)
View(Transactions_selected_cols)

# Replacing the null values to NA in the data set 

Transactions_selected_cols [Transactions_selected_cols =="null"] <- NA

#check if there are any NA values
sum(is.na(Transactions_selected_cols))

#Export dataframe [Transactions_selected_cols] into a csv file

write.csv(Transactions_selected_cols, "C:\\Users\\97150\\Desktop\\Dubai Property Project\\Transactions_For_Analysis.csv", row.names=FALSE)
# Next Question to answer - -	-	Which areas in Dubai have the highest number of available units?
available_units <- read.csv("Units.csv")
#Select the columns needed for analysis
units_for_analysis <- select(available_units,"area_name_en","rooms_en","land_type_en")
View(units_for_analysis)

#Export dataframe [units_for_analysis] into a csv file
write.csv(units_for_analysis, "C:\\Users\\97150\\Desktop\\Dubai Property Project\\units_for_analysis.csv", row.names=FALSE)


