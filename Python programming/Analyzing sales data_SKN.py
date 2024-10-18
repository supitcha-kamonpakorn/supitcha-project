# import data
import pandas as pd
df = pd.read_csv("sample-store.csv")

# preview top 5 rows
df.head(3)

# shape of dataframe
df.shape

# see data frame information using .info()
df.info()


# We can use pd.to_datetime() function to convert columns 'Order Date' and 'Ship Date' to datetime.
# example of pd.to_datetime() function
pd.to_datetime(df['Order Date'].head(), format='%m/%d/%Y')

# TODO - convert order date and ship date to datetime in the original dataframe
df['Order Date'] = pd.to_datetime(df['Order Date'], format='%m/%d/%Y')
df['Ship Date'] = pd.to_datetime(df['Ship Date'], format='%m/%d/%Y')
df.head()
df.info()

# TODO - count nan in postal code column
df.isnull().sum()

# TODO - filter rows with missing values
# filter missing value in column postal code column
df[df['Postal Code'].isna()].head()

# TODO - Explore this dataset on your owns, ask your own questions
# TODO 01 - how many columns, rows in this dataset
df.shape
# 21 columns and 9994 rows

# TODO 02 - is there any missing values?, if there is, which colunm? how many nan values?
df.isnull().sum()
# Yes, there is Postel Code and 11 nan values.

# TODO 03 - your friend ask for `California` data, filter it and export csv for him
df[df['State'] == 'California'].to_csv('California.csv', index=False)

# TODO 04 - your friend ask for all order data in `California` and `Texas` in 2017 (look at Order Date), send him csv file
df[(df['State'].isin(['California', 'Texas'])) & (df['Order Date'].dt.year == 2017)].to_csv('California_Texas_2017.csv', index=False)

# TODO 05 - how much total sales, average sales, and standard deviation of sales your company make in 2017
#total sales
total_sales = df['Sales'].sum()

#average sales
avg_sales = df['Sales'].mean()

#standard deviation of sales
std_sales = df['Sales'].std()

print('Total sales: ', total_sales)
print('Average sales: ', avg_sales)
print('Standard deviation of sales: ', std_sales)

# TODO 06 - which Segment has the highest profit in 2018
segment_profit = df[df['Order Date'].dt.year == 2018].groupby('Segment')['Profit'].sum()
print(segment_profit)
print(segment_profit.idxmax())

# TODO 07 - which top 5 States have the least total sales between 15 April 2019 - 31 December 2019
# group by more than one column
df[(df['Order Date'] >= '2019-04-15') & (df['Order Date'] <= '2019-12-31')].groupby('State')['Sales'].sum().sort_values(ascending=True).head(5)

# TODO 08 - what is the proportion of total sales (%) in West + Central in 2019 e.g. 25%
df[(df['Order Date'].dt.year == 2019) & (df['Region'].isin(['West', 'Central']))]['Sales'].sum() / df[(df['Order Date'].dt.year == 2019)]['Sales'].sum()

# TODO 09 - find top 10 popular products in terms of number of orders vs. total sales during 2019-2020
df[df['Order Date'].dt.year.isin([2019, 2020])].groupby('Product Name')['Order ID'].count().sort_values(ascending=False).head(10)

# TODO 10 - plot at least 2 plots, any plot you think interesting :)
# bar plot for segment
df['Segment'].value_counts().plot(kind='bar', title='Segment',color=['salmon','orange', 'gold'])

# scatter plot sale and profit
# scatter plot
df[['Sales', 'Profit']]\
					.plot(x='Sales', y='Profit',\
					kind="scatter", color="orange")

# TODO Bonus - use np.where() to create new column in dataframe to help you answer your own questions
import numpy as np
df['new_column'] = np.where(df['Sales'] > 1000, 'High', 'Low')
df.head()
