
create table student_stat (
-- TODO:
)

create procedure calc_student_stat
-- TODO:
begin
create table student_stat as 
select
	t1.name
	,t3.teacher
	,t3.subject
	,t5.avg_score
	,t2.score
	,t4.sum_score
	,t2.score/t4.sum_score
from
	student t1
left join
	score t2
	on t1.id = t2.student_id
left join
	subject t3  
	on t2.subject_id = t3.id
left join 
	(select
		student_id
		,sum(score) sum_score
	from
		score a 
	group by 
		student_id) t4
	on t2.student_id = t4.student_id
left join 
	(select
		subject_id
		,avg(score) avg_score
	from
		score a 
	group by 
		subject_id) t5
	on t2.subject_id = t5.subject_id
end;