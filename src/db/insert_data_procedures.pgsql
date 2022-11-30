-- To Do
-- Made database user with permission to use only those procedures

create
or replace procedure insert_to_company_value_investment_score (
  l_unit_price float,
  l_share float,
  l_price float,
  l_earnings float,
  l_indicator float,
  l_measurement_date_of_value_investment_score date
) as $$
<<insert_to_company_value_investment_score>>
begin
    INSERT INTO company_value_investment_score(unit_price, share, price, earnings, indicator, measurement_date_of_value_investment_score)
    VALUES (l_unit_price, l_share, l_price, l_earnings, l_indicator, l_measurement_date_of_value_investment_score);
end insert_to_company_value_investment_score;
$$ language plpgsql;

-- CALL insert_to_company_value_investment_score(1,1,1,1,1)
create
or replace procedure insert_to_company_base_info (
  l_company_id int,
  l_ticker varchar,
  l_sector varchar,
  l_country varchar,
  l_industry varchar,
  l_short_name varchar,
  l_market varchar
) as $$
<<insert_to_company_base_info>>
begin
    INSERT INTO company_base_info(company_id, ticker, sector, country, industry, short_name, market)
    SELECT company_id, ticker, sector, country, industry, short_name, market
    FROM (
        VALUES (l_company_id, l_ticker, l_sector, l_country, l_industry, l_short_name, l_market)
	) as cbi(company_id, ticker, sector, country, industry, short_name, market)
    WHERE EXISTS (
        SELECT FROM company_value_investment_score as cvis
	    WHERE cvis.company_id = cbi.company_id
    );
end insert_to_company_base_info;
$$ language plpgsql;

-- CALL insert_to_company_base_info(123,'1','1','1','1','1', '1');
create
or replace procedure insert_to_company_financial_info (
  l_company_id int,
  l_ebitda_margins float,
  l_profit_margins float,
  l_gross_margins float,
  l_operating_cashflow int,
  l_revenue_growth float,
  l_operating_margins float,
  l_ebitda float,
  l_free_cashflow float,
  l_earnings_growth float,
  l_total_cash float,
  l_total_debt float,
  l_total_cash_per_share float,
  l_financial_currency varchar(3),
  l_shares_outstanding_all_shares float
) as $$
<< insert_to_company_financial_info>>
begin
    INSERT INTO company_financial_info(
        company_id, ebitda_margins, profit_margins, gross_margins, operating_cashflow, revenue_growth, operating_margins, 
        ebitda, free_cashflow, earnings_growth, total_cash, total_debt, total_cash_per_share, financial_currency, shares_outstanding_all_shares
    )
    SELECT company_id, ebitda_margins, profit_margins, gross_margins, operating_cashflow, revenue_growth, operating_margins, 
        ebitda, free_cashflow, earnings_growth, total_cash, total_debt, total_cash_per_share, financial_currency, shares_outstanding_all_shares
    FROM (
        VALUES (
            l_company_id ,l_ebitda_margins, l_profit_margins, l_gross_margins, l_operating_cashflow, l_revenue_growth, l_operating_margins, l_ebitda, 
            l_free_cashflow, l_earnings_growth, l_total_cash, l_total_debt, l_total_cash_per_share, l_financial_currency, l_shares_outstanding_all_shares
        )
    ) as cfi(company_id, ebitda_margins, profit_margins, gross_margins, operating_cashflow, revenue_growth, operating_margins, 
        ebitda, free_cashflow, earnings_growth, total_cash, total_debt, total_cash_per_share, financial_currency, shares_outstanding_all_shares)
    WHERE EXISTS (
        SELECT FROM company_value_investment_score as cvis
	    WHERE cvis.company_id = cfi.company_id
    );
end insert_to_company_financial_info;
$$ language plpgsql;

-- CALL insert_to_company_financial_info(123,1,1,1,1,1,1,1,1,1,1,1,1, 'USD', 1)
create
or replace procedure insert_to_company_cashflow (
  l_company_id int,
  l_investments float,
  l_issuance_of_stock float,
  l_measurement_date date,
  l_net_income float,
  l_change_in_cash float,
  l_repurchase_of_stock float,
  l_total_cashflows_from_investing_activities float
) as $$
<<insert_to_company_cashflow>>
begin
    INSERT INTO company_cashflow(company_id, investments , issuance_of_stock , measurement_date , net_income , change_in_cash ,
        repurchase_of_stock , total_cashflows_from_investing_activities)
    SELECT company_id, investments , issuance_of_stock , measurement_date , net_income , change_in_cash ,
        repurchase_of_stock , total_cashflows_from_investing_activities
    FROM (
        VALUES(l_company_id, l_investments , l_issuance_of_stock , l_measurement_date, l_net_income , l_change_in_cash , l_repurchase_of_stock , l_total_cashflows_from_investing_activities)
    ) as ccf(company_id, investments , issuance_of_stock , measurement_date, net_income , change_in_cash , repurchase_of_stock , total_cashflows_from_investing_activities)
    WHERE EXISTS (
        SELECT FROM company_value_investment_score as cvis
	    WHERE cvis.company_id = ccf.company_id
);
end insert_to_company_cashflow;
$$ language plpgsql ;

-- CALL insert_to_company_cashflow(123,1,1,'01-01-2002',1,1,1,1)
create
or replace procedure insert_to_company_sustainability (
  l_company_id int,
  l_palm_oil boolean,
  l_controversial_weapons boolean,
  l_gambling boolean,
  l_social_score float,
  l_nuclear boolean,
  l_fur_leather boolean,
  l_alcoholic boolean,
  l_gmo boolean,
  l_catholic boolean,
  l_peer_count int,
  l_governance_score float,
  l_environment_percentile float,
  l_animal_testing boolean,
  l_tobacco boolean,
  l_highest_controversy int,
  l_coal boolean,
  l_pesticides boolean,
  l_adult boolean,
  l_percentile float,
  l_peer_group varchar,
  l_small_arms boolean,
  l_environment_score float,
  l_military_contract boolean
) as $$
<<insert_to_company_sustainability>>
begin
    INSERT INTO company_sustainability(
        company_id, palm_oil, controversial_weapons, gambling, social_score, nuclear, fur_leather, alcoholic, gmo, catholic, peer_count,
        governance_score, environment_percentile, animal_testing, tobacco, highest_controversy, coal, pesticides, adult, percentile, peer_group,
        small_arms, environment_score, military_contract
        )
    SELECT company_id, palm_oil, controversial_weapons, gambling, social_score, nuclear, fur_leather, alcoholic, gmo, catholic, peer_count,
        governance_score, environment_percentile, animal_testing, tobacco, highest_controversy, coal, pesticides, adult, percentile, peer_group,
        small_arms, environment_score, military_contract
    FROM (
        VALUES(
            l_company_id, l_palm_oil, l_controversial_weapons, l_gambling, l_social_score, l_nuclear, l_fur_leather, l_alcoholic,
            l_gmo, l_catholic, l_peer_count, l_governance_score, l_environment_percentile, l_animal_testing, l_tobacco, l_highest_controversy,
            l_coal, l_pesticides, l_adult, l_percentile, l_peer_group, l_small_arms, l_environment_score, l_military_contract
        )
    ) as css(
            company_id, palm_oil, controversial_weapons, gambling, social_score, nuclear, fur_leather, alcoholic, gmo, catholic, peer_count,
        governance_score, environment_percentile, animal_testing, tobacco, highest_controversy, coal, pesticides, adult, percentile, peer_group,
        small_arms, environment_score, military_contract
        )
    WHERE EXISTS (
        SELECT FROM company_value_investment_score as cvis
	    WHERE cvis.company_id = css.company_id
    );
end insert_to_company_sustainability;
$$ language plpgsql ;

-- CALL insert_to_company_sustainability(123,True, True, True, 1, True, True, True, True, True, 2, 3, 4, True, True, 10, True, True, True, 12, 'idk', True, 10, True)
create
or replace procedure insert_to_company_financial_on_year_period (
  l_company_id int,
  l_date_on_year_period date,
  l_net_income_on_year_period float,
  l_gross_profit_on_year_period float,
  l_ebit_on_year_period float,
  l_total_revenue_on_year_period float,
  l_total_operating_expenses_on_year_period float
) as $$
<<insert_to_company_financial_on_year_period>>
begin
    INSERT INTO company_financial_on_year_period(
        company_id, date_on_year_period, net_income_on_year_period, gross_profit_on_year_period,
        ebit_on_year_period, total_revenue_on_year_period, total_operating_expenses_on_year_period
    )
    SELECT company_id, date_on_year_period, net_income_on_year_period, gross_profit_on_year_period,
        ebit_on_year_period, total_revenue_on_year_period, total_operating_expenses_on_year_period
    FROM (
        VALUES(
            l_company_id, l_date_on_year_period, l_net_income_on_year_period, l_gross_profit_on_year_period, l_ebit_on_year_period,
            l_total_revenue_on_year_period, l_total_operating_expenses_on_year_period
        )
    ) as cfonyp(
        company_id, date_on_year_period, net_income_on_year_period, gross_profit_on_year_period,
        ebit_on_year_period, total_revenue_on_year_period, total_operating_expenses_on_year_period
        )
    WHERE EXISTS (
        SELECT FROM company_value_investment_score as cvis
	    WHERE cvis.company_id = cfonyp.company_id
    );
end insert_to_company_financial_on_year_period;
$$ language plpgsql ;

-- CALL insert_to_company_financial_on_year_period(123,'01-01-2002', 2, 3, 4,5 ,6)