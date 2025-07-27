SELECT * from crime_scene_report csr 

--CONVERT datatype OF date FROM integer TO DATE
--for table crime_scene_report 
ALTER TABLE crime_scene_report RENAME COLUMN date TO crime_date 
ALTER TABLE crime_scene_report ADD new_date1 DATE;
UPDATE crime_scene_report 
SET new_date1 = SUBSTRING(crime_date,1,4) || '-' || SUBSTRING(crime_date,5,2) || "-" || SUBSTRING(crime_date,7,2) 
ALTER TABLE crime_scene_report DROP COLUMN crime_date 
ALTER TABLE crime_scene_report RENAME COLUMN new_date1 TO crime_date

--for table facebook_event_checkin 
ALTER TABLE facebook_event_checkin RENAME COLUMN date TO event_date 
ALTER TABLE facebook_event_checkin ADD new_date1 DATE;
UPDATE facebook_event_checkin 
SET new_date1 = SUBSTRING(event_date,1,4) || '-' || SUBSTRING(event_date,5,2) || "-" || SUBSTRING(event_date,7,2) 
ALTER TABLE facebook_event_checkin DROP COLUMN event_date 
ALTER TABLE facebook_event_checkin RENAME COLUMN new_date1 TO event_date

SELECT * FROM facebook_event_checkin fec 

--for table get_fit_now_check_in 
ALTER TABLE get_fit_now_check_in ADD new_date1 DATE;
UPDATE get_fit_now_check_in 
SET new_date1 = SUBSTRING(check_in_date,1,4) || '-' || SUBSTRING(check_in_date,5,2) || "-" || SUBSTRING(check_in_date,7,2) 
ALTER TABLE get_fit_now_check_in DROP COLUMN check_in_date 
ALTER TABLE get_fit_now_check_in RENAME COLUMN new_date1 TO check_in_date

SELECT * FROM get_fit_now_check_in gfnci 

--for table get_fit_now_member 
ALTER TABLE get_fit_now_member ADD new_date1 DATE;
UPDATE get_fit_now_member 
SET new_date1 = SUBSTRING(membership_start_date ,1,4) || '-' || SUBSTRING(membership_start_date ,5,2) || "-" || SUBSTRING(membership_start_date ,7,2) 
ALTER TABLE get_fit_now_member DROP COLUMN membership_start_date 
ALTER TABLE get_fit_now_member RENAME COLUMN new_date1 TO membership_start_date

SELECT * FROM get_fit_now_member gfnm 


-- murder happen on jan.15,2018 in SQL city. find out crime scene report from police database.

SELECT * FROM crime_scene_report csr 

SELECT * FROM drivers_license dl 

SELECT * FROM facebook_event_checkin fec 

SELECT * FROM get_fit_now_check_in gfnci

SELECT * FROM get_fit_now_member gfnm

SELECT * FROM income i

SELECT * FROM interview i

SELECT * FROM person p 

-- details of case

SELECT * FROM crime_scene_report csr  WHERE city = 'SQL City' AND crime_date = '2018-01-15' AND TYPE = 'murder'

SELECT * FROM person p WHERE name LIKE 'anabel %'

SELECT * FROM facebook_event_checkin fec WHERE person_id = 39415

SELECT * FROM drivers_license dl WHERE id = 454394

SELECT p.id,p.name,p.license_id,fec.event_id,fec.event_name,fec.event_date,dl.age ,dl.gender,dl.car_make 
FROM person p JOIN facebook_event_checkin fec on p.id = fec.person_id JOIN drivers_license dl ON p.license_id=dl.id WHERE dl.id = 454394; 







