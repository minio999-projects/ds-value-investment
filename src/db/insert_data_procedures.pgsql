create or replace procedure insert_to_company_value_investment_score(_unit_price float, _share float, _price float, _earnings float, _indicator float)
    language plpgsql
    as
$$
begin
INSERT INTO company_value_investment_score(unit_price, share, price, earnings, indicator)
VALUES (_unit_price, _share, _price, _earnings, _indicator);
end;
$$;

-- CALL insert_to_company_value_investment_score(1,1,1,1,1)

create or replace procedure insert_to_company_base_info(_companyID int,_ticker varchar, _sector varchar, _country varchar, _industry varchar, _shortName varchar, _market varchar)
    language plpgsql
    as
$$
begin
INSERT INTO company_base_info(companyid, ticker, sector, country, industry, shortName, market)
SELECT *
FROM (
VALUES (_companyID, _ticker, _sector, _country, _industry, _shortName, _market)
	) as cbi(companyid, ticker, sector, country, industry, shortName, market)
WHERE EXISTS (
SELECT FROM company_value_investment_score as cvis
	WHERE cvis.CompanyID = cbi.CompanyID
);
end;
$$;

-- CALL insert_to_company_base_info(123,'1','1','1','1','1', '1');


create or replace procedure insert_to_company_financial_info(_companyID int ,_ebitdaMargins float, _profitMargins float, _grossMargins float, _operatingCashflow int, _revenueGrowth float, _operatingMargins float, _ebitda float, _freeCashflow float, _earningsGrowth float, _totalCash float, _totalDebt float, _totalCashPerShare float, _financialCurrency varchar(3), _sharesOutstanding_all_shares float)
    language plpgsql
    as
$$
begin
INSERT INTO company_financial_info(companyID, ebitdaMargins, profitMargins, grossMargins, operatingCashflow, revenueGrowth, operatingMargins, ebitda, freeCashflow, earningsGrowth, totalCash, totalDebt, totalCashPerShare, financialCurrency, sharesOutstanding_all_shares)
SELECT *
FROM (
VALUES (_companyID ,_ebitdaMargins, _profitMargins, _grossMargins, _operatingCashflow, _revenueGrowth, _operatingMargins, _ebitda, _freeCashflow, _earningsGrowth, _totalCash, _totalDebt, _totalCashPerShare, _financialCurrency, _sharesOutstanding_all_shares )
) as cfi(companyID, ebitdaMargins, profitMargins, grossMargins, operatingCashflow, revenueGrowth, operatingMargins, ebitda, freeCashflow, earningsGrowth, totalCash, totalDebt, totalCashPerShare, financialCurrency, sharesOutstanding_all_shares)
WHERE EXISTS (
    SELECT FROM company_value_investment_score as cvis
	WHERE cvis.CompanyID = cfi.CompanyID
);
end;
$$;

-- CALL insert_to_company_financial_info(123,1,1,1,1,1,1,1,1,1,1,1,1, 'USD', 1)

create or replace procedure insert_to_company_cashflow(_companyID int, _investments float, _Issuance_Of_Stock float, _date date, _Net_Income float, _change_in_cash float, _Repurchase_of_stock float, _Total_cashflows_from_investing_activities float)
    language plpgsql
    as
$$
begin
INSERT INTO company_cashflow(companyID, investments , Issuance_Of_Stock , "Date" , Net_Income , change_in_cash , Repurchase_of_stock , Total_cashflows_from_investing_activities)
SELECT *
FROM (
VALUES(_companyID, _investments , _Issuance_Of_Stock , _date, _Net_Income , _change_in_cash , _Repurchase_of_stock , _Total_cashflows_from_investing_activities )
) as ccf(companyID, investments , Issuance_Of_Stock , "Date" , Net_Income , change_in_cash , Repurchase_of_stock , Total_cashflows_from_investing_activities )
WHERE EXISTS (
    SELECT FROM company_value_investment_score as cvis
	WHERE cvis.CompanyID = ccf.CompanyID
);
end;
$$;

-- CALL insert_to_company_cashflow(123,1,1,'01-01-2002',1,1,1,1)

create or replace procedure insert_to_company_sustainability(_companyID int, _palmOil boolean, _controversialWeapons boolean, _gambling boolean, _socialScore float, _nuclear boolean, _furLeather boolean, _alcoholic boolean, _gmo boolean, _catholic boolean, _peerCount int, _governanceScore float ,_environmentPercentile float ,_animalTesting boolean, _tobacco boolean, _highestControversy int, _coal boolean, _pesticides boolean, _adult boolean, _percentile float, _peerGroup varchar, _smallArms boolean, _environmentScore float, _militaryContract boolean)
    language plpgsql
    as
$$
begin
INSERT INTO company_sustainability(companyID, palmOil , controversialWeapons , gambling , socialScore , nuclear , furLeather , alcoholic , gmo , catholic , peerCount, governanceScore , environmentPercentile , animalTesting , tobacco , highestControversy , coal , pesticides , adult , percentile , peerGroup , smallArms , environmentScore , militaryContract )
SELECT *
FROM (
    VALUES(_companyID, _palmOil, _controversialWeapons, _gambling, _socialScore, _nuclear, _furLeather, _alcoholic, _gmo, _catholic, _peerCount, _governanceScore, _environmentPercentile, _animalTesting, _tobacco, _highestControversy, _coal, _pesticides, _adult, _percentile, _peerGroup, _smallArms, _environmentScore, _militaryContract)
) as css(companyID, palmOil , controversialWeapons , gambling , socialScore , nuclear , furLeather , alcoholic , gmo , catholic , peerCount, governanceScore , environmentPercentile , animalTesting , tobacco , highestControversy , coal , pesticides , adult , percentile , peerGroup , smallArms , environmentScore , militaryContract )
WHERE EXISTS (
    SELECT FROM company_value_investment_score as cvis
	WHERE cvis.CompanyID = css.CompanyID
);
end;
$$;

-- CALL insert_to_company_sustainability(123,True, True, True, 1, True, True, True, True, True, 2, 3, 4, True, True, 10, True, True, True, 12, 'idk', True, 10, True)

create or replace procedure insert_to_company_financial_on_year_period(_companyID int, _Date_on_year_period date, _Net_Income_on_year_period float, _GrossProfit_on_year_period float, _Ebit_on_year_period float, _Total_Revenue_on_year_period float, _Total_Operating_Expenses_on_year_period float)
    language plpgsql
    as
$$
begin
INSERT INTO company_financial_on_year_period(companyID, Date_on_year_period, Net_Income_on_year_period, GrossProfit_on_year_period, Ebit_on_year_period, Total_Revenue_on_year_period, Total_Operating_Expenses_on_year_period)
SELECT * 
FROM (
VALUES(_companyID, _Date_on_year_period, _Net_Income_on_year_period, _GrossProfit_on_year_period, _Ebit_on_year_period, _Total_Revenue_on_year_period, _Total_Operating_Expenses_on_year_period)
) as cfonyp(companyID, Date_on_year_period, Net_Income_on_year_period, GrossProfit_on_year_period, Ebit_on_year_period, Total_Revenue_on_year_period, Total_Operating_Expenses_on_year_period)
WHERE EXISTS (
    SELECT FROM company_value_investment_score as cvis
	WHERE cvis.CompanyID = cfonyp.CompanyID
);
end;
$$;

-- CALL insert_to_company_financial_on_year_period(123,'01-01-2002', 2, 3, 4,5 ,6)