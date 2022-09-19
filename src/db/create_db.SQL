CREATE TABLE IF NOT EXISTS
  company_value_investment_score (
    CompanyID SERIAL PRIMARY KEY,
    unit_price float NOT NULL,
    share float NOT NULL,
    price float NOT NULL,
    earnings float NOT NULL,
    indicator float NOT NULL
  );

CREATE TABLE IF NOT EXISTS
  company_base_info (
    id SERIAl PRIMARY KEY,
    CompanyID INT REFERENCES company_value_investment_score (CompanyID),
    ticker varchar(4) NOT NULL,
    sector varchar NOT NULL,
    country varchar(56) NOT NULL,
    industry varchar NOT NULL,
    shortName varchar NOT NULL,
    market varchar NOT NULL
  );

CREATE TABLE IF NOT EXISTS
  company_financial_info (
    id SERIAL PRIMARY KEY,
    CompanyID INT REFERENCES company_value_investment_score (CompanyID),
    ebitdaMargins float NOT NULL,
    profitMargins float NOT NULL,
    grossMargins float NOT NULL,
    operatingCashflow int NOT NULL,
    revenueGrowth float NOT NULL,
    operatingMargins float NOT NULL,
    ebitda float NOT NULL,
    freeCashflow float NOT NULL,
    earningsGrowth float NOT NULL,
    totalCash float NOT NULL,
    totalDebt float NOT NULL,
    totalCashPerShare float NOT NULL,
    financialCurrency varchar(3) NOT NULL,
    sharesOutstanding_all_shares float NOT NULL
  );

CREATE TABLE IF NOT EXISTS
  company_cashflow (
    id SERIAL PRIMARY KEY,
    CompanyID INT REFERENCES company_value_investment_score (CompanyID),
    investments float NOT NULL,
    Issuance_Of_Stock float NOT NULL,
    "Date" Date NOT NULL,
    Net_Income float NOT NULL,
    Change_in_cash float NOT NULL,
    Repurchase_of_stock float NOT NULL,
    Total_cashflows_from_investing_activities float NOT NULL
  );

CREATE TABLE IF NOT EXISTS
  company_sustainability (
    id SERIAL PRIMARY KEY,
    CompanyID INT REFERENCES company_value_investment_score (CompanyID),
    palmOil boolean NOT NULL,
    controversialWeapons boolean NOT NULL,
    gambling boolean NOT NULL,
    socialScore float NOT NULL,
    nuclear boolean NOT NULL,
    furLeather boolean NOT NULL,
    alcoholic boolean NOT NULL,
    gmo boolean NOT NULL,
    catholic boolean NOT NULL,
    peerCount int NOT NULL,
    governanceScore float NOT NULL,
    environmentPercentile float NOT NULL,
    animalTesting boolean NOT NULL,
    tobacco boolean NOT NULL,
    highestControversy int NOT NULL,
    coal boolean NOT NULL,
    pesticides boolean NOT NULL,
    adult boolean NOT NULL,
    percentile float NOT NULL,
    peerGroup varchar NOT NULL,
    smallArms boolean NOT NULL,
    environmentScore float NOT NULL,
    militaryContract boolean NOT NULL
  );

CREATE TABLE IF NOT EXISTS
  company_financial_on_year_period (
    id SERIAL PRIMARY KEY,
    CompanyID INT REFERENCES company_value_investment_score (CompanyID),
    Date_on_year_period date NOT NULL,
    Net_Income_on_year_period float NOT NULL,
    GrossProfit_on_year_period float NOT NULL,
    Ebit_on_year_period float NOT NULL,
    Total_Revenue_on_year_period float NOT NULL,
    Total_Operating_Expenses_on_year_period float NOT NULL
  );