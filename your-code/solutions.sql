--  !! Challenge 1 !!

select 	ta.au_id as 'AUTHOR ID',
		au_lname as 'LAST NAME',
        au_fname as 'FIRST NAME',
		title as 'TITLE',
        pub_name as 'PUBLISHER'
        
-- Join titleauthors and authors
from titleauthor as ta
left join authors as a
on ta.au_id = a.au_id

-- Join titles
left join titles as t
on ta.title_id = t.title_id

-- Join publishers
left join publishers as p
on t.pub_id = p.pub_id;

CREATE TEMPORARY TABLE c1 
(select 	ta.au_id as 'AUTHOR ID',
		a.au_lname as 'LAST NAME',
        a.au_fname as 'FIRST NAME',
		t.title as 'TITLE',
        p.pub_name as 'PUBLISHER'
        
-- Join titleauthors and authors
from titleauthor as ta
left join authors as a
on ta.au_id = a.au_id

-- Join titles
left join titles as t
on ta.title_id = t.title_id

-- Join publishers
left join publishers as p
on t.pub_id = p.pub_id);

-- ------------------
-- !! Challenge 2 !!
-- ------------------

select ta.au_id, au_lname, au_fname, pub_name, count(title)
        
from titleauthor as ta
left join authors as a
on ta.au_id = a.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id
group by p.pub_id, a.au_id;



select c1.`AUTHOR ID`, c1.`LAST NAME`, c1.`FIRST NAME`, c1.`TITLE`, count(title)
from c1
group by `publisher`, `AUTHOR ID`;

-- -----------------
-- !! Challenge 3 !!
-- -----------------

select 	a.au_id as 'AUTHOR ID',
		a.au_lname as 'LAST NAME',
        a.au_fname as 'FIRST NAME',
        sum(s.qty) as 'TOTAL'
        

-- Join titleauthor and titles
from titles as t
left join titleauthor as ta
on ta.title_id = t.title_id

-- Join authors
left join authors as a
on ta.au_id = a.au_id

-- Join sales
left join sales as s
on s.title_id = t.title_id

group by a.au_id
order by sum(qty) desc
limit 3;

-- Challenge 4

select 	a.au_id as `AUTHOR ID`,
		a.au_lname as `LAST NAME`,
        a.au_fname as `FIRST NAME`,
        ifnull(sum(qty), 0) as `TOTAL`

-- Join titleauthor and titles
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id

left join titles as t
on ta.title_id = t.title_id

-- Join sales
left join sales as s
on s.title_id = t.title_id

group by a.au_id
order by `TOTAL` desc;