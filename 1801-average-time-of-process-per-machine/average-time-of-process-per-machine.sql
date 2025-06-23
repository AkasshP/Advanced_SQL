/* Write your PL/SQL query statement below */
with strt_time as 
(select machine_id, sum(timestamp) as start_, count(distinct process_id) as process_cnt
from Activity where activity_type = 'start' 
group by machine_id),
end_time as 
(select machine_id, sum(timestamp) as end_ 
from Activity where activity_type = 'end' 
group by machine_id),
process as 
(select s.machine_id ,round(((e.end_ - s.start_) / s.process_cnt),3) as processing_time  from strt_time s join end_time e on s.machine_id = e.machine_id);

select * from process;
