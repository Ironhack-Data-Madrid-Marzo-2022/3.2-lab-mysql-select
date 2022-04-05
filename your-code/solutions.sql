
Challenge 1 - Who Have Published What At Where?

SELECT authors.au_id as Author_ID, au_lname as Last_name, au_fname as First_name, title as Title, pub_name as Publisher
FROM authors
INNER JOIN titleauthor                   -- AS a
ON authors.au_id=titleauthor.au_id    -- t.title_id=a.title_id
INNER JOIN titles                        -- AS au
ON titles.title_id=titleauthor.title_id  -- a.au_id=au.au_id;
INNER JOIN publishers
ON titles.pub_id=publishers.pub_id;

Challenge 2 - Who Have Published How Many At Where?

SELECT authors.au_id as Author_ID, au_lname as Last_name, au_fname as First_name, pub_name as Publisher, count(title) as Num_Title
FROM authors
INNER JOIN titleauthor                            
ON authors.au_id=titleauthor.au_id               
INNER JOIN titles                            
ON titles.title_id=titleauthor.title_id        
INNER JOIN publishers
ON titles.pub_id=publishers.pub_id
GROUP BY titles.title;

Challenge 3 - Best Selling Authors

SELECT authors.au_id as Author_ID, au_lname as Last_name, au_fname as First_name, sum(qty) as Total
FROM authors
INNER JOIN titleauthor                            
ON authors.au_id=titleauthor.au_id            
INNER JOIN titles                            
ON titles.title_id=titleauthor.title_id      
INNER JOIN publishers
ON titles.pub_id=publishers.pub_id
INNER JOIN sales
ON titles.title_id=sales.title_id
GROUP BY authors.au_id
ORDER BY Total DESC
LIMIT 3;

Challenge 4 - Best Selling Authors Ranking

SELECT authors.au_id as Author_ID, au_lname as Last_name, au_fname as First_name, ifnull(sum(sales.qty),0) as Total
FROM authors
INNER JOIN titleauthor                            
ON authors.au_id=titleauthor.au_id            
INNER JOIN titles                            
ON titles.title_id=titleauthor.title_id      
INNER JOIN publishers
ON titles.pub_id=publishers.pub_id
LEFT JOIN sales
ON titles.title_id=sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC;
