SELECT name, email, gender FROM clients WHERE gender = 'F';

SELECT YEAR(birthdate) FROM clients WHERE gender = 'F';

SELECT name, YEAR(NOW()) - YEAR(birthdate) FROM clients;

SELECT name, YEAR(NOW()) - YEAR(birthdate) FROM clients WHERE name LIKE '%Saave%';

SELECT name, email, YEAR(NOW()) - YEAR(birthdate) AS edad FROM clients WHERE gender = 'F' AND name LIKE '%Lopez%';

SELECT COUNT(*) FROM books;

SELECT COUNT(*) FROM authors;

SELECT * FROM authors WHERE author_id > 0 AND author_id <= 5;

SELECT * FROM books WHERE author_id BETWEEN 1 AND 5;

SELECT book_id, author_id, title FROM books WHERE author_id BETWEEN 1 AND 5;

SELECT b.book_id, b.title,a.author_id, a.name  FROM books AS b 
JOIN authors AS a 
    ON a.author_id = b.author_id 
WHERE a.author_id BETWEEN 1 AND 5;

SELECT c.name, b.title, a.name, t.type
FROM transactions AS t
JOIN books AS b
    ON b.book_id = t.book_id
JOIN clients AS c
    ON c.client_id = t.client_id
JOIN authors AS a
    ON a.author_id = b.author_id
WHERE c.gender = 'F' AND t.TYPE = 'sell';


SELECT c.name, b.title, a.name, t.type
FROM transactions AS t
JOIN books AS b
    ON b.book_id = t.book_id
JOIN clients AS c
    ON c.client_id = t.client_id
JOIN authors AS a
    ON a.author_id = b.author_id
WHERE c.gender = 'M' AND t.TYPE IN ('sell', 'lend');


SELECT a.author_id, a.name, a.nationality, b.title
FROM authors AS a
LEFT JOIN books AS b
    ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id;

SELECT a.author_id, a.name, a.nationality, COUNT(b.book_id) AS libros
FROM authors AS a
LEFT JOIN books AS b
    ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
GROUP BY a.author_id
ORDER BY a.author_id;

--Que nacionalidades hay

SELECT DISTINCT nationality FROM authors;

-- cuantos escritores por necionalidad

SELECT DISTINCT nationality, COUNT(author_id) AS c_authors
FROM authors
WHERE nationality IS NOT NULL
GROUP BY nationality
ORDER BY c_authors DESC, nationality ASC;

-- promedio de los precios de los libros
SELECT nationality, AVG(price) AS promedio, STDDEV(price) AS std
FROM books AS b
JOIN authors AS a
    ON a.author_id = b.author_id
GROUP BY nationality;

--Precio maximo de un libro

SELECT MAX(price)
FROM books;

SELECT c.name, t.type, b.title, CONCAT(a.name, " (", a.nationality, ")") AS author,
TO_DAYS(NOW()) - TO_DAYS(t.created_at) AS ago
FROM transactions AS t
LEFT JOIN clients AS c
    ON c.client_id = t.client_id
LEFT JOIN books AS b
    ON b.book_id = t.book_id
LEFT JOIN authors AS a
    ON a.author_id = b.author_id
