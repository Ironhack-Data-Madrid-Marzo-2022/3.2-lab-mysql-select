-- -- challenge 2 -- 

select  

authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",

pub_name as publisher, 
count(title) as "title count"



from titles 

left join publishers
on titles.pub_id=publishers.pub_id

left join titleauthor
on titles.title_id=titleauthor.title_id

join authors
on titleauthor.au_id=authors.au_id
group by  authors.au_id, pub_name;