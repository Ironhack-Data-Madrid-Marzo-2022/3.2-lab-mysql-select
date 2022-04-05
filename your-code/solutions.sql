-- Challenge 1

select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', t.title as TITLE, p.pub_name as PUBLISHER
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id

left join titles as t
on ta.title_id = t.title_id

join publishers as p
on t.pub_id = p.pub_id;


-- Challenge 2

select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', p.pub_name as PUBLISHER, count(t.title) as 'TITLE COUNT'
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id

left join titles as t
on ta.title_id = t.title_id

join publishers as p
on t.pub_id = p.pub_id

group by a.au_id, p.pub_name;

-- Challenge 3

select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', sum(qty) as TOTAL
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id

left join titles as t
on ta.title_id = t.title_id

join sales as s
on t.title_id = s.title_id

group by a.au_id
order by TOTAL desc
limit 3;

-- Challenge 4

select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', ifnull((qty),0) as TOTAL
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id

left join titles as t
on ta.title_id = t.title_id

left join sales as s
on t.title_id = s.title_id

group by a.au_id
order by TOTAL desc



