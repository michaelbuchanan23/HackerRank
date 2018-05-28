/*
drop table hackers;
drop table challenges;
*/

/*
create table hackers
(
	hacker_id int,
	name nvarchar(30)
)
go

create table challenges
(
challenge_id int,
hacker_id int
);
go

insert into hackers
	(hacker_id, name)
values
	(1, 'one'),
	(2, 'two'),
	(3, 'three'),
	(4, 'four');
go

insert into challenges
	(challenge_id, hacker_id)
values
	(11, 1),
	(12, 1),
	(13, 1),
	(21, 2),
	(22, 2),
	(23, 2),
	(31, 3),
	(32, 3),
	(41, 4)
go
*/

/*
select * from hackers;
select * from challenges;
*/

select h.hacker_id, h.name, count(c.challenge_id)
from hackers h
join challenges c on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having 
	count(c.challenge_id)
	= 
	(select TOP(1) count(c.challenge_id) from hackers h join challenges c on h.hacker_id = c.hacker_id group by h.hacker_id, h.name order by count(c.challenge_id) desc)
order by count(c.challenge_id) desc, h.hacker_id
