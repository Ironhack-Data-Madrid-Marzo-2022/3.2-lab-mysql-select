-- Challenge 1 - Who Have Published What At Where? --
SELECT a.au_id as AUTHOR_ID,
       a.au_lname as LAST_NAME,
       a.au_fname as FIRST_NAME,
       t.title as TITLE,
       p.pub_name as PUBLISHER

FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t on t.title_id = ta.title_id
LEFT JOIN publishers AS p on t.pub_id = p.pub_id


-- Challenge 2 - Who Have Published How Many At Where? --
SELECT ta.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, p.pub_name AS PUBLISHER, count(title) AS TITLE_COUNT
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t on t.title_id = ta.title_id
LEFT JOIN publishers AS p on t.pub_id = p.pub_id
GROUP BY p.pub_id, a.au_id;


-- Challenge 3 - Best Selling Authors --
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, sum(s.qty) AS TOTAL
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t on t.title_id = ta.title_id
JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id
LIMIT 3


-- Challenge 4 - Challenge 4 - Best Selling Authors Ranking --
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME,
sum(CASE WHEN s.qty IS NOT NULL THEN s.qty ELSE 0 END) AS TOTAL

FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t on t.title_id = ta.title_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC