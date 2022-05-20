#1.	List the titles and release dates of movies released between 1983-1993 in reverse chronological order.

Select title, Release_date from movies where release_date between  "1983-01-01" and "1993-12-31" order by release_date desc;

select release_date from movies;
#--------------------------------
#2.	Without using LIMIT, list the titles of the movies with the lowest average rating.

select rating from ratings;

Select avg(rating) from ratings;

Select m.title, r.rating from movies m join ratings r on m.id=r.id;

select title, `movie_id` from movies m join
(select movie_id, avg(rating)
from ratings group by movie_id) lw on m.id=lw.movie_id where `movie_id` <=3;

Select title, `avg(rating)` from movies m join 
(select movie_id, avg(rating) 
from ratings group by movie_id) averages on m.id=averages.movie_id where `avg(rating)`<=1;

#3.	List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.


#-------------------------
Select name from genres;
Select id, name from genres where name='Sci-Fi';

Select m.id, m.title from movies m join
(select gm.movie_id from genres_movies gm where gm.genre_id=15) as Scifi_movies on Scifi_movies.movie_id=m.id;

Select age, gender from users where age=24 and gender="m";

select o.id, o.name from occupations o where name="student";


select gm.genre_id from genres_movies gm where gm.genre_id=15;


Select u.id, u.occupation_id from users u 
	where u.occupation_id=(select o.id from occupations o where o.name="student") and age=24 and gender="m";
	
    #join (select o.id, o.name from occupations o where o.name="student")
#-----------
select genre_id
#4.	List the unique titles of each of the movies released on the most popular release day.
#5.	Find the total number of movies in each genre; list the results in ascending numeric order.

