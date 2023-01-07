#using the created database
use netflix;

#checking the structure of the tables
desc netflixmovies;
desc netflixshows;
desc rawcredits;
desc rawtitles;

#checking if the tables are populated from the python script
select * from netflixmovies limit 10;
select * from netflixshows limit 10;
select * from rawcredits limit 10;
select * from rawtitles;

#consolidating two flat files for further creation of dashboards

#performing join on rawtitle and rawcredits tables for the broadcasted shows on netflix
select t.title as Title,
    t.type as Type,
    r.name as 'Actor Name',
    r.role as Role,
    t.release_year as 'Released Year',
    t.age_certification as 'Age Certification',
    t.runtime as Runtime,
    t.genres as Genres,
    t.production_countries as 'Production Countries',
    t.seasons as 'Seasons Broadcasted',
    t.imdb_score as 'IMDB Score',
    t.imdb_votes as 'Number of Votes'
    FROM rawtitles as t
    JOIN rawcredits as r
    ON
    t.id = r.id
    WHERE t.type = "SHOW"
    ORDER BY t.imdb_score DESC;
    
#performing join on rawtitle and rawcredits tables for the broadcasted movies on netflix
select t.title as Title,
    t.type as Type,
    r.name as 'Actor Name',
    r.role as Role,
    t.release_year as 'Released Year',
    t.age_certification as 'Age Certification',
    t.runtime as Runtime,
    t.genres as Genres,
    t.production_countries as 'Production Countries',
    t.imdb_score as 'IMDB Score',
    t.imdb_votes as 'Number of Votes'
    FROM rawtitles as t
    JOIN rawcredits as r
    ON
    t.id = r.id
    WHERE t.type = "MOVIE"
    ORDER BY t.imdb_score DESC;
    

    
    
    