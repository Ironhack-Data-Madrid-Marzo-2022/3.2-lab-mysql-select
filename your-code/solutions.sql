use publication;

SELECT a.au_id as 'AUTHOR ID' , a.au_lname AS 'LAST_NAME', a.au_fname AS 'FIRST_NAME', T.title AS 'TITLE', p.pub_name AS 'PUBLISHER_NAME'
from authors as a
inner join titleauthor as ta
on a.au_id = ta.au_id
inner join titles as T
on ta.title_id = T.title_id
inner join publishers as p
on T.pub_id = p.pub_id;

SELECT a.au_id as 'AUTHOR ID' , a.au_lname AS 'LAST_NAME', a.au_fname AS 'FIRST_NAME', T.title AS 'TITLE', p.pub_name AS 'PUBLISHER_NAME'
from authors as a
inner join titleauthor as ta
on a.au_id = ta.au_id
inner join titles as T
on ta.title_id = T.title_id
inner join publishers as p
on T.pub_id = p.pub_id;

#Challenge 2

SELECT a.au_id as 'AUTHOR ID' , a.au_lname AS 'LAST_NAME', a.au_fname AS 'FIRST_NAME', p.pub_name AS 'PUBLISHER_NAME', Count(T.title)
from authors as a
inner join titleauthor as ta
on a.au_id = ta.au_id
inner join titles as T
on ta.title_id = T.title_id
inner join publishers as p
on T.pub_id = p.pub_id
group by T.title;

#Challenge 3

Select  A.au_id as 'AUTHOR ID', A.au_lname'LAST NAME', A.au_fname'FIRST NAME', sum(qty) AS TOTAL
FROM authors AS A
inner join titleauthor AS ta
on A.au_id =ta.au_id
inner join titles AS T
on ta.title_id= T.title_id
inner join sales AS s
on T.title_id= s.title_id
group by A.au_id
order by TOTAL desc
LIMIT 3;

#Challenge 4

Select  A.au_id as 'AUTHOR ID', A.au_lname'LAST NAME', A.au_fname'FIRST NAME', ifnull(sum(qty),0) AS TOTAL
FROM authors AS A
left join titleauthor AS ta
on A.au_id =ta.au_id
left join titles AS T
on ta.title_id= T.title_id
left join sales AS s
on T.title_id= s.title_id
group by A.au_id
order by sum(qty) desc;





