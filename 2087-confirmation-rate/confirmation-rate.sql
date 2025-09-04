/* Write your PL/SQL query statement below */
with timeout as (select user_id, count(user_id) as reject from confirmations where action != 'timeout' group by user_id),
total as (select user_id, count(user_id) as tot from confirmations group by user_id),
result as (select t.user_id, round(o.reject / t.tot, 2) as confirmation_rate from total t join timeout o on t.user_id = o.user_id)
select s.user_id, nvl(r.confirmation_rate,0) as confirmation_rate  from signups s left join result r on s.user_id = r.user_id;


