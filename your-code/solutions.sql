##Challenge 1 - Who Have Published What At Where?
Select a.au_id as AUTHOR_ID, au_fname as 'FIRST NAME', au_lname as 'LAST NAME', c.title as TITLE,d.pub_name as PUBLISHER
from authors a
join titleauthor b on a.au_id=b.au_id
join titles c on b.title_id=c.title_id
join publishers d on c.pub_id=d.pub_id; -- 25 rows returned, same as titleauthor table

##Challenge 2 - Who Have Published How Many At Where?
Select a.au_id as AUTHOR_ID, au_fname as 'FIRST NAME', au_lname as 'LAST NAME' ,d.pub_name as PUBLISHER,count(title) as 'TITLE COUNT'
from authors a
join titleauthor b on a.au_id=b.au_id
join titles c on b.title_id=c.title_id
join publishers d on c.pub_id=d.pub_id
group by AUTHOR_ID, 'FIRST NAME','LAST NAME', PUBLISHER
order by 'TITLE COUNT' desc; -- 24 rows, 25 titles, same as titleauthor table

##Challenge 3 - Best Selling Authors
Select a.au_id as AUTHOR_ID, au_fname as 'FIRST NAME', au_lname as 'LAST NAME', sum(c.qty) as TOTAL
from authors a
join titleauthor b on a.au_id=b.au_id
join sales c on b.title_id=c.title_id
group by AUTHOR_ID, 'FIRST NAME','LAST NAME'
order by TOTAL desc
limit 3;

##Challenge 4 - Best Selling Authors Ranking
Select a.au_id as AUTHOR_ID, au_fname as 'FIRST NAME', au_lname as 'LAST NAME', IFNULL(sum(c.qty),0) as TOTAL
from authors a
left join titleauthor b on a.au_id=b.au_id
left join sales c on b.title_id=c.title_id
group by AUTHOR_ID, 'FIRST NAME','LAST NAME'
order by TOTAL desc;