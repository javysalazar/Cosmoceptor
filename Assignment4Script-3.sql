-- Script for Assignment 4

-- Creating database with full name

/*CREATE DATABASE yourfullname;

-- Connecting to database 
\c yourfullname

-- Relation schemas and instances for assignment 2
*/
Drop Table Person cascade;
Drop Table Company cascade; 
Drop Table Skill cascade;
Drop Table worksFor cascade;
Drop Table companyLocation cascade;
Drop Table personSkill cascade;
Drop Table hasManager cascade;
Drop Table Knows cascade;
CREATE TABLE Person(pid integer,
                    pname text,
                    city text,
                    primary key (pid));

CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

CREATE TABLE Skill(skill text,
                   primary key (skill));


CREATE TABLE worksFor(pid integer,
                      cname text,
                      salary integer,
                      primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text,
                             city text,
                             primary key (cname, city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill(pid integer,
                         skill text,
                         primary key (pid, skill),
                         foreign key (pid) references Person (pid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE hasManager(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));

CREATE TABLE Knows(pid1 integer,
                   pid2 integer,
                   primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));



INSERT INTO Person VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'), 
     (1014,'Deepa', 'Bloomington'), 
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');

INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale');


INSERT INTO worksFor VALUES
     (1001,'Apple', 65000),
     (1002,'Apple', 45000),
     (1003,'Amazon', 55000),
     (1004,'Amazon', 55000),
     (1005,'Google', 60000),
     (1006,'Amazon', 55000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 50000),
     (1013,'Yahoo', 55000),
     (1014,'Apple', 50000), 
     (1015,'Amazon', 60000),
     (1016,'Amazon', 55000),
     (1017,'Netflix', 60000),
     (1018,'Apple', 50000),
     (1019,'Microsoft', 50000);

INSERT INTO companyLocation VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington'),
   ('Apple', 'Cupertino'),
   ('Amazon', 'Seattle'),
   ('Google', 'MountainView'),
   ('Netflix', 'LosGatos'),
   ('Microsoft', 'Redmond'),
   ('IBM', 'NewYork'),
   ('Yahoo', 'Sunnyvale');

INSERT INTO Skill VALUES
   ('Programming'),
   ('AI'),
   ('Networks'),
   ('OperatingSystems'),
   ('Databases');

INSERT INTO personSkill VALUES
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1010,'Databases'),
 (1011,'Databases'),
 (1013,'Databases'),
 (1014,'Databases'),
 (1017,'Databases'),
 (1019,'Databases'),
 (1005,'Databases'),
 (1006,'AI'),
 (1009,'Databases');
 

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1013, 1007),
 (1017, 1013),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);


INSERT INTO Knows VALUES
 (1011,1009),
 (1007,1016),
 (1011,1010),
 (1003,1004),
 (1006,1004),
 (1002,1014),
 (1009,1005),
 (1018,1009),
 (1007,1017),
 (1017,1019),
 (1019,1013),
 (1016,1015),
 (1001,1012),
 (1015,1011),
 (1019,1006),
 (1013,1002),
 (1018,1004),
 (1013,1007),
 (1014,1006),
 (1004,1014),
 (1001,1014),
 (1010,1013),
 (1010,1014),
 (1004,1019),
 (1018,1007),
 (1014,1005),
 (1015,1018),
 (1014,1017),
 (1013,1018),
 (1007,1008),
 (1005,1015),
 (1017,1014),
 (1015,1002),
 (1018,1013),
 (1018,1010),
 (1001,1008),
 (1012,1011),
 (1002,1015),
 (1007,1013),
 (1008,1007),
 (1004,1002),
 (1015,1005),
 (1009,1013),
 (1004,1012),
 (1002,1011),
 (1004,1013),
 (1008,1001),
 (1008,1019),
 (1019,1008),
 (1001,1019),
 (1019,1001),
 (1004,1003),
 (1006,1003),
 (1015,1003),
 (1016,1004),
 (1016,1006),
 (1008,1015),
 (1010,1008),
 (1017,1013),
 (1002,1001),
 (1009,1001),
 (1011,1005),
 (1014,1012),
 (1010,1002),
 (1010,1012),
 (1010,1018);

--\qecho 'Problem 1'
/*Find each pair (c, p) where c is the city and p is the pid
of the person that lives in c, and earns the highest salary
among all persons living in c. You must not use set predi-
cates in this query*/

with max_cp as (select p1.city, max(wf1.salary)
			 	  from person p1, worksfor wf1
				  where wf1.pid = p1.pid
				  group by 1)
				  
select cp.city, p.pid
from max_cp cp, person p, worksfor wf
where p.pid = wf.pid
and p.city = cp.city
and wf.salary = cp.max
order by 1, 2;
 

--\\qecho 'Problem 2'
/*Find the pid and pname of each person that knows the least
amount of people (greater than 0) at the company that they
work at. (The persons they know should work at the same
company).You must not use set predicates in this query.*/

with least_k as (select distinct k.pid1, count(k.pid1)
					from knows k, worksfor wf1, worksfor wf2 
					where k.pid1 = wf1.pid 
					and wf2.pid = k.pid2
				 	and k.pid1 <>k.pid2
					and wf1.cname = wf2.cname
					group by k.pid1),
					
least_comp as (		
					select wf.cname , min(lk.count)
					from least_k lk, worksfor wf
					where lk.pid1 = wf.pid
					group by wf.cname)

select distinct p.pid, p.pname
from  least_comp lc, least_k lk, person p, worksfor wf 
where lc.cname = wf.cname
and lc.min = lk.count
and lk.pid1 = p.pid 
and p.pid = wf.pid ;


-- i think netflix is wrong
--\\qecho 'Problem 3'
/*Find each pair (c, a) where c is the cname of each company
that has more than one manager, and a is the average salary
of all employees working at the company who are not man-
agers.You must not use set predicates in this query.*/

with c_mans as	(select wf.cname , count( wf.cname)
				from hasmanager hm, worksfor wf
				where  hm.mid = wf.pid
				group by wf.cname),

		not_mans as (
					select p.pid
					from person p
					except
					select distinct hm.mid 
					from hasmanager hm)

select wf.cname, avg (wf.salary) int
from c_mans cm, not_mans nm, worksfor wf
where cm.cname = wf.cname
and nm.pid = wf.pid
group by wf.cname;


--\\qecho 'Problem 4'
/*Find each pair (c, n) where c is the cname of a company
and n is the number of persons who
     (a) Work at c and earn strictly more than 55000
     (b) Have fewer than 4 skills
You must not use set predicates in this query.*/

with few_skill as (
				select ps.pid, count(ps.skill) from personskill ps
				group by ps.pid
				having  ps.count < 4)
				
select wf.cname as c, count(wf.pid) as n
from few_skill fs, worksfor wf
where wf.pid = fs.pid
and wf.salary > 55000
group by wf.cname;



--\\qecho 'Problem 5'
/*Find the cname of each company, such that some person
that works there knows at-least half the people that work
at Google.*/

with gg_cnt  as (select count(*)
				from worksfor wf
				Where wf.cname = 'Google'
				group by wf.cname),
				
gg_wkrs as (select wf.pid
			from worksfor wf
			where wf.cname = 'Google'),
			
			
know_hl as ( select k.pid1, count(*)
			from knows k, gg_wkrs gw
			where k.pid2 = gw.pid
			group by k.pid1 
			having k.count >= (select gg.count /2 from gg_cnt gg ))
			
select distinct wf.cname
from worksfor wf, know_hl kh
where kh.pid1 = wf.pid;



--\\qecho 'Problem 6'
/*
Find each skill that is the skill of a person who works at
a company that pays the lowest average salary among all
companies.
*/

with c_sals as(select wf.cname, avg(wf.salary)
from worksfor wf
group by wf.cname),

comp as (select cs.cname
		from c_sals cs
		where cs.avg = (select min(cs1.avg) from c_sals cs1))
		
select ps.skill
from comp c, worksfor wf, personskill ps
where c.cname = wf.cname
and wf.pid = ps.pid; 
--\\qecho 'Problem 7'
/*Find each triple (p1, p2, n), where p1 and p2 are pids of
different persons, and n is the number of common skills
between p1 and p2.*/

with matches as (
				select ps.pid as p1, ps2.pid as p2, count(*) as n 
				from personskill ps, personskill ps2
				where ps2.pid <> ps.pid
				and ps.skill = ps2.skill
				group by 1,2
				order by 1, 2 ),
				
				
non_match as (select p.pid as p1, p2.pid as p2
				from person p, person p2
				where p.pid <> p2.pid
				except
				select m.p1, m.p2
				from matches m ),
				
 fin as (select nm.p1, nm.p2, 0 as n
from non_match nm
union 
select * from matches m) 
select * from fin order by 1,2;


--\\qecho 'Problem 8'
/*
Using the GROUP BY count method, define a function personInfo
that returns for a company c identified by its cname, the
triple (p, s, n), where:
     - p is the pid of a person that works at c
     - s is the salary of p
     - n is the number of skills p has*/





create or replace function personInfo(c text)
	returns table (p int, s int, n int) as
	$$
		select wf.pid, wf.salary, ns.count 
		from worksfor wf,(select ps.pid, count(*)
						from personskill ps
						group by ps.pid) ns
		where wf.cname = c
		and wf.pid = ns.pid
		union
		select wf.pid, wf.salary, ns.count 
		from worksfor wf,(select ps.pid, count(*)
						from personskill ps
						group by ps.pid) ns
		where wf.cname = c
		and wf.pid = ns.pid
		union
		select wf.pid, wf.salary, 0
		from worksfor wf
		where wf.pid not in (select ps.pid from personskill ps)
		and wf.cname = c
$$ Language sql;

select * from personInfo('Apple');
select * from personInfo('Amazon');


--\\qecho 'Problem 9'
drop table if exists Point;
create table Point(x int, y int);
insert into Point values (1,3),(2,4),(3,1),(5,5),(6,2),(1,2),(2,1);

Select p1.x, p1.y, p2.x, p2.y 
from Point p1, point p2
where p1.x <> p2.x and p1.y <> p2.y and (p1.x + p1.y) = (p2.x + p2.y)
and power(Power(p1.x - p2.x, 2) + Power(p1.y - p2.y, 2),.5) > 2;

/*
Let Point(x int, y int) be a binary relation. Each pair
(x, y) in Point represents a point in 2-D Space.
With the data given in the script file, write a SQL query
that generates a tuple (x1, y1, x2, y2) of different points (x1, y1)
and (x2, y2), such that:

     (a) x1 ̸= x2 and y1 ̸= y2, and
     (b) x1 + y1 = x2 + y2, and
     (c) sqrt((x1 −x2)^2 + (y1 −y2)^2) > 2
*/

--\\qecho 'Problem 10'
/*
In statistics, the standard deviation is a measure of the
amount of variation or dispersion of a set of values. A
low standard deviation indicates that the values tend to be
close to the mean (also called the expected value) of the
set, while a high standard deviation indicates that the val-
ues are spread out over a wider range. You can read more
about it here:
https://en.wikipedia.org/wiki/Standard deviation
Define a function SalaryStandardDeviation(cname text),
that returns the standard deviation of the salaries of the
people working at the company identified by cname.*/

create or replace function SalaryStandardDeviation(cc text)
     returns table (std_deviation float) as
     $$
     	With c_avg as (select wf.cname, avg(wf.salary)
		from worksfor wf
		where wf.cname = cc
		group by wf.cname),

		 N as (select wf.cname, count(*) from worksfor wf where wf.cname = cc
		group by wf.cname)

		select  Power((sum(Power( wf.salary - ca.avg , 2))) / (select N.count from N where N.cname = cc),.5) 
		from worksfor wf, c_avg ca
		where wf.cname = ca.cname
		and ca.cname = cc
		group by cc
     $$ language sql;
	 
 

select * from  SalaryStandardDeviation('Apple');
select * from SalaryStandardDeviation('Amazon');
select * from  SalaryStandardDeviation('Google');
select * from  SalaryStandardDeviation('Netflix') ;





/*Some inbuilt functions that may come in handy:
https://www.postgresql.org/docs/7.4/functions-math.html

Test this function with:
(a) SalaryStandardDeviation(’Apple’)
(b) SalaryStandardDeviation(’Amazon’)
(c) SalaryStandardDeviation(’Google’)
(d) SalaryStandardDeviation(’Netflix’) 


-- Connect to default database
--\\c postgres

-- Drop database created for this assignment
--\DROP DATABASE yourfullname    ;


*/


