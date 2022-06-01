--What grades are stored in the database?
--SELECT *
--FROM Grade

--What emotions may be associated with a poem?
--SELECT *
--FROM Emotion

--How many poems are in the database?
--SELECT COUNT(Poem.Id) AS NUMOFPOEMS
--FROM Poem

--Sort authors alphabetically by name. What are the names of the top 76 authors?
--SELECT DISTINCT TOP 76 Name 
--FROM Author
--ORDER BY Name

--Starting with the above query, add the grade of each of the authors.
--SELECT DISTINCT TOP 76 a.Name, g.Name 
--FROM Author a
--LEFT JOIN Grade g ON a.GradeId=g.Id
--ORDER BY a.Name

--Starting with the above query, add the recorded gender of each of the authors.
--SELECT DISTINCT TOP 76 a.Name, g.Name, gen.Name 
--FROM Author a
--LEFT JOIN Grade g ON a.GradeId=g.Id
--LEFT JOIN Gender gen ON a.GenderId=gen.Id
--ORDER BY a.Name

--What is the total number of words in all poems in the database?
--SELECT SUM(WordCount) AS WORDCOUNT
--FROM Poem;

--Which poem has the fewest characters?
--Select Top 1 CharCount, Name, Title
--FROM Poem
--LEFT JOIN Author ON Poem.AuthorId=Author.Id
--ORDER BY CharCount;

--How many authors are in the third grade?
--SELECT COUNT(a.Id) AS 'Authors in 3RD grade'
--FROM Author a
--LEFT JOIN Grade g on a.GradeId=g.Id
--WHERE g.Id=3;

--How many total authors are in the first through third grades?
--SELECT Count(GradeId)
--FROM Author
--WHERE GradeId<4

--What is the total number of poems written by fourth graders?
--SELECT COUNT(p.Id)
--FROM Poem p 
--LEFT JOIN Author a on p.AuthorId=a.Id
--WHERE a.GradeId=4

--How many poems are there per grade?
--SELECT COUNT(p.Id) AS 'POEMS PER GRADE', a.GradeId
--FROM Poem p 
--LEFT JOIN Author a on a.Id=p.AuthorId
--GROUP BY a.GradeId
--ORDER BY a.GradeId

--How many authors are in each grade? (Order your results by grade starting with 1st Grade)
--SELECT  COUNT(Id) AS 'Authors in each grade', GradeId
--FROM Author
--GROUP BY GradeId
--ORDER BY GradeId

--What is the title of the poem that has the most words?
--SELECT TOP 1 *
--FROM Poem
--ORDER BY WordCount DESC

--Which author(s) have the most poems? (Remember authors can have the same name.)
--SELECT COUNT(p.Id) AS 'Amount of poems', p.AuthorId, a.Name
--FROM Poem p
--LEFT JOIN Author a ON p.AuthorId=a.Id 
--GROUP BY p.AuthorId, a.Name
--ORDER BY COUNT(p.ID) DESC

--How many poems have an emotion of sadness?
--SELECT COUNT(p.id) AS 'Sad Poems'
--FROM Poem p
--LEFT JOIN PoemEmotion pe ON p.Id=pe.PoemId
--LEFT JOIN Emotion e ON e.id=pe.EmotionId
--WHERE e.Name='sadness'

--How many poems are not associated with any emotion?
--SELECT COUNT(p.id) AS 'Poems with no emotion'
--FROM Poem p 
--Left JOIN PoemEmotion pe ON pe.PoemId=p.Id
--WHERE pe.EmotionId is NULL

--Which emotion is associated with the least number of poems?
--SELECT COUNT(p.Id) AS 'NUMBER OF POEMS', e.Name
--FROM Poem p
--LEFT JOIN PoemEmotion pe ON pe.PoemId=p.Id
--LEFT JOIN Emotion e ON e.Id=pe.EmotionId
--GROUP BY e.Name
--ORDER BY COUNT(p.Id)

--Which grade has the largest number of poems with an emotion of joy?
--SELECT Count(p.Id) AS 'SAD POEMS', g.Name
--FROM Poem p
--JOIN PoemEmotion pe ON pe.PoemId=p.Id
--JOIN Emotion e ON pe.EmotionId=e.Id
--JOIN Author a ON a.Id=p.AuthorId
--JOIN Grade g ON a.GradeId=g.Id
--WHERE e.Name='joy'
--GROUP BY g.Name
--ORDER BY COUNT(p.Id) DESC

--Which gender has the least number of poems with an emotion of fear?
--SELECT COUNT(p.Id) AS 'FEAR POEMS', g.Name
--FROM Poem p
--JOIN PoemEmotion pe ON p.Id=pe.PoemId
--JOIN Emotion e ON e.Id=pe.EmotionId
--JOIN Author a ON a.Id=p.AuthorId
--JOIN Gender g ON g.Id=a.GenderId
--WHERE e.Name='fear'
--GROUP BY g.Name
--ORDER BY COUNT(p.Id) 
