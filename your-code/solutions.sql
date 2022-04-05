Select a.au_id as AUTHOR_ID, au_fname as 'FIRST NAME', au_lname as 'LAST NAME', c.title as TITLE,d.pub_name as PUBLISHER
from authors a
join titleauthor b on a.au_id=b.au_id
join titles c on b.title_id=c.title_id
join publishers d on c.pub_id=d.pub_id