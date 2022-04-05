-- challenge 1

select 
	   authors.au_id,
       au_lname as "last name",
       au_fname as "first name", 
	   title,
	   pub_name as publisher
from titles

left join publishers
on titles.pub_id=publishers.pub_id

join titleauthor 
on titles.title_id = titleauthor.title_id

left join authors     
on titleauthor.au_id = authors.au_id;

-- challenge 2

select 
	   authors.au_id,
       au_lname as "last name",
       au_fname as "first name", 
	   pub_name as publisher,
       COUNT(title) as "title count"
       
from titles

left join publishers
on titles.pub_id=publishers.pub_id

join titleauthor 
on titles.title_id = titleauthor.title_id

left join authors     
on titleauthor.au_id = authors.au_id

group by authors.au_id, pub_name;

-- challenge 3

select 
	   authors.au_id as "Author ID",
       au_lname as "last name",
       au_fname as "first name", 
	   sum(qty) as "Total"
       
from titles

join titleauthor 
on titles.title_id = titleauthor.title_id

left join authors     
on titleauthor.au_id = authors.au_id

left join sales
on titles.title_id = sales.title_id

group by authors.au_id
order by sum(qty) DESC
limit 3;

-- challenge 4

select 
	   authors.au_id as "Author ID",
       au_lname as "last name",
       au_fname as "first name", 
	   sum(qty) as "Total"
       
from titles

left join titleauthor 
on titles.title_id = titleauthor.title_id

left join authors     
on titleauthor.au_id = authors.au_id

left join sales
on titles.title_id = sales.title_id

group by authors.au_id
order by sum(qty) DESC;

-- Como he construido sobre titles me sale todo null en el autor que no ha vendido ningun libreo

select 
	   authors.au_id as "Author ID",
       au_lname as "last name",
       au_fname as "first name", 
	   ifnull (sum(qty),0)  as "Total"
       
from authors

left join titleauthor 
on authors.au_id = titleauthor.au_id

left join titles     
on titleauthor.title_id = titles.title_id

left join sales
on titles.title_id = sales.title_id

group by authors.au_id
order by sum(qty) DESC;

