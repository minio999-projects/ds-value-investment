CREATE TABLE IF NOT EXISTS
  company_value_investment_score (
    company_id SERIAL PRIMARY KEY,
    unit_price float NOT NULL,
    share float NOT NULL,
    measurement_date_of_value_investment_score date NOT NULL,
    price float NOT NULL,
    earnings float NOT NULL,
    indicator float NOT NULL
  );

CREATE TABLE IF NOT EXISTS
  company_base_info (
    id SERIAl PRIMARY KEY,
    company_id INT REFERENCES company_value_investment_score (company_id),
    ticker varchar(4) NOT NULL,
    sector varchar,
    country varchar(56) NOT NULL,
    industry varchar,
    short_name varchar NOT NULL,
    market varchar NOT NULL
  );

CREATE TABLE IF NOT EXISTS
  company_financial_info (
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES company_value_investment_score (company_id),
    ebitda_margins float,
    profit_margins float,
    gross_margins float,
    operating_cashflow int,
    revenue_growth float,
    operating_margins float,
    ebitda float,
    free_cashflow float,
    earnings_growth float,
    total_cash float,
    total_debt float,
    total_cash_per_share float,
    financial_currency varchar(3) NOT NULL,
    shares_outstanding_all_shares float
  );

CREATE TABLE IF NOT EXISTS
  company_cashflow (
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES company_value_investment_score (company_id),
    investments float,
    issuance_of_stock float,
    measurement_date Date NOT NULL, 
    net_income float,
    change_in_cash float,
    repurchase_of_stock float,
    total_cashflows_from_investing_activities float
  );

CREATE TABLE IF NOT EXISTS
  company_sustainability (
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES company_value_investment_score (company_id),
    palm_oil boolean,
    controversial_weapons boolean,
    gambling boolean,
    social_score float,
    nuclear boolean,
    fur_leather boolean,
    alcoholic boolean,
    gmo boolean,
    catholic boolean,
    peer_count int,
    governance_score float,
    environment_percentile float,
    animal_testing boolean,
    tobacco boolean,
    highest_controversy int,
    coal boolean,
    pesticides boolean,
    adult boolean,
    percentile float,
    peer_group varchar,
    small_arms boolean,
    environment_score float,
    military_contract boolean
  );

CREATE TABLE IF NOT EXISTS
  company_financial_on_year_period (
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES company_value_investment_score (company_id),
    date_on_year_period date NOT NULL,
    net_income_on_year_period float,
    gross_profit_on_year_period float,
    ebit_on_year_period float,
    total_revenue_on_year_period float,
    total_operating_expenses_on_year_period float
  );