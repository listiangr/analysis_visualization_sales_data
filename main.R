#install the packages
install.packages("dplyr")
install.packages("ggplot2")
install.packages("corrplot")
install.packages("ggcorrplot")

#load the packages
library(dplyr)
library(ggplot2)
library(corrplot)
library(ggcorrplot)

#load the dataset
store <- read.csv("department-store.csv")

#view the dataset
View(store)

#glimpse the dataset
glimpse(store)

#add a column to show the profit
store <- mutate(store, PROFIT = SELLING_PRICE-COST_PRICE)

#add a column to show the profit percent
store <- mutate(store, PROFIT_PERCENT = (PROFIT/COST_PRICE)*100)

#add a column to show the net profit
store <- mutate(store, NET_PROFIT = PROFIT*QUANTITY_DEMANDED)

#view the data after mutate
View(store)

#sort the data grouped by PRODUCT_TYPE
store_group <- group_by(store, PRODUCT_TYPE)

#calculate the average/mean 
summarise(store_group, average = mean(NET_PROFIT))

#calculate the summation 
summarise(store_group, summation = sum(NET_PROFIT))

#calculate the minimum and maximum 
summarise(store_group, minimum = min(NET_PROFIT), mAXIMUM = max(NET_PROFIT))

#calculate the median 
summarise(store_group, median = median(NET_PROFIT))

#calculate the variance 
summarise(store_group, variance = var(NET_PROFIT))

#calculate the standard deviation 
summarise(store_group, standard_deviation = sd(NET_PROFIT))

#calculate the range
summarise(store_group, range = range(NET_PROFIT))

#plot for AVERAGE_QUANTITY & PRODUCT_TYPE
store %>% group_by(PRODUCT_TYPE) %>%
  summarise(AVERAGE = mean(QUANTITY_DEMANDED)) %>%
  ggplot(aes(x = PRODUCT_TYPE, y = AVERAGE))+ 
  geom_col(width = 0.6, fill = "#4169E1")+ 
  theme(text = element_text(size = 9))

#plot for AVERAGE_NET_PROFIT & PRODUCT_TYPE
store %>% group_by(PRODUCT_TYPE) %>% 
  summarise(AVERAGE_NET_PROFIT = mean(NET_PROFIT)) %>%
  ggplot(aes(x = PRODUCT_TYPE, y = AVERAGE_NET_PROFIT))+
  geom_col(width = 0.6, fill = "#4169E1")+ 
  theme(text = element_text(size = 9))

#plot for NET_PROFIT & COMPANY 
store %>%
  ggplot(aes(x = COMPANY, y = NET_PROFIT, color = PRODUCT_CATEGORY)) + geom_point()

#plot for PROFIT & QUANTITY_DEMANDED WHERE PRODUCT_TYPE == "beauty products"
store %>% filter(PRODUCT_TYPE == "beauty products") %>%
  ggplot(aes(x = QUANTITY_DEMANDED, y = PROFIT, color = PRODUCT_CATEGORY)) + geom_point()

#plot for PRICE-DEMAND RELATIONSHIP (AVERAGE_SELLING_PRICE VS QUANTITY_DEMANDED)
store %>%
  ggplot(aes(x = QUANTITY_DEMANDED, y = SELLING_PRICE)) + geom_line(color = "#006400")

#plot for AVERAGE_NET_PROFIT & COMPANY
store %>% group_by(PRODUCT_TYPE, COMPANY) %>% 
  summarise(AVERAGE_NET_PROFIT = mean(NET_PROFIT, na.rm = TRUE)) %>%
  ggplot(aes(x = PRODUCT_TYPE, y = AVERAGE_NET_PROFIT, group = COMPANY, color = COMPANY))+
  geom_line()+ theme(text = element_text(size = 9.5))

#histogram for PROFIT_PERCENT of PRODUCT_CATEGORY
store %>%
  ggplot(aes(x = PROFIT_PERCENT, fill = PRODUCT_CATEGORY))+
  geom_histogram(binwidth = 30)

#histogram for QUANTITY_DEMANDED of PRODUCT_CATEGORY where PRODUCT_TYPE is "snacks"
store %>%
  filter(PRODUCT_TYPE == "snacks") %>%
  ggplot(aes(x = QUANTITY_DEMANDED, fill = PRODUCT_CATEGORY))+
  geom_histogram(binwidth = 30)

##PIE CHART FOR EACH HYGIENE PRODUCT'S QUANTITY DEMANDED.
#STEP1: PREPARE REQUIRED DATA
store1 <-  filter(store, PRODUCT_TYPE == "hygiene")%>%
  group_by(PRODUCT_CATEGORY) %>%
  summarise(QUANTITY_DEMANDED = sum(QUANTITY_DEMANDED))

#STEP2: CALCULATE PERCENTAGE OF EACH PRODUCT
store2 <- store1 %>% 
  arrange(desc(PRODUCT_CATEGORY)) %>%
  mutate(percentage = round(QUANTITY_DEMANDED*100/sum(QUANTITY_DEMANDED))) %>% 
  mutate(y_pos = cumsum(percentage)-0.5*percentage)

# STEP3: CREATE THE PIE CHART
store2 %>%
  ggplot(aes(x = "", percentage, fill = PRODUCT_CATEGORY))+
  geom_bar(width = 1, stat = "identity", color = "white", alpha = .5)+
  coord_polar("y", start = 0)+
  geom_text(aes(y = y_pos, label = paste0(percentage, "%")), color = "black")+
  scale_fill_manual(values = rainbow(7))+ theme_void()


