create database Library
use Library 

create table Authors(
Id int primary key Identity,
Name nvarchar(50),
Surname nvarchar(50)
)
insert into Authors (Name,Surname) values ('Elshad','Qarayev'),('Elxan','Elatli'),('Orxan','Veliyev')

create table Books(
Id int primary key Identity,
Name nvarchar(50) not null,
AuthorId int references Authors(Id)
)
insert into Books (Name,AuthorId) values ('Leyla',1),('Reysler uzerinde uzanmis adam',2),('Kitab',3)

create table Genres(
Id int primary key Identity,
Name nvarchar(50)
)
insert into Genres (Name) values ('Realist'),('Historical'),('Horror')

create table GenreToAuthor(
Id int primary key Identity,
AuthorId int references Authors(Id),
GenreId int references Genres(Id)
)
insert into GenreToAuthor (AuthorId,GenreId) values (1,2),(2,1),(3,3)

select * from GenreToAuthor as gta
join Authors on gta.AuthorId=Authors.Id
join Genres on gta.GenreId=Genres.Id
join Books on Books.AuthorId=Authors.Id