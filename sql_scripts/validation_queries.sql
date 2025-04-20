----------------------------------------------------------------
---                 plan structure
---------------------------------------------------------------- 

select
	  ep.enrollment_title
	, bp.benefit_plan_title
	, bpl.id
	, bpl.plan_level
	, bpl.plan_level_abbr
	, bpl.employer_cost
	, bpl.employee_cost
	
from
	enrollment_period ep 
	left outer join benefit_plan bp on ep.id = bp.enrollment_period_id
	left outer join benefit_plan_level bpl on bp.id = bpl.benefit_plan_id 
	
order by 
	  bp.id
	, bpl.sort_order;


----------------------------------------------------------------
---           employee positions and depts
----------------------------------------------------------------

select
	  e.first_name
	, e.last_name
	, e.employee_number 
	, e.employee_dob
	, e.employee_start_date
	, ep.employee_position
	, ed.employee_dept
	, es.employee_status
	, ers.employee_relationship_status
from
	employee e 
	inner join employee_position ep on e.employee_position_id  = ep.id
	inner join employee_dept ed on ep.employee_dept_id = ed.id
	inner join employee_status es on e.employee_status_id  = es.id
	inner join employee_relationship_status ers on e.employee_relationship_status_id  = ers.id;

----------------------------------------------------------------
---           employee and dependents
----------------------------------------------------------------
select
	  e.first_name
	, e.last_name
	, d.first_name
	, d.last_name
	, dt.dependent_type
	, ds.dependent_status
	, d.dependent_dob
	, d.dependent_active_date
	, d.dependent_inactive_date

from
	employee e 
	inner join dependent d on e.id = d.employee_id
	inner join dependent_status ds on d.dependent_status_id = ds.id
	inner join dependent_type dt on d.dependent_type_id = dt.id;


----------------------------------------------------------------
---           employee enrollments
----------------------------------------------------------------

select
	  e.first_name
	, e.last_name
	, e.employee_number 
	, e.employee_dob
	, e.employee_start_date
	, ep.enrollment_title
	, eet.employee_enrollment_type
	, let.life_event_type
	, d.first_name
	, d.last_name
	
	
from
	employee e 
	inner join employee_enrollment ee on e.id = ee.employee_id 
	inner join employee_enrollment_type eet on ee.employee_enrollment_type_id = eet.id
	inner join enrollment_period ep on ee.enrollment_period_id  = ep.id
	left outer join employee_enrollment_life_event eele on ee.id = eele.employee_enrollment_id
	left outer join life_event le on eele.life_event_id = le.id
	left outer join life_event_type let on le.life_event_type_id = let.id
	left outer join life_event_dependent led on le.id = led.life_event_id
	left outer join dependent d on led.dependent_id = d.id;
	
	
----------------------------------------------------------------
---           employee selected benefits
----------------------------------------------------------------

select
	  e.first_name
	, e.last_name
	, e.employee_number 
	, e.employee_dob
	, e.employee_start_date
	, ep.enrollment_title
	, eet.employee_enrollment_type
	, med.medical_plan
	, med.plan_level as med_plan_level
	, dental.dental_plan
	, dental.plan_level as dental_plan_level
	, vision.vision_plan
	, vision.plan_level as vision_plan_level
	, std.std_plan
	, std.plan_level as std_plan_level
	, ltd.ltd_plan
	, ltd.plan_level as ltd_plan_level
	, corelife.core_life_plan
	, corelife.plan_level as core_life_plan_level
	, supplife.supp_life_plan
	, supplife.plan_level as supp_life_plan_level
	, addben.add_benefits_plan
	, addben.plan_level as add_benefits_plan_level
	
from
	employee e 
	inner join employee_enrollment ee on e.id = ee.employee_id 
	inner join employee_enrollment_type eet on ee.employee_enrollment_type_id = eet.id
	inner join enrollment_period ep on ee.enrollment_period_id  = ep.id
	
	left outer join (
	
						select
							  ee.id as employee_enrollment_id
							, ep.enrollment_title
							, bp.benefit_plan_title as medical_plan
							, bpl.plan_level
							, bpl.plan_level_abbr
							, bpl.employer_cost
							, bpl.employee_cost
							
						from
							enrollment_period ep 
							inner join benefit_plan bp on ep.id = bp.enrollment_period_id
							inner join benefit_plan_level bpl on bp.id = bpl.benefit_plan_id 
							inner join benefit_plan_type bpt on bp.benefit_plan_type_id = bpt.id
							inner join benefit_plan_level_selected bpls on bpl.id = bpls.benefit_plan_level_id
							inner join employee_enrollment ee on bpls.employee_enrollment_id = ee.id
						
						where
							bpt.benefit_plan_type = 'Medical'
						
						) as med on ee.id = med.employee_enrollment_id
	
		left outer join (
	
							select
								  ee.id as employee_enrollment_id
								, ep.enrollment_title
								, bp.benefit_plan_title as dental_plan
								, bpl.plan_level
								, bpl.plan_level_abbr
								, bpl.employer_cost
								, bpl.employee_cost
								
							from
								enrollment_period ep 
								inner join benefit_plan bp on ep.id = bp.enrollment_period_id
								inner join benefit_plan_level bpl on bp.id = bpl.benefit_plan_id 
								inner join benefit_plan_type bpt on bp.benefit_plan_type_id = bpt.id
								inner join benefit_plan_level_selected bpls on bpl.id = bpls.benefit_plan_level_id
								inner join employee_enrollment ee on bpls.employee_enrollment_id = ee.id
							
							where
								bpt.benefit_plan_type = 'Dental'
						
						) as dental on ee.id = dental.employee_enrollment_id
	
			left outer join (
	
							select
								  ee.id as employee_enrollment_id
								, ep.enrollment_title
								, bp.benefit_plan_title as vision_plan
								, bpl.plan_level
								, bpl.plan_level_abbr
								, bpl.employer_cost
								, bpl.employee_cost
								
							from
								enrollment_period ep 
								inner join benefit_plan bp on ep.id = bp.enrollment_period_id
								inner join benefit_plan_level bpl on bp.id = bpl.benefit_plan_id 
								inner join benefit_plan_type bpt on bp.benefit_plan_type_id = bpt.id
								inner join benefit_plan_level_selected bpls on bpl.id = bpls.benefit_plan_level_id
								inner join employee_enrollment ee on bpls.employee_enrollment_id = ee.id
							
							where
								bpt.benefit_plan_type = 'Vision'
						
						) as vision on ee.id = vision.employee_enrollment_id
	
				left outer join (
	
							select
								  ee.id as employee_enrollment_id
								, ep.enrollment_title
								, bp.benefit_plan_title as std_plan
								, bpl.plan_level
								, bpl.plan_level_abbr
								, bpl.employer_cost
								, bpl.employee_cost
								
							from
								enrollment_period ep 
								inner join benefit_plan bp on ep.id = bp.enrollment_period_id
								inner join benefit_plan_level bpl on bp.id = bpl.benefit_plan_id 
								inner join benefit_plan_type bpt on bp.benefit_plan_type_id = bpt.id
								inner join benefit_plan_level_selected bpls on bpl.id = bpls.benefit_plan_level_id
								inner join employee_enrollment ee on bpls.employee_enrollment_id = ee.id
							
							where
								bpt.benefit_plan_type = 'Short Term Disability'
						
						) as std on ee.id = std.employee_enrollment_id
						
						
				left outer join (
	
							select
								  ee.id as employee_enrollment_id
								, ep.enrollment_title
								, bp.benefit_plan_title as ltd_plan
								, bpl.plan_level
								, bpl.plan_level_abbr
								, bpl.employer_cost
								, bpl.employee_cost
								
							from
								enrollment_period ep 
								inner join benefit_plan bp on ep.id = bp.enrollment_period_id
								inner join benefit_plan_level bpl on bp.id = bpl.benefit_plan_id 
								inner join benefit_plan_type bpt on bp.benefit_plan_type_id = bpt.id
								inner join benefit_plan_level_selected bpls on bpl.id = bpls.benefit_plan_level_id
								inner join employee_enrollment ee on bpls.employee_enrollment_id = ee.id
							
							where
								bpt.benefit_plan_type = 'Long Term Disability'
						
						) as ltd on ee.id = ltd.employee_enrollment_id
						
				left outer join (
	
							select
								  ee.id as employee_enrollment_id
								, ep.enrollment_title
								, bp.benefit_plan_title as core_life_plan
								, bpl.plan_level
								, bpl.plan_level_abbr
								, bpl.employer_cost
								, bpl.employee_cost
								
							from
								enrollment_period ep 
								inner join benefit_plan bp on ep.id = bp.enrollment_period_id
								inner join benefit_plan_level bpl on bp.id = bpl.benefit_plan_id 
								inner join benefit_plan_type bpt on bp.benefit_plan_type_id = bpt.id
								inner join benefit_plan_level_selected bpls on bpl.id = bpls.benefit_plan_level_id
								inner join employee_enrollment ee on bpls.employee_enrollment_id = ee.id
							
							where
								bpt.benefit_plan_type = 'Life Insurance'
						
						) as corelife on ee.id = corelife.employee_enrollment_id
						
				left outer join (
	
							select
								  ee.id as employee_enrollment_id
								, ep.enrollment_title
								, bp.benefit_plan_title as supp_life_plan
								, bpl.plan_level
								, bpl.plan_level_abbr
								, bpl.employer_cost
								, bpl.employee_cost
								
							from
								enrollment_period ep 
								inner join benefit_plan bp on ep.id = bp.enrollment_period_id
								inner join benefit_plan_level bpl on bp.id = bpl.benefit_plan_id 
								inner join benefit_plan_type bpt on bp.benefit_plan_type_id = bpt.id
								inner join benefit_plan_level_selected bpls on bpl.id = bpls.benefit_plan_level_id
								inner join employee_enrollment ee on bpls.employee_enrollment_id = ee.id
							
							where
								bpt.benefit_plan_type = 'Supplemental Life'
						
						) as supplife on ee.id = supplife.employee_enrollment_id
						
				left outer join (
	
							select
								  ee.id as employee_enrollment_id
								, ep.enrollment_title
								, bp.benefit_plan_title as add_benefits_plan
								, bpl.plan_level
								, bpl.plan_level_abbr
								, bpl.employer_cost
								, bpl.employee_cost
								
							from
								enrollment_period ep 
								inner join benefit_plan bp on ep.id = bp.enrollment_period_id
								inner join benefit_plan_level bpl on bp.id = bpl.benefit_plan_id 
								inner join benefit_plan_type bpt on bp.benefit_plan_type_id = bpt.id
								inner join benefit_plan_level_selected bpls on bpl.id = bpls.benefit_plan_level_id
								inner join employee_enrollment ee on bpls.employee_enrollment_id = ee.id
							
							where
								bpt.benefit_plan_type = 'Additional Benefits'
						
						) as addben on ee.id = addben.employee_enrollment_id;
						
						
						
	