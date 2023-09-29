SELECT genre, count(*) AS quantidade 
FROM library 
GROUP BY genre 
ORDER BY quantidade DESC;

SELECT genre, ROUND(AVG(num_pages),0) AS media
FROM library
GROUP BY genre
HAVING media > 300
ORDER BY media DESC;

SELECT library_location, COUNT(*) AS num_books_available
FROM library
WHERE availability = 1
GROUP BY library_location
HAVING COUNT(*) >=3
ORDER BY num_books_available DESC;
