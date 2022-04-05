CHALLENGE 1

select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME' , a.au_fname as 'FIRST NAME', t.title as 'TITLE', p.pub_id as 'PUBLISHERS' 

 from authors as a

left join titleauthor as ta
on a.au_id=ta.au_id
left join titles as t
on t.title_id = ta.title_id
join publishers as p 
on p.pub_id = t.pub_id;



CHALLENGE 2

select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME' , a.au_fname as 'FIRST NAME', t.title as 'TITLE', p.pub_id as 'PUBLISHERS' , count(t.title)

 from authors as a

left join titleauthor as ta
on a.au_id=ta.au_id
left join titles as t
on t.title_id = ta.title_id
join publishers as p 
on p.pub_id = t.pub_id

group by a.au_lname, a.au_fname,p.pub_id ;





CHALLENGE 3


select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME' , a.au_fname as 'FIRST NAME', t.title as 'TITLE', sum(s.qty) as 'TOTAL'

 from authors as a

left join titleauthor as ta
on a.au_id=ta.au_id
left join titles as t
on t.title_id = ta.title_id
join publishers as p 
on p.pub_id = t.pub_id
join sales as s 
on t.title_id = s.title_id

group by a.au_lname, a.au_fname,t.title_id 

order by sum(s.qty) desc
limit 3;



CHALLENGE 4

select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME' , a.au_fname as 'FIRST NAME', t.title as 'TITLE', IFNULL(sum(s.qty),0) as TOTAL

 from authors as a

left join titleauthor as ta
on a.au_id=ta.au_id
left join titles as t
on t.title_id = ta.title_id
left join publishers as p 
on p.pub_id = t.pub_id
left join sales as s 
on t.title_id = s.title_id

group by a.au_lname, a.au_fname,t.title_id 

order by sum(s.qty) desc
;