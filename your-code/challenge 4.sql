select 
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
ifnull(sum(qty), 0) as "TOTAL"


from authors

left join titleauthor 
on authors.au_id=titleauthor.au_id

left join titles
on   titleauthor.title_id=titles.title_id

left join sales
on titles.title_id=sales.title_id


group by authors.au_id
order by sum(qty) DESC

