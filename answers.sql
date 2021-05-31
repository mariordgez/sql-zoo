/*Problem 1*/
SELECT population FROM world
  WHERE name = 'Germany'
/*Problem 2*/
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');
/*Problem 3*/
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
/*Select From World*/
/*Problem 1*/
SELECT name, continent, population FROM world
/*Problem 2*/
SELECT name
  FROM world
 WHERE population > 1000000000
/*Problem 3*/
SELECT name, GDP/population
  FROM world
 WHERE population > 200000000
/*Problem 4*/
SELECT name, population/1000000
FROM World
WHERE continent = 'South America'

/*Problem 5*/
SELECT name, population
FROM World
WHERE name IN ('France', 'Germany', 'Italy')
/*Problem 6*/
SELECT name
FROM World
WHERE name LIKE '%United%'
/*Problem 7*/

SELECT name, population, area
FROM World
WHERE area> 3000000 or population > 250000000
/*Problem 8*/
SELECT name, population, area
FROM World
WHERE (area> 3000000 and population < 250000000) or (area< 3000000 and population > 250000000)
/*Problem 9*/
SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2)
FROM World
WHERE continent = 'South America'
/*Problem 10*/
SELECT name, ROUND(GDP/population, -3)
FROM World
WHERE GDP > 1000000000000
/*Problem 11*/
SELECT name, capital
  FROM world
 WHERE LEN(name)=LEN(capital)
/*Problem 12*/
SELECT name, capital
FROM world
WHERE LEFT(name,1)=LEFT(capital,1) and name<>capital
/*Problem 13*/
SELECT name
   FROM world
WHERE name LIKE '%u%'
  AND name NOT LIKE '% %'
  AND name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
/*SELECT From Nobel*/
/*Problem 1*/
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
/*Problem 2*/
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
/*Problem 3*/
SELECT yr, subject
FROM nobel
WHERE winner= 'Albert Einstein'
/*Problem 4*/
SELECT winner
FROM nobel
WHERE subject='Peace' 
AND yr>=2000
/*Problem 5*/
SELECT yr, subject, winner
FROM nobel
WHERE subject='Literature' 
AND yr BETWEEN 1980 AND 1989
/*Problem 6*/
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter', 'Barack Obama')
/*Problem 7*/
SELECT winner 
FROM nobel
 WHERE winner LIKE 'John%'
/*Problem 8*/
SELECT * 
FROM nobel
 WHERE yr=1980 AND subject='Physics' 
OR yr=1984 AND subject= 'Chemistry' 
/*Problem 9*/
SELECT * 
FROM nobel
 WHERE (yr=1980) AND subject NOT IN ('Chemistry', 'Medicine')
/*Problem 10*/
SELECT * 
FROM nobel
 WHERE yr<1910 AND subject='Medicine' 
OR yr>2003 AND subject= 'Literature' 
/*Problem 11*/
SELECT * 
FROM nobel
 WHERE winner = 'PETER GRÜNBERG'
/*Problem 12*/
SELECT * 
FROM nobel
 WHERE winner = 'Eugene O''Neill'
/*Problem 13*/
SELECT winner, yr, subject 
FROM nobel
 WHERE winner LIKE  'Sir%'
ORDER BY yr DESC, winner
/*Problem 14*/
SELECT winner, subject
  FROM nobel
 WHERE yr=1984 
 ORDER BY
CASE WHEN subject IN ('Chemistry','Physics') THEN 1 ELSE 0 END,  subject, winner
/*SELECT IN SELECT tutorial*/
/*Problem 1*/
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
/*Problem 2*/
SELECT name FROM world
  WHERE gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom')
AND continent='Europe'
/*Problem 3*/
SELECT name, continent FROM world
  WHERE continent IN
     (SELECT continent FROM world
      WHERE name='Argentina' OR name= 'Australia')
/*Problem 4*/
SELECT name, population FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Canada') 
AND population < (SELECT population FROM world
      WHERE name='Poland') 

/*Problem 5*/
SELECT name, CONCAT (CAST(STR(ROUND(100*population/(SELECT population FROM world
      WHERE name='Germany'),0 ) )AS INT), '%') 
FROM world
  WHERE continent='Europe'

/*Problem 6*/
SELECT name
  FROM world
 WHERE gdp > ALL(SELECT gdp
                           FROM world
                          WHERE gdp>0 AND continent='Europe')
/*Problem 7*/
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

/*Problem 8*/
SELECT continent, name  FROM world x
  WHERE  name<= ALL
    (SELECT name FROM world y
        WHERE y.continent=x.continent
         )

/*Problem 9*/
SELECT name, continent, population FROM world x
  WHERE 25000000>= ALL
       (SELECT population FROM world y
        WHERE y.continent=x.continent)
/*Problem 10*/
SELECT name, continent FROM world x
  WHERE population>= ALL
       (SELECT population*3 FROM world y
        WHERE y.continent=x.continent AND y.name<> x.name)
/*SUM AND COUNT TUTORIAL*/
/*Problem 1*/
SELECT SUM(population)
FROM world
/*Problem 2*/
SELECT DISTINCT continent FROM world
/*Problem 3*/
SELECT SUM(gdp)
FROM world
WHERE continent='Africa'
/*Problem 4*/
SELECT COUNT(name)
FROM world
WHERE area>=1000000
/*Problem 5*/
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
/*Problem 6*/
SELECT continent, count(name)
  FROM world
 GROUP BY continent
/*Problem 7*/
SELECT continent, count(name)
 FROM world
 WHERE population>=10000000
 GROUP BY continent
/*Problem 8*/
SELECT continent
  FROM world
 GROUP BY continent
HAVING SUM(population)>100000000
/*JOIN TUTORIAL*/
/*Problem 1*/
SELECT matchid, player FROM goal 
  WHERE teamid='GER'
/*Problem 2*/
SELECT id,stadium,team1,team2
  FROM game
WHERE id=1012
/*Problem 3*/
SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid='ger'
/*Problem 4*/
SELECT team1,team2, player
  FROM game JOIN goal ON (id=matchid)
  WHERE player LIKE 'Mario%'
/*Problem 5*/
SELECT player, teamid, coach,gtime
  FROM goal JOIN eteam ON (id=teamid)
 WHERE gtime<=10
/*Problem 6*/
SELECT mdate, teamname
  FROM eteam JOIN game ON (eteam.id=team1)
 WHERE coach = 'Fernando Santos'
/*Problem 7*/
SELECT player
  FROM game JOIN goal ON (id=matchid)
  WHERE stadium='National Stadium, Warsaw'
/*Problem 8*/
SELECT  distinct player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND teamid NOT IN('GER')
/*Problem 9*/
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname
/*Problem 10*/
SELECT stadium, COUNT(*)
  FROM game JOIN goal ON (id=matchid)
 GROUP BY stadium
/*Problem 11*/
SELECT matchid,mdate, count(player)
  FROM game JOIN goal ON (id = matchid)
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate
/*Problem 12*/

SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 FROM
    game LEFT JOIN goal ON (id = matchid)
    GROUP BY mdate,matchid, team1,team2
    ORDER BY mdate, matchid, team1, team2

/*MORE JOIN*/
/*Problem 1*/
SELECT id, title
 FROM movie
 WHERE yr=1962
/*Problem 2*/
SELECT yr
 FROM movie
 WHERE title='citizen kane'
/*Problem 3*/
SELECT id, title, yr
 FROM movie
 WHERE title LIKE '%star trek%'
order by yr
/*Problem 4*/
SELECT id
 FROM actor
 WHERE name = 'Glenn close'

/*Problem 5*/
SELECT id
 FROM movie
 WHERE title= 'casablanca'
/*Problem 6*/
SELECT name
 FROM actor JOIN casting ON (actor.id=casting.actorid)
 WHERE movieid= 27
/*Problem 7*/
SELECT name
 FROM movie JOIN casting ON movie.id=movieid
      JOIN actor   ON actorid=actor.id
 WHERE title='alien'
/*Problem 8*/
SELECT title
 FROM movie JOIN casting ON movie.id=movieid
      JOIN actor   ON actorid=actor.id
 WHERE name='harrison ford'
/*Problem 9*/
SELECT title
 FROM movie JOIN casting ON movie.id=movieid
      JOIN actor   ON actorid=actor.id
 WHERE name='harrison ford' AND ord NOT IN (1)
/*Problem 10*/
SELECT title, name
 FROM movie JOIN casting ON movie.id=movieid
      JOIN actor   ON actorid=actor.id
 WHERE ord=1 and yr=1962
/*Problem 11*/
SELECT yr, COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock hudson'
GROUP BY yr
HAVING Count(title)>1
/*Problem 12*/
SELECT title, name FROM movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE movie.id IN (
  SELECT movieid FROM casting
  WHERE actorid IN(SELECT id FROM actor WHERE name='Julie Andrews')) and ord=1

/*Problem 13*/
SELECT name
 FROM movie 
       JOIN casting ON movie.id=movieid
       JOIN actor   ON actorid=actor.id
WHERE ord=1
GROUP BY name
 HAVING SUM(ord)>14
ORDER BY name

/*Problem 14*/
SELECT title, COUNT(movieid)
 FROM movie 
       JOIN casting ON movie.id=movieid
       JOIN actor   ON actorid=actor.id
WHERE yr=1978
GROUP BY movieid, title
order by COUNT(movieid) DESC, title
/*Problem 15*/
SELECT DISTINCT name
 FROM movie 
       JOIN casting ON movie.id=movieid
       JOIN actor   ON actorid=actor.id
WHERE movie.id IN (
  SELECT movieid FROM casting
  WHERE actorid IN(SELECT id FROM actor WHERE name='Art Garfunkel')) AND name NOT IN ('Art Garfunkel')
/*NULL TUTORIAL*/
/*Problem 1*/
SELECT name
FROM teacher
WHERE dept IS NULL
/*Problem 2*/
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
/*Problem 3*/
SELECT teacher.name, dept.name
 FROM teacher left JOIN dept
           ON (teacher.dept=dept.id)
/*Problem 4*/
SELECT teacher.name, dept.name
 FROM teacher right JOIN dept
           ON (teacher.dept=dept.id)
/*Problem 5*/
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher

/*Problem 6*/
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept ON teacher.dept=dept.id

/*Problem 7*/
SELECT COUNT(teacher.name), COUNT(mobile)
FROM teacher LEFT JOIN dept ON teacher.dept=dept.id
/*Problem 8*/
SELECT dept.name, COUNT(teacher.dept)
FROM teacher RIGHT JOIN dept ON teacher.dept=dept.id
GROUP BY dept.name
/*Problem 9*/
SELECT teacher.name, CASE WHEN teacher.dept=1 THEN 'Sci' WHEN teacher.dept=2 THEN 'Sci' ELSE 'Art' END
FROM teacher LEFT JOIN dept ON teacher.dept=dept.id

/*Problem 10*/
SELECT teacher.name, CASE WHEN teacher.dept=1 THEN 'Sci' WHEN teacher.dept=2 THEN 'Sci' WHEN teacher.dept=3 THEN 'Art' Else 'None' END
FROM teacher LEFT JOIN dept ON teacher.dept=dept.id

/*SELF JOIN*/
/*Problem 1*/
Select COUNT(id)
FROM stops
/*Problem 2*/
Select id
FROM stops
WHERE name = 'Craiglockhart'
/*Problem 3*/
Select id, name
FROM stops JOIN route ON stops.id=stop
WHERE company ='LRT' and num='4'
/*Problem 4*/
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*)>1
/*Problem 5*/
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop=149
/*Problem 6*/
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'
/*Problem 7*/
SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name='Leith'
/*Problem 8*/
SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'
/*Problem 9*/
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and a.company='LRT'
GROUP BY stopb.name, a.company, a.num
/*Problem 10*/
SELECT DISTINCT routeone.num, routeone.company, routeone.name , routetwo.num, routetwo.company

FROM

    (select distinct a.num, a.company, stopb.name
     from route a join route b on (a.company=b.company and a.num=b.num) 
                  join stops stopa on (stopa.id=a.stop) 
                  join stops stopb on (stopb.id=b.stop)
     where stopa.name='Craiglockhart' and stopb.name<>'Lochend'
     ) AS routeone

JOIN

    (select distinct c.num, d.company, stopc.name
     from route c join route d on (c.company=d.company and c.num=d.num) 
                  join stops stopc on (stopc.id=c.stop) 
                  join stops stopd on (stopd.id=d.stop)
     where stopc.name <> 'Craiglockhart' and stopd.name='Lochend'
     ) AS routetwo
ON (routetwo.name=routeone.name)
/*Problem 11*/
/*Problem 12*/

