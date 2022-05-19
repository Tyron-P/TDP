Select title, Release_date from movies where release_date between  "1983-01-01" and "1993-12-31" order by release_date desc;

select release_date from movies;
#--------------------------------

select rating from ratings;

Select avg(rating) from ratings;

Select m.title, r.rating from movies m join ratings r on m.id=r.id;

select title, `movie_id` from movies m join
(select movie_id, avg(rating)
from ratings group by movie_id) lw on m.id=lw.movie_id where `movie_id` <=3;

Select title, `avg(rating)` from movies m join 
(select movie_id, avg(rating) 
from ratings group by movie_id) averages on m.id=averages.movie_id where `avg(rating)`<=1;


#-------------------------
Select name from genres;
Select name from genres where name='Sci-Fi';
select name from occupations where name="student";
Select age, gender from users where age=24 and gender="m";

#-----------
select genre_id