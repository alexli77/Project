-- get all athletes and their name, gender, country, sport, endorsement, and contract for the List althetes page
SELECT A.id, A.fname, A.lname, A.gender, C.cname AS country, S.sname AS sport, B.bname AS brand CO.total AS contract
FROM endorse_athlete A 
INNER JOIN endorse_country C ON C.id = A.countryid
INNER JOIN endorse_sport S ON S.id = A.sportid
INNER JOIN brandid_athleteid BA ON A.id = BA.athleteid
INNER JOIN endorse_brand B ON B.id = A.brandid
INNER JOIN endorse_contract CO ON A.id = CO.athleteid


-- get a single athlete's data for the Update People form
SELECT A.id AS aid, A.fname, A.lname, A.gender, S.sname, C.cname 
FROM endorse_athlete A 
INNER JOIN endorse_sport S ON S.id = A.sportid
INNER JOIN endorse_country C ON C.id = A.countryid
WHERE A.id = :athlete_ID_selected_from_browse_athlete_page

SELECT athlete_id AS aid, fname, lname, gender FROM endorse_athlete

SELECT sport_id AS sid, sname FROM endorse_athlete

SELECT country_id AS cid, cname FROM endorse_country

SELECT brand_id AS bid, bname, CEO, year_found FROM endorse_brand

SELECT contract_id AS coid, total, clength, yearly FROM endorse_country


-- get all athletes with their current associated contracts to list
SELECT CONCAT(A.fname, ' ', A.lname) AS name, B.bname, CO.total as contract 
FROM endorse_athlete A 
INNER JOIN brandid_athleteid BA ON BA.athleteid = A.id
INNER JOIN endorse_brand B ON B.id = BA.brandid
INNER JOIN endorse_contract CO ON CO.athleteid = A.id


--------------------------------------------------------------------------------------------------------------------


-- add a new athlete
INSERT INTO endorse_athlete (fname, lname, gender, sportid, countryid) VALUES (:fnameInput, :lnameInput,:genderInput, :sport_id_from_dropdown_Input,:country_id_from_dropdown_Input)

-- add a new brand
INSERT INTO endorse_brand (Bname, CEO, year_found) VALUES (:BnameInput, :CEOnameInput,:yearInput)

-- add a new sport
INSERT INTO endorse_sport (Sname) VALUES (:SnameInput)

-- add a new country
INSERT INTO endorse_country (Cname) VALUES (:CnameInput)

-- add a new contract
INSERT INTO endorse_contract (total, Clength, yearly) VALUES (:totalInput, :lengthInput,:yearlyInput)

-- associate a athlete with a Brand (M-to-M relationship addition)
INSERT INTO endorse_athlete (aid, bid) VALUES (:athlete_id_from_dropdown_Input, :brand_id_from_dropdown_Input)

-- associate a athlete with a Sport (1-to-M relationship addition)
INSERT INTO endorse_athlete (aid, sid) VALUES (:athlete_id_from_dropdown_Input, :sport_id_from_dropdown_Input)

-- associate a athlete with a country (1-to-M relationship addition)
INSERT INTO endorse_athlete (aid, cid) VALUES (:athlete_id_from_dropdown_Input, :country_id_from_dropdown_Input)

-- associate a athlete with a contract (1-to-M relationship addition)
INSERT INTO endorse_athlete (aid, coid) VALUES (:athlete_id_from_dropdown_Input, :contract_id_from_dropdown_Input)


--------------------------------------------------------------------------------------------------------------------


-- Update athlete
UPDATE endorse_athlete SET fname = :fnameInput, lname= :lnameInput, gender= :genderInput, sport = :sport_id_from_dropdown_Input,country = :country_id_from_dropdown_Input WHERE id= :athlete_ID_from_the_update_form

-- Update brand
UPDATE endorse_brand SET Bname= :BnameInput, CEO= :CEOInput, year_found= :YearInput WHERE id= :brand_ID_from_the_update_form

-- Update sport
UPDATE endorse_sport SET Sname= :SnameInput WHERE id= :brand_ID_from_the_update_form

-- Update country
UPDATE endorse_country SET Cname= :CnameInput WHERE id= :country_ID_from_the_update_form

-- Update contract
UPDATE endorse_contract SET total= :totalInput, Clength= :lengthInput, yearly= :YearlyInput WHERE id= :contract_ID_from_the_update_form


----------------------------------------------------------------------------------------------------------------------------


-- delete an athlete
DELETE FROM endorse_athlete WHERE id = :athlete_ID_selected_from_browse_athlete_page

DELETE FROM endorse_brand  WHERE id = :brand_ID_selected_from_browse_brand_page

DELETE FROM endorse_sport WHERE id = :sport_ID_selected_from_browse_sport_page

DELETE FROM endorse_country WHERE id = :country_ID_selected_from_browse_country_page

DELETE FROM endorse_contract WHERE id = :contract_ID_selected_from_browse_contract_page

-- dis-associate a brand from an athlete (Many-to-Many relationship deletion)
DELETE FROM brandid_athleteid WHERE aid = :athlete_ID_selected_from_brand_and_athlete_list AND bid = :brand_ID_selected_from-brand_and_athlete_list

DELETE FROM endorse_sport WHERE aid = :athlete_ID_selected_from_sport_and_athlete_list AND sid = :sport_ID_selected_from-sport_and_athlete_list

DELETE FROM endorse_country WHERE aid = :athlete_ID_selected_from_country_and_athlete_list AND cid = :country_ID_selected_from-country_and_athlete_list

DELETE FROM endorse_contract WHERE aid = :athlete_ID_selected_from_contract_and_athlete_list AND coid = :contract_ID_selected_from-contract_and_athlete_list




