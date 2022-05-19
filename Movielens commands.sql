Select title, Release_date from movies where release_date between  "1983-01-01" and "1993-12-31" order by release_date desc;

select release_date from movies;

select rating from ratings;

Select avg(rating) from ratings;

Select m.title from movies m 
