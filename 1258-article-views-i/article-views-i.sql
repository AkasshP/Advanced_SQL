/* Write your PL/SQL query statement below */
-- select * from views;
select distinct(author_id) as id from views where author_id  = viewer_id order by id;