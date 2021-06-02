# Importing packages
install.packages("tidyverse")
install.packages("readxl")
install.packages("dplyr")
library("tidyverse")
library("readxl")
library("dplyr")

# loading data
nashville_data <- read_excel("Nashville Housing Data.xlsx")

#quick overview of data
str(nashville_data)
summary(nashville_data)
n_distinct(nashville_data$SoldAsVacant)

# dropping unnecessary columns
nashville_data <- subset(nashville_data, select = -OwnerAddress)
nashville_data <- subset(nashville_data, select = -UniqueID)
nashville_data <- subset(nashville_data, select = -ParcelID)

# checking data 
colnames(nashville_data)
n_distinct(nashville_data$LandUse)

# testing correlation
cor.test(nashville_data$SalePrice, nashville_data$Acreage)

cor.test(nashville_data$SalePrice, nashville_data$Bedrooms)

cor.test(nashville_data$SalePrice, nashville_data$YearBuilt)

cor.test(nashville_data$SalePrice, nashville_data$FullBath)

cor.test(nashville_data$SalePrice, nashville_data$HalfBath)

cor.test(nashville_data$SalePrice, nashville_data$SoldAsVacant)

# converting Sold As Vacant to numeric, and checking correlation
nashville_data <- nashville_data %>%
  mutate(SoldAsVacant = ifelse(SoldAsVacant == "No",0,1))
cor.test(nashville_data$SalePrice, nashville_data$SoldAsVacant)
