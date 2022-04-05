-- CHALLENGE 1
select 	authors.au_id as 'AUTHOR ID',
		authors.au_lname as 'LAST NAME',
        authors.au_fname as 'FIRST NAME', 
        titles.title as 'TITLE',
        publishers.pub_name as 'PUBLISHER'
from authors

left join titleauthor
on authors.au_id = titleauthor.au_id

left join titles
on titleauthor.title_id = titles.title_id

join publishers
on titles.pub_id = publishers.pub_id;

-- CHALLENGE 2
select 	authors.au_id as 'AUTHOR ID',
		authors.au_lname as 'LAST NAME',
        authors.au_fname as 'FIRST NAME', 
        publishers.pub_name as 'PUBLISHER',
        count(titles.title) as 'TITLE COUNTS'
from authors

left join titleauthor
on authors.au_id = titleauthor.au_id

left join titles
on titleauthor.title_id = titles.title_id

join publishers
on titles.pub_id = publishers.pub_id

group by authors.au_id, publishers.pub_name
order by count(titles.title) desc;

-- CHALLENGE 3
select 	authors.au_id as 'AUTHOR ID',
		authors.au_lname as 'LAST NAME',
        authors.au_fname as 'FIRST NAME', 
        sum(sales.qty) as 'TOTAL'
from authors

left join titleauthor
on titleauthor.au_id = authors.au_id

left join titles
on titles.title_id = titleauthor.title_id

left join sales
on sales.title_id = titles.title_id

group by authors.au_id
order by sum(qty) desc
limit 3;

-- CHALLENGE 4
select 	authors.au_id as 'AUTHOR ID',
		authors.au_lname as 'LAST NAME',
        authors.au_fname as 'FIRST NAME', 
        ifnull(sum(sales.qty),0) as 'TOTAL'
from authors

left join titleauthor
on titleauthor.au_id = authors.au_id

left join titles
on titles.title_id = titleauthor.title_id

left join sales
on sales.title_id = titles.title_id

group by authors.au_id
order by sum(qty) desc
limit 23;