/* Write your PL/SQL query statement below */
-- select area from world;
select name,population,area from world where population >= 25000000 or area >= 3000000;