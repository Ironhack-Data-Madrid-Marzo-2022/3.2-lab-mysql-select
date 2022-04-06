-- Challenge 1:

select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME',authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
from authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join publishers
on titles.pub_id= publishers.pub_id;


-- Challenge 2:

select authors.au_id, authors.au_lname,authors.au_fname, count(titles.title) as 'TITLE COUNT', publishers.pub_name
from authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join publishers
on titles.pub_id= publishers.pub_id
group by titles.title;

-- Challenge 3:
select authors.au_id as 'AUTHOR ID',
 authors.au_lname as 'LAST NAME',
 authors.au_fname as 'FIRST NAME', sales.qty as 'TOTAL'
from authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join sales
on sales.title_id=titles.title_id
group by authors.au_id
ORDER BY sales.qty DESC
LIMIT 3;

-- Challenge 4:

select authors.au_id as 'AUTHOR ID',
 authors.au_lname as 'LAST NAME',
 authors.au_fname as 'FIRST NAME', sales.qty as 'TOTAL'
from authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join sales
on sales.title_id=titles.title_id
group by authors.au_id
ORDER BY sales.qty DESC;
