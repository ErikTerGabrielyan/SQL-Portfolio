-- Answer 1
SELECT t2014.libname, t2014.stabr, t2009.libname
FROM pls_fy2014_pupld14a AS t2014
LEFT JOIN pls_fy2009_pupld09a AS t2009
ON t2014.fscskey = t2009.fscskey
WHERE t2009.libname IS NULL
ORDER BY t2014.stabr ASC, t2014.libname;
-- Answer 2
SELECT pls14.stabr,
sum(pls09.libraria) AS librarians_2009,
sum(pls14.libraria) AS librarians_2014,
round( (CAST(sum(pls14.libraria) AS decimal(10,1)) - 
sum(pls09.libraria)) /
sum(pls09.libraria) * 100, 2 ) AS 
pct_change_librarians
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.libraria > 0 AND pls09.libraria > 0
GROUP BY pls14.stabr
ORDER BY pct_change_librarians DESC;