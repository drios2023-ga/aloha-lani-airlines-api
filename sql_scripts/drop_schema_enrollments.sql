----------------------------------------------------------------
---                 DROP THE SCHEMA
----------------------------------------------------------------
drop view vw_position_and_depts;

alter table employee_position drop constraint fk_employee_dept_id;
alter table employee drop constraint fk_employee_position;
alter table employee drop constraint fk_employee_status;
alter table employee drop constraint fk_employee_relationship_status;

alter table dependent drop constraint fk_employee;
alter table dependent drop constraint fk_dependent_type;
alter table dependent drop constraint fk_dependent_status;

alter table life_event drop constraint fk_life_event_employee;
alter table life_event drop constraint fk_life_event_life_event_type;
alter table life_event drop constraint fk_life_event_dependent;
alter table life_event drop constraint fk_life_event_employee_enrollment; 
alter table life_event drop constraint fk_life_event_enrollment_relationship; 

alter table benefit_plan drop constraint fk_enrollment_period_plan;
alter table benefit_plan drop constraint fk_benefit_plan_type;

alter table benefit_plan_level drop constraint fk_benefit_plan;

alter table employee_enrollment drop constraint fk_enrollment_period;
alter table employee_enrollment drop constraint fk_employee;
alter table employee_enrollment drop constraint fk_employee_enrollment_type;

alter table benefit_plan_level_selected drop constraint fk_employee_enrollment;
alter table benefit_plan_level_selected drop constraint fk_benefit_plan_level;

alter table life_event_dependent drop constraint fk_life_event_dependent_life_event;
alter table life_event_dependent drop constraint fk_life_event_dependent_dependent;

drop table if exists employee_position;
drop table if exists employee_dept;
drop table if exists employee_status;
drop table if exists employee_relationship_status;
drop table if exists dependent_type;
drop table if exists dependent_status;
drop table if exists employee;
drop table if exists dependent;

drop table if exists life_event_type;
drop table if exists life_event_enrollment_relationship;
drop table if exists life_event;
drop table if exists life_event_dependent;

drop table if exists enrollment_period;
drop table if exists employee_enrollment;
drop table if exists employee_enrollment_type;
drop table if exists benefit_plan;
drop table if exists benefit_plan_type;
drop table if exists benefit_plan_level;
drop table if exists benefit_plan_level_selected;
