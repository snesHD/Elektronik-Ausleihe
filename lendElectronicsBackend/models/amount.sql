
//Anzahl ausgeliehene Artikel 
SELECT B.id_article, COALESCE(B.borrowedAmount-R.returnedAmount, B.borrowedAmount) AS boAmount 
FROM (SELECT id_article, sum(borrowed.amount) as borrowedAmount
    FROM article
    LEFT JOIN borrowed
    ON article.id = borrowed.id_article
    GROUP BY id_article) AS B
LEFT JOIN  (SELECT id_article, sum(returnDetails.amount) as returnedAmount
    FROM borrowed 
    LEFT JOIN returnDetails
    ON borrowed.id = returnDetails.id_borrowed
    GROUP BY id_article) AS R
ON B.id_article = R.id_article;

//Ausleihliste
SELECT  id, 
        Bezeichnung, 
        Name, 
        Beschreibung, 
        COALESCE((article.amount-bo.boAmount),article.amount) AS amount,
        price
FROM article
LEFT JOIN (SELECT B.id_article, COALESCE(B.borrowedAmount-R.returnedAmount, B.borrowedAmount) AS boAmount 
FROM (SELECT id_article, sum(borrowed.amount) as borrowedAmount
    FROM article
    LEFT JOIN borrowed
    ON article.id = borrowed.id_article
    GROUP BY id_article) AS B
LEFT JOIN  (SELECT id_article, sum(returnDetails.amount) as returnedAmount
    FROM borrowed 
    LEFT JOIN returnDetails
    ON borrowed.id = returnDetails.id_borrowed
    GROUP BY id_article) AS R
ON B.id_article = R.id_article) AS bo
ON article.id = bo.id_article;

//Ausleihe Schüler Artikel - zurück zugegbener Artikel

SELECT borrowed.id as id, COALESCE(borrowed.amount - returnDetails.amount, borrowed.amount) as amount 
FROM borrowed 
LEFT JOIN returnDetails 
ON borrowed.id=returnDetails.id_borrowed 
WHERE id_student = 1 AND id_article = 2 
AND (
        borrowed.amount>returnDetails.amount 
        OR 
        returnDetails.amount is null
    )
;



