

-- Challenge1 --
SELECT titleauthor.au_id as "AUTHOR ID",
       authors.au_lname as "LAST NAME",
       authors.au_fname as "FIRST_NAME",
       titles.title as "TITLE",
       publishers.pub_name as "PUBLISHER"
FROM titleauthor
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;

-- Challenge2 --
SELECT titleauthor.au_id as "AUTHOR ID",
       authors.au_lname as "LAST NAME",
       authors.au_fname as "FIRST_NAME",
       count(titles.title) as "TITLE COUNT",
       publishers.pub_name as "PUBLISHER"
FROM titleauthor
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id, publishers.pub_id;

-- Challenge3 --
SELECT authors.au_id as "AUTHOR ID",
       authors.au_lname as "LAST NAME",
       authors.au_fname as "FIRST_NAME",
       sum(sales.qty) as "TOTAL"
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC
LIMIT 3;

-- Challenge4 --
SELECT authors.au_id as "AUTHOR ID",
       authors.au_lname as "LAST NAME",
       authors.au_fname as "FIRST_NAME",
       IFNULL(sum(sales.qty),0) as "TOTAL"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC;
