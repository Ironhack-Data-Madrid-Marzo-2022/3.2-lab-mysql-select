-- Challenge 1:

select authors.au_id as AUTHOR_ID, au_fname as LAST_NAME, au_lname as FIRST_NAME, title as TITLE, pub_name as PUBLISHER
from titles
join titleauthor as ta
on titles.title_id=ta.title_id
left join authors
on ta.au_id=authors.au_id
left join publishers
on publishers.pub_id=titles.pub_id;

-- Challenge 2:

select authors.au_id as AUTHOR_ID, au_fname as LAST_NAME, au_lname as FIRST_NAME, pub_name as PUBLISHER, count(title) as TITLE_COUNT
from titles
join titleauthor as ta
on titles.title_id=ta.title_id
left join authors
on ta.au_id=authors.au_id
left join publishers
on publishers.pub_id=titles.pub_id
group by authors.au_id, pub_name;

-- Challenge 3:

select authors.au_id as AUTHOR_ID, au_fname as LAST_NAME, au_lname as FIRST_NAME,  sum(qty) as TOTAL
from titles
left join titleauthor as ta
on titles.title_id=ta.title_id
left join authors
on ta.au_id=authors.au_id
left join sales
on sales.title_id= titles.title_id
group by authors.au_id
order by total desc limit 3
;


-- Challenge 4:

create temporary table quantity_by_author
select authors.au_id as AUTHOR_ID, au_fname as LAST_NAME, au_lname as FIRST_NAME, title, qty as TOTAL
from authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join titles
on titles.title_id=titleauthor.title_id
left join sales
on sales.title_id=titleauthor.title_id

group by authors.au_id
;

Select AUTHOR_ID,LAST_NAME,FIRST_NAME,title,coalesce(qty , 0 ) as TOTAL
from quantity_by_author ;


-- otra solucion para el challenge 4 sin tabla temporal:


select authors.au_id as AUTHOR_ID, au_fname as LAST_NAME, au_lname as FIRST_NAME, title,coalesce(qty , 0 ) as TOTAL
from authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join titles
on titles.title_id=titleauthor.title_id
left join sales
on sales.title_id=titleauthor.title_id

group by authors.au_id
;

