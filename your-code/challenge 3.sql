select 
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
sum(qty) as "TOTAL"


from titles 

left join titleauthor 
on titles.title_id=titleauthor.title_id

left join authors
on   titleauthor.au_id=authors.au_id

left join sales
on titles.title_id=sales.title_id


group by authors.au_id
order by sum(qty) DESC
limit 3;
