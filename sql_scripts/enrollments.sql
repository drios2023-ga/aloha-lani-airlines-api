----------------------------------------------------------------
---                 CREATE THE SCHEMA
----------------------------------------------------------------
create table employee_dept (
	id serial primary key,
	employee_dept varchar not null
);

insert into employee_dept (employee_dept) values ('Flight Crew');
insert into employee_dept (employee_dept) values ('Passenger Service');
insert into employee_dept (employee_dept) values ('Flight Prep');
insert into employee_dept (employee_dept) values ('Aircraft Maintenance');
insert into employee_dept (employee_dept) values ('Flight Scheduling');

--select * from employee_dept order by id;
create table employee_position (
	id serial primary key,
	employee_position varchar not null,
	employee_dept_id integer not null
);

alter table employee_position add constraint fk_employee_dept_id foreign key (employee_dept_id) references employee_dept(id);

--truncate table employee_position;
insert into employee_position(employee_position, employee_dept_id) values ('Pilot', 1);
insert into employee_position(employee_position, employee_dept_id) values ('Co-Pilot', 1);
insert into employee_position(employee_position, employee_dept_id) values ('Flight Attendent', 1);
insert into employee_position(employee_position, employee_dept_id) values ('Baggage Handler', 3);
insert into employee_position(employee_position, employee_dept_id) values ('Passenger Service Assistant', 2);
insert into employee_position(employee_position, employee_dept_id) values ('Aircraft Mechanic', 4);
insert into employee_position(employee_position, employee_dept_id) values ('Flight Dispatcher', 5);
insert into employee_position(employee_position, employee_dept_id) values ('Avionics Technician', 4);
insert into employee_position(employee_position, employee_dept_id) values ('Aircraft Fueler', 5);

--update  employee_position set employee_position = 'Flight Attendant' where employee_position = 'Flight attendent';
--select * from employee_position order by id;

--drop view vw_position_and_depts;
create view vw_position_and_depts as
select 
	   ep.id
	 , ep.employee_position
	 , ed.employee_dept
from 
	 employee_position ep
     left join employee_dept ed on ep.employee_dept_id = ed.id;

--select * from vw_position_and_depts;

create table employee_status (
	id serial primary key,
	employee_status varchar not null
);

insert into employee_status (employee_status) values ('Full Time Exempt');
insert into employee_status (employee_status) values ('Part Time Permanent Exempt');
insert into employee_status (employee_status) values ('Full Time Hourly');
insert into employee_status (employee_status) values ('Part Time Hourly');
insert into employee_status (employee_status) values ('Contractor');
insert into employee_status (employee_status) values ('Terminated');

--select * from employee_status;

create table employee_relationship_status(
	id serial primary key,
	employee_relationship_status varchar not null
);

insert into employee_relationship_status (employee_relationship_status) values ('Single');
insert into employee_relationship_status (employee_relationship_status) values ('Common-law');
insert into employee_relationship_status (employee_relationship_status) values ('Married');
insert into employee_relationship_status (employee_relationship_status) values ('Separated');
insert into employee_relationship_status (employee_relationship_status) values ('Divorced');
insert into employee_relationship_status (employee_relationship_status) values ('Widowed');

create table employee (
	id serial primary key,
	employee_position_id integer not null,
	employee_status_id integer not null,
	employee_relationship_status_id integer not null,
	employee_number varchar not null,
	first_name varchar not null,
	middle_name varchar, 
	last_name varchar not null,
	employee_dob date not null,
	employee_start_date date not null,
	employee_term_date date,
	description varchar,
	file_name varchar
);

alter table employee add constraint fk_employee_position foreign key (employee_position_id) references employee_position(id);
alter table employee add constraint fk_employee_status foreign key (employee_status_id) references employee_status(id);
alter table employee add constraint fk_employee_relationship_status foreign key (employee_relationship_status_id) references employee_relationship_status(id);

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 1, 1, 3, 'Jack', '', 'Lord', 'FJVI34', '1920-12-30', '1981-03-31', null, 'John Joseph Patrick Ryan, best known by his stage name, Jack Lord, was an American television, film and Broadway actor, director and producer. He starred as Steve McGarrett in the CBS television program Hawaii Five-O, which ran from 1968 to 1980.', 'jack_lord.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 2, 1, 1, 'James', '', 'MacArthur', '0KSN33', '1937-10-08', '1981-03-31', null, 'James Gordon MacArthur (December 8, 1937 – October 28, 2010) was an American actor and recording artist. He had a long career in both movies and television, and his early work was predominantly in supporting roles in films. Later, he had a starring role as Danny "Danno" Williams in the long-running television series Hawaii Five-O.', 'james_macarthur.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 3, 1, 1, 'Kam', 'Fong', 'Chun', 'V9EJ45', '1918-05-27', '1981-03-31', null, 'Kam Fong Chun was an American police officer and actor, best known for his role as Chin Ho Kelly, a police detective on the CBS television network series Hawaii Five-O.', 'kam_fong.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 4, 3, 1, 'Gilbert', 'Zulu', 'Kauhi', 'DMNB44', '1937-10-17', '1981-03-31', null, 'Gilbert Francis Lani Damian Kauhi, also known by the stage names monumously as Zulu and Zoulou, was an American actor and comedian. He is remembered largely for his portrayal of Kono Kalakaua on the long-running television program Hawaii Five-O.', 'gilbert_kauhi.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 5, 3, 1, 'Herman', '', 'Wedemeyer', 'SBXV43', '1924-05-20', '1981-03-31', null, 'Herman John Wedemeyer was an American actor, football player, and politician. He is best known for portraying Sergeant/Detective "Duke" Lukela on the crime drama Hawaii Five-O. He also appeared on the first episode of Hawaii Five-O as Lt. Balta of Honolulu Police Department.', 'herman_wedemeyer.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 6, 3, 1, 'Al', '', 'Harrington', 'DD09D8', '1935-12-12', '1981-03-31', null, 'Al Harrington was a Samoan-American actor. He is best known for his role as Detective Ben Kokua on television series Hawaii Five-O and as Mamo Kahike on its 2010 reboot. He had previously appeared in five episodes of the series as other characters.', 'al_harrington.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 7, 3, 1, 'Richard', '', 'Denning', 'DMSNB2', '1914-03-27', '1981-03-31', null, 'Richard Denning was an American actor who starred in science fiction films of the 1950s, including Unknown Island, Creature from the Black Lagoon, Target Earth, Day the World Ended, Creature with the Atom Brain, and The Black Scorpion.', 'richard_denning.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 8, 3, 1, 'Harry', '', 'Endo', 'C32ZA5', '1922-07-20', '1981-03-31', null, 'Harry Endo was an American actor best known for his role playing Che Fong, a forensic scientist on the television series Hawaii Five-O. Endo was born in Colorado, but spent most of his life living in Hawaii. He enlisted in the United States Army in 1941 and served as a radio operator with an infantry unit in Europe.', 'harry_endo.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 9, 3, 1, 'Khigh', '', 'Dhiegh', 'DVN86T', '1910-08-25', '1981-03-31', null, 'Khigh Alx Dhiegh was an American television and motion picture actor of Anglo-Egyptian Sudanese ancestry, noted for portraying East Asian roles.', 'khigh_dhiegh.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 1, 1, 1, 'Kwan', 'Hi', 'Lim', '112WS4', '1922-07-11', '1981-03-31', null, 'A native of Hawaii, Kwan Hi Lim was one of the many locals who have been used in TV series and movies that took place on the islands. Lim appeared frequently on the TV series Hawaii Five-O, where he primarily portrayed villains. He was known to many as the recurring character Lt. Yoshi Tanaka of the Honolulu Police Department on Magnum, P.I..', 'kwan_hi_lim.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 2, 1, 1, 'Moe', '', 'Keale', 'XZ76S2', '1939-12-03', '1981-03-31', null, 'Wilfred Nalani "Moe" Keale was an American musician of Hawaiian music, a ʻukulele virtuoso, and an actor. He was the uncle and major musical influence of Israel Kamakawiwoʻole.', 'moe_keale.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 3, 1, 1, 'Douglas', '', 'Mossman', 'D33E4R', '1933-04-07', '1981-03-31', null, 'Douglas Kinilau Mossman, also credited as Doug Mossman was an American actor known for his recurring role as Detective Frank Kamana on the original Hawaii Five-O from 1974 to 1976. In addition to playing the role of Kamana, Mossman played twelve additional characters during the series 12 year run.', 'douglas_mossman.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 4, 1, 1, 'Tommy', '', 'Fujiwara', '12H9O5', '1932-06-30', '1981-03-31', null, 'Tommy Fujiwara was born on June 30, 1932 in Honolulu, Hawaii, USA. He was an actor, known for Hawaii Five-O (1968), One West Waikiki (1994) and The Six Million Dollar Man (1974).', 'tommy_fujiwara.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 5, 3, 1, 'Seth', '', 'Sakai', 'V634E5', '1932-05-22', '1981-03-31', null, 'Seth Saita Sakai was an American television and film actor. His roles included various characters from Hawaii Five-O and Magnum, P.I..', 'seth_sakai.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 6, 3, 1, 'Carole', '', 'Kai', 'VB421A', '1944-10-28', '1981-03-31', null, 'Carole Kai is an entertainer, recording artist, and philanthropist from Hawaii.', 'carole_kai.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 7, 3, 1, 'Josie', '', 'Over', 'XC445R', '1942-09-09', '1981-03-31', null, 'Josie Over was born on 9 September 1942 in Los Angeles, California, USA. She was an actress, known for Quincy, M.E. (1976), Magnum, P.I. (1980) and Hawaii Five-O (1968).', 'josie_over.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 8, 3, 1, 'Nancy', '', 'Kwan', 'F442Y7', '1939-05-19', '1981-03-31', null, 'Nancy Kwan Ka-shen is a Chinese-American actress. In addition to her personality and looks, her career benefited from Hollywood''s casting of more Asian roles in the 1960s, especially in comedies.', 'nancy_kwan.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 9, 3, 1, 'Lydia', '', 'Lei', 'DF221Q', '1952-10-15', '1981-03-31', null, 'Lydia Lei was born on October 15, 1952 in the USA. She is an actress, known for Vice Squad (1982), Hammett (1982) and Cannonball Run II (1984).', 'lydia_lei.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 1, 1, 1, 'Lynne', '', 'Kimoto', '78UI90', '1948-01-01', '1981-03-31', null, 'Lynne Kimoto was born in 1948 in Hawaii, USA. She is an actress, known for Hawaii Five-O (1968) and The Little People (1972).', 'lynne_kimoto.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 2, 1, 1, 'Christina', '', 'Kokubo', 'E4E4R0', '1950-07-27', '1981-03-31', null, 'Christina Kokubo was born on July 27, 1950 in Detroit, Michigan, USA. She was an actress, known for Midway (1976), The Yakuza (1974) and St. Elsewhere.', 'christina_kokubo.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 3, 1, 1, 'Melveen', '', 'Leed', 'XX56Y7', '1943-01-01', '1981-03-31', null, 'Melveen Leed is an American singer. She graduated from Radford High School in Honolulu. After winning the title of "Miss Molokai" she began singing in the mid-1960s and has released a number of records in the genres of Hawaiian, country, and jazz music.', 'melveen_leed.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 4, 1, 1, 'Irene', '', 'Tsu', 'HTR432', '1945-11-04', '1981-03-31', null, 'Irene Tsu (born November 4, 1945, Shanghai, China) is an actress who started in the film Flower Drum Song in 1961. She was featured in an advertising campaign (Wiki wiki dollar) in the 1960s. She speaks English and three varieties of Chinese.', 'irene_tsu.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 5, 3, 1, 'Donna', 'Kei', 'Benz', '1WEG78', '1947-10-20', '1981-03-31', null, 'Donna Kei Benz was born on October 20, 1947 in Hawaii, USA. She is an actress, known for Stir Crazy (1980), Pray for Death (1985) and Looker (1981).', 'donna_kei_benz.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 6, 3, 1, 'Elissa', '', 'Dulce', '5RT5R4', '1960-01-01', '1981-03-31', null, 'Elissa Dulce, also known as Elissa Dulce Hoopai and Elissa Mataele, appeared in nine episodes of the original Hawaii Five-O and eight episodes of the original Magnum, P.I.. She also appeared in one episode each of the reboots of these two shows which began in 2010 and 2018 respectively and several other TV productions, most of them Hawaii-based.', 'elisa_dulce.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 7, 3, 1, 'France', '', 'Nuyen', 'BHUIJ9', '1939-07-31', '1981-03-31', null, 'France Nuyen is a French-American actress, model, and psychological counselor. She is known to film audiences for playing romantic leads in South Pacific, Satan Never Sleeps, and A Girl Named Tamiko, and for playing Ying-Ying St. Clair in The Joy Luck Club.', 'france_nuyen.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 8, 3, 1, 'Jean', 'Marie', 'Hon', 'SXC76T', '1955-03-21', '1981-03-31', null, 'Jean Marie Hon was born on March 21, 1955 in San Francisco, California, USA. She is an actress, known for Man from Atlantis (1977), Hawaii Five-O (1968) and Ark II (1976).', 'jean_marie_hon.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 9, 3, 1, 'Helen', '', 'Funai', 'FVBNL9', '1943-01-25', '1981-03-31', null, 'Helen Funai is talented actress who starred in a number of television shows. Besides Hawaii Five-O, Funai''s career began with roles in "The Red Skelton Show" (1951-1971), "Days of Our Lives" (NBC, 1965-) and "The Dean Martin Show" (NBC, 1965-1974).', 'helen_funai.jpg' );

insert into employee (employee_position_id, employee_status_id, employee_relationship_status_id, first_name, middle_name, last_name, employee_number, employee_dob, employee_start_date, employee_term_date, description, file_name)
values ( 1, 1, 1, 'Helen', '', 'Kuoha-Torco', 'XBKIE4', '1942-01-22', '1981-03-31', null, 'The hula dancer in the iconic Hawaii Five-0 opening credits was Helen Kuoha-Torco. She appeared in the pilot episode and continued to appear in the opening credits from 1968 to 1980. Hawaii News Now reports that she was remembered for her wit and warmth.', 'helen_kuoha_torco.jpg' );

create table dependent_type (
	id serial primary key,
	dependent_type varchar not null
);

create table dependent_status (
	id serial primary key,
	dependent_status varchar not null
);

create table dependent (
	id serial primary key,
	employee_id integer not null,
	dependent_type_id integer not null,
	dependent_status_id integer not null,
	first_name varchar not null,
	middle_name varchar, 
	last_name varchar not null,
	dependent_dob date not null,
	dependent_active_date date not null,
	dependent_inactive_date date
);

alter table dependent add constraint fk_employee foreign key (employee_id) references employee(id);
alter table dependent add constraint fk_dependent_type foreign key (dependent_type_id) references dependent_type(id);
alter table dependent add constraint fk_dependent_status foreign key (dependent_status_id) references dependent_status(id);

insert into dependent_type (dependent_type) values ('Spouse');
insert into dependent_type (dependent_type) values ('Domestic Partner');
insert into dependent_type (dependent_type) values ('Child');
insert into dependent_type (dependent_type) values ('Qualifying relative');
insert into dependent_status(dependent_status) values('Active');
insert into dependent_status(dependent_status) values('Inactive');

insert into dependent(employee_id, dependent_type_id, dependent_status_id, first_name, middle_name, last_name, dependent_dob, dependent_active_date, dependent_inactive_date)
values (1, 1, 1, 'Marie', '', 'De Narde', '1905-08-16', '1981-03-31', null);

--select * from dependent;
create table enrollment_period(
	id serial primary key,
	enrollment_title varchar not null
);

insert into enrollment_period(enrollment_title) values ('Employee Benefits Enrollment 2025');


create table employee_enrollment_type (
		id serial primary key,
		employee_enrollment_type varchar
);


insert into employee_enrollment_type (employee_enrollment_type) values('Open Enrollment');
insert into employee_enrollment_type (employee_enrollment_type) values('Life Event Enrollment');
insert into employee_enrollment_type (employee_enrollment_type) values('Special Enrollment');

create table employee_enrollment (
		id serial primary key,
		enrollment_period_id integer not null,
		employee_id integer not null,
		employee_enrollment_type_id integer not null,
		confirmation_number varchar not null,
		datetime_created timestamp not null
);

alter table employee_enrollment add constraint fk_enrollment_period foreign key (enrollment_period_id) references enrollment_period (id);
alter table employee_enrollment add constraint fk_employee foreign key (employee_id) references employee (id);
alter table employee_enrollment add constraint fk_employee_enrollment_type foreign key (employee_enrollment_type_id) references employee_enrollment_type(id);

insert into employee_enrollment(enrollment_period_id, employee_id, employee_enrollment_type_id, confirmation_number, datetime_created)values(1, 1, 1, 'HG98YFD7832', NOW());

create table life_event_type(
	id serial primary key,
	life_event_type varchar not null
);

--dependent related
insert into life_event_type (life_event_type) values ('Getting Married');
insert into life_event_type (life_event_type) values ('Getting Divorced');
insert into life_event_type (life_event_type) values ('Getting Separated');
insert into life_event_type (life_event_type) values ('Adding a Domestic Partner');
insert into life_event_type (life_event_type) values ('Birth of a Child');
insert into life_event_type (life_event_type) values ('Adopting a Child');

--non dependent related
insert into life_event_type (life_event_type) values ('Leave of Absence');
insert into life_event_type (life_event_type) values ('Military Leave of Absence');
insert into life_event_type (life_event_type) values ('Return from Leave of Absence');
insert into life_event_type (life_event_type) values ('Enrollment in Marketplace Coverage');
insert into life_event_type (life_event_type) values ('Enrollment in Medicare/Medicaid');
insert into life_event_type (life_event_type) values ('Ineligible for Marketplace Coverage');
insert into life_event_type (life_event_type) values ('Ineligible for Medicare/Medicaid');

create table life_event_enrollment_relationship(
	id serial primary key,
	life_event_enrollment_relationship varchar not null
);

insert into life_event_enrollment_relationship (life_event_enrollment_relationship) values ('Enrollment Add');
insert into life_event_enrollment_relationship (life_event_enrollment_relationship) values ('Post-Enrollment Add');
insert into life_event_enrollment_relationship (life_event_enrollment_relationship) values ('Triggered New Enrollment');

create table life_event (
	id serial primary key,
	employee_id integer not null,
	employee_enrollment_id integer not null,
	life_event_type_id integer not null,
	life_event_enrollment_relationship_id integer not null,
	dependent_id integer not null,
	life_event_date date not null,
	datetime_created timestamp not null
);

alter table life_event add constraint fk_life_event_employee foreign key (employee_id) references employee (id);
alter table life_event add constraint fk_life_event_employee_enrollment foreign key (employee_enrollment_id) references employee_enrollment (id);
alter table life_event add constraint fk_life_event_life_event_type foreign key (life_event_type_id) references life_event_type (id);
alter table life_event add constraint fk_life_event_enrollment_relationship foreign key (life_event_enrollment_relationship_id) references life_event_enrollment_relationship (id);
alter table life_event add constraint fk_life_event_dependent foreign key (dependent_id) references dependent (id);

--drop table benefit_plan_type;
create table benefit_plan_type( 
	id serial primary key,
	benefit_plan_type varchar not null
);

insert into benefit_plan_type (benefit_plan_type) values ('Medical');   --1
insert into benefit_plan_type (benefit_plan_type) values ('Dental');    --2
insert into benefit_plan_type (benefit_plan_type) values ('Vision');    --3
insert into benefit_plan_type (benefit_plan_type) values ('Short Term Disability');  --4
insert into benefit_plan_type (benefit_plan_type) values ('Long Term Disability');   --5
insert into benefit_plan_type (benefit_plan_type) values ('Life Insurance');         --6
insert into benefit_plan_type (benefit_plan_type) values ('Supplemental Life');      --7
insert into benefit_plan_type (benefit_plan_type) values ('Additional Benefits');    --8


create table life_event_dependent( 
		id serial primary key,
		life_event_id integer,
		dependent_id integer
);

alter table life_event_dependent add constraint fk_life_event_dependent_life_event foreign key (life_event_id) references life_event (id);
alter table life_event_dependent add constraint fk_life_event_dependent_dependent foreign key (dependent_id) references dependent (id);

--select * from employee_enrollment;


--select * from benefit_plan_type;

create table benefit_plan(
	id serial primary key,
	enrollment_period_id integer not null,
	benefit_plan_type_id integer not null,
	benefit_plan_title varchar not null, 
	benefit_plan_description varchar not null
);

alter table benefit_plan add constraint fk_enrollment_period_plan foreign key (enrollment_period_id) references enrollment_period(id);
alter table benefit_plan add constraint fk_benefit_plan_type foreign key (benefit_plan_type_id) references benefit_plan_type (id);

insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 1, 'Cigna Medical PPO', '');
insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 1, 'Cigna High Deductible Plan', '');
insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 1, 'Decline Medical Plan', '');

insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 2, 'Cigna Dental Core', '');
insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 2, 'Cigna Dental Enhanced', '');
insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 2, 'Decline Dental Plan', '');

insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 3, 'VSP Vision Core', '');
insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 3, 'VSP Vision Buy Up', '');
insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 3, 'Decline Vision Plan', '');

insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 4, 'Short Term Disability', '');

insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 5, 'Long Term Disability', '');

insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 6, 'Prudential Life Insurance Plan', '');

insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 7, 'Prudential Supplemental Life', '');

insert into benefit_plan (enrollment_period_id, benefit_plan_type_id, benefit_plan_title, benefit_plan_description) values ( 1, 8, 'Aloha Lani Perks', '');

--update benefit_plan_type set benefit_plan_type='Life Insurance' where benefit_plan_type = 'Core Life'

create table benefit_plan_level(
		id serial primary key,
		benefit_plan_id integer not null,
		plan_level varchar not null,
		plan_level_abbr varchar not null,
		employer_cost decimal(18,2) not null,
		employee_cost decimal(18,2) not null,
		sort_order integer not null
);

alter table benefit_plan_level add constraint fk_benefit_plan foreign key (benefit_plan_id) references benefit_plan (id);

--medical decline coverage
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (3, 'Medical Coverage Declined', 'Declined', 0.00, 0.00, 1 ); --1

--cigna medical PPO
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (1, 'Employee Only', 'EEO', 230.00, 30.00, 1 ); --2
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (1, 'Employee + 1', 'EE1', 300.00, 70.00, 2 ); --3
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (1, 'Employee + Family', 'EEF', 500.00, 120.00, 3 ); --4

--cigna high deductible plan
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (2, 'Employee Only', 'EEO', 200.00, 25.00, 1 ); --5
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (2, 'Employee + 1', 'EE1', 270.00, 65.00, 2 ); --6
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (2, 'Employee + Family', 'EEF', 400.00, 95.00, 3 ); --7

--dental decline coverage
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (6, 'Dental Coverage Declined', 'Declined', 0.00, 0.00, 1 ); --8

--dental core
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (4, 'Employee Only', 'EEO', 200.00, 15.00, 1 ); --9
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (4, 'Employee + 1', 'EE1', 250.00, 25.00, 2 ); --10
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (4, 'Employee + Family', 'EEF', 350.00, 50.00, 3 ); --11

--dental enhanced
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (5, 'Employee Only', 'EEO', 200.00, 25.00, 1 ); --12
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (5, 'Employee + 1', 'EE1', 235.00, 40.00, 2 );  --13
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (5, 'Employee + Family', 'EEF', 375.00, 65.00, 3 ); --14

--vision decline coverage
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (9, 'Vision Coverage Declined', 'Declined', 0.00, 0.00, 1 ); --15

--vision core
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (7, 'Employee Only', 'EEO', 100.00, 7.50, 1 ); --16
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (7, 'Employee + 1', 'EE1', 150.00, 9.00, 2 ); --17
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (7, 'Employee + Family', 'EEF', 250.00, 20.25, 3 ); --18

--vision buy up
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (8, 'Employee Only', 'EEO', 225.00, 15.00, 1 ); --19
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (8, 'Employee + 1', 'EE1', 285.00, 22.50, 2 ); --20
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (8, 'Employee + Family', 'EEF', 300.00, 45.00, 3 ); --21

--short term disability
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (10, '60% of salary', 'core', 56.00, 0.00, 1 ); --22

--short term disability
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (11, '60% of salary', 'core', 65.00, 0.00, 1 ); --23

--life insurance
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (12, '1x salary', 'core', 15.00, 0.00, 1 ); --24

--supplemental life
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (13, '2x salary', '2X', 0.00, 5.00, 1 );  --25
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (13, '3x salary', '3X', 0.00, 10.00, 2 ); --26
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (13, '4x salary', '4X', 0.00, 15.00, 3 ); --27
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (13, '5x salary', '5X', 0.00, 20.00, 4 ); --28

--aloha lani perks
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (14, 'Priority Boarding on all Aloha Lani Flights', 'JET', 0.00, 100.00, 1 ); --29
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (14, 'Unlimited In-Flight Tropical Cocktails', 'CT', 0.00, 35.00, 2 ); --30
insert into benefit_plan_level (benefit_plan_id, plan_level, plan_level_abbr, employer_cost, employee_cost, sort_order) values (14, 'Five free Aloha Lani flights per year', '5X', 0.00, 75.00, 3 ); --31


create table benefit_plan_level_selected(
			id serial primary key,
			benefit_plan_level_id integer not null,
			employee_enrollment_id integer not null,
			datetime_selected timestamp not null
);

alter table benefit_plan_level_selected add constraint fk_employee_enrollment foreign key (employee_enrollment_id) references employee_enrollment (id);
alter table benefit_plan_level_selected add constraint fk_benefit_plan_level foreign key (benefit_plan_level_id) references benefit_plan_level (id);

--jack lord's benefits
insert into benefit_plan_level_selected (benefit_plan_level_id, employee_enrollment_id, datetime_selected ) values (3, 1, '2025-04-13 21:29:15.685'); --medical
insert into benefit_plan_level_selected (benefit_plan_level_id, employee_enrollment_id, datetime_selected ) values (13, 1, '2025-04-13 21:29:15.685'); --dental
insert into benefit_plan_level_selected (benefit_plan_level_id, employee_enrollment_id, datetime_selected ) values (20, 1, '2025-04-13 21:29:15.685'); --vision
insert into benefit_plan_level_selected (benefit_plan_level_id, employee_enrollment_id, datetime_selected ) values (22, 1, '2025-04-13 21:29:15.685'); --STD
insert into benefit_plan_level_selected (benefit_plan_level_id, employee_enrollment_id, datetime_selected ) values (23, 1, '2025-04-13 21:29:15.685'); --LTD
insert into benefit_plan_level_selected (benefit_plan_level_id, employee_enrollment_id, datetime_selected ) values (24, 1, '2025-04-13 21:29:15.685'); --life core
insert into benefit_plan_level_selected (benefit_plan_level_id, employee_enrollment_id, datetime_selected ) values (28, 1, '2025-04-13 21:29:15.685'); --life supplemental
insert into benefit_plan_level_selected (benefit_plan_level_id, employee_enrollment_id, datetime_selected ) values (30, 1, '2025-04-13 21:29:15.685'); --perks
 