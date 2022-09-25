CREATE USER dominik WITH PASSWORD 'Dominik'; -- I wouldn't provide password like that on production.
GRANT ALL ON PROCEDURE insert_to_company_value_investment_score, insert_to_company_base_info,
    insert_to_company_financial_info, insert_to_company_cashflow, insert_to_company_sustainability, insert_to_company_financial_on_year_period TO dominik;