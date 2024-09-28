library(readr)
library(readxl)
library(googlesheets4)
library(jsonlite)
library(dplyr)
library(sqldf)
library(RSQLite)
library(glue)
library(tidyverse)

con <- dbConnect(SQLite(), "restaurant_kangsom.db")

##table staff
id <- c("1", "2")
staff_name <- c("David", "Mary")
staff_salary <- c(25000, 30000)
df_staff <- data.frame(id, staff_name, staff_salary)
dbWriteTable(con, "staff", df_staff, overwrite = TRUE)

dbGetQuery(con, "select staff_name from staff")

##table customer
customer_id <- c("1", "2")
customer_name <- c("Anna", "John")
df_customer <- data.frame(customer_id, customer_name)
dbWriteTable(con, "customer", df_customer, overwrite = TRUE)

dbGetQuery(con, "select customer_name from customer")

##table menu
menu_id <- c("1", "2", "3")
menu_name <- c("pizza", "hotdog", "coke")
menu_price <- c(100, 50, 20)
df_menu <- data.frame(menu_id, menu_name, menu_price)
dbWriteTable(con, "menu", df_menu, overwrite = TRUE)

dbGetQuery(con, "select menu_name from menu")


##table branch
branch_id <- c("1", "2")
branch_name <- c("BKK", "CNX")
df_branch <- data.frame(branch_id, branch_name)
dbWriteTable(con, "branch", df_branch, overwrite = TRUE)

dbGetQuery(con, "select branch_name from branch")

##table order
order_id <- c("001", "002", "003", "004", "005")
order_date <- c('2024-02-01', 
                '2024-02-01', 
                '2024-02-02',
                '2024-02-02',
                '2024-02-03')

df_order <- data.frame(id = c("1","1","2","2","2"), 
                       customer_id = c("1","1","2","2","2"),
                       menu_id = c("1","2","3","1","2"),
                       branch_id = c("1","1","2","2","2"),
                       order_date = c('2024-02-01', 
                                      '2024-02-01', 
                                      '2024-02-02',
                                      '2024-02-02',
                                      '2024-02-03'))
dbWriteTable(con, "orders", df_order, overwrite = TRUE)
dbGetQuery(con, "select order_date from orders")


join_order_Staff <- left_join(df_order, df_staff, by ="id")
join_order_customer <- left_join(df_order, df_customer, by = "customer_id")
join_order_menu <- left_join(df_order, df_menu, by = "menu_id")
join_order_branch <- left_join(df_order, df_branch, by ="branch_id")

##find branch with most orders
Branch_most_order <- dbGetQuery(con, 
                              "select branch_id, 
                                count(branch_id) as branch_count
                                From orders
                                group by branch_id
                                limit 1;"
                                )

branchname_mostorder <- dbGetQuery(con,
                                    "SELECT branch.branch_name, 
                                      COUNT(*)
                                      FROM orders
                                      INNER JOIN branch  ON orders.branch_id = branch.branch_id
                                      GROUP BY branch.branch_name
                                      LIMIT 1"
                                   )


Total_hotdog <- dbGetQuery(con, 
                            "select 
                              count(menu_id) AS Total_hotdog
                              from (
                              select *
                              from orders
                              Where menu_id = 2
                              );"
                           )

dbDisconnect(con)
