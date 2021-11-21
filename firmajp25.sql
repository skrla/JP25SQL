drop database if exists firmajp25;
create database firmajp25 character set utf8;
use firmajp25;

create table projekt(
    sifra int primary key not null auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18.2) not null,
    datumpocetka datetime not null,
    datumkraja datetime
);

create table programer(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datumrodenja datetime not null,
    placa decimal(18,2) not null
);

create table sudjeluje(
    projekt int not null,
    programer int not null
);

alter table sudjeluje add foreign key(projekt) references projekt(sifra);
alter table sudjeluje add foreign key(programer) references programer(sifra);

insert into programer(sifra, ime, prezime, datumrodenja, placa)
values (null, 'Ivan', 'Ivić', 1970-09-20, 15980.00),
(null, 'Tomislav', 'Jakopec', 1985-02-12, 17500.00),
(null, 'Stjepan', 'Groznica', 1983-10-01, 14670.00),
(null, 'Anja', 'Labak', 1997-08-04, 16150.50),
(null, 'Ana', 'Horvat', 1993-06-30, 12150.00),
(null, 'Matija', 'Skrletović', 1995-09-30, 10150.00);

insert into projekt(sifra, naziv, cijena, datumpocetka, datumkraja)
values (null, 'Java projekt', 50540.85, 2021-07-10, 2021-10-25),
(null, 'Php projekt', 62976.50, 2021-08-16, 2021-11-20),
(null, 'Android Studio', 75829.00, 2021-09-29, null);

insert into sudjeluje(projekt, programer)
values (1, 1),
(1, 2),
(2, 3),
(3, 4),
(2, 5),
(3, 6);