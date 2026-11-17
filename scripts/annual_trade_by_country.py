import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# load the raw data and convert dates to datetime
data = pd.read_csv('./data/raw/imports_exports_raw.csv')
data['date'] = pd.to_datetime(data['date'], format='%Y-%m-%d')

# standardize the country name
data['clear_country'] = data['country'].replace({
    'Білорусь-0.4-110': 'Білорусь'
})

# extract the year from each date
data['year'] = data['date'].dt.year

# calculate annual trade totals by country and trade regime
annual_trade = data.groupby(
        ['year', 'clear_country', 'customs_regime'],
        as_index=False
    )['amount'].sum().rename(columns={'amount': 'sum_amount'})

# create a table of import totals by country and year
imports_by_country_year = annual_trade[
    annual_trade['customs_regime'] == 'імпорт'
].pivot_table(
    index='clear_country',
    columns='year',
    values='sum_amount',
    aggfunc='sum',
    fill_value=0
)


# show heat map
plt.figure(figsize=(12, 6))

sns.heatmap(
    imports_by_country_year / 1_000_000,
    cmap='YlGnBu',
    annot=True,
    fmt='.2f',
    linewidths=.5,
    cbar_kws={'label': 'Import Amount'}
)

plt.title('Ukraine electricity imports by country and year')
plt.xlabel('Year')
plt.ylabel('Country')

plt.tight_layout()
plt.show()
