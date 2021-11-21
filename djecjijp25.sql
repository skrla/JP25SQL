drop database if exists djecjijp25;
create database djecjijp25;
use djecjijp25;

create table djecjivrtic(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    godinaosnutka int not null,
    adresa varchar(50) not null
);

create table odgojnaskupina(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    odgajatelj int not null,
    djecjivrtic int not null
);

create table odgajatelj(
    sifra int not null primary key auto_increment,
    osoba int not null,
    strucnasprema varchar(50) not null
);

create table dijete(
    sifra int not null primary key auto_increment,
    osoba int not null,
    odgojnaskupina int not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11)
);

alter table odgojnaskupina add foreign key(odgajatelj) references odgajatelj(sifra);
alter table odgojnaskupina add foreign key(djecjivrtic) references djecjivrtic(sifra);

alter table odgajatelj add foreign key(osoba) references osoba(sifra);

alter table dijete add foreign key(osoba) references osoba(sifra);
alter table dijete add foreign key(odgojnaskupina) references odgojnaskupina(sifra);

insert into djecjivrtic(sifra, naziv, godinaosnutka, adresa)
values (null, 'Zvrk', 2000, 'Braće Radića 50'),
(null, 'Tratinčica', 2005, 'Braće Banas 1');

insert into osoba(sifra, ime, prezime, oib)
values (null, 'Ivan', 'Ivić', 12345678976),
(null, 'Tomislav', 'Jakopec', 12345678998),
(null, 'Stjepan', 'Groznica', 13579864212),
(null, 'Anja', 'Labak', 23456789012),
(null, 'Ana', 'Horvat', 34567890143),
(null, 'Matija', 'Skrletović', 35625890421);

insert into odgajatelj(sifra, osoba, strucnasprema)
values (null, 1, 'VSS'),
(null, 2, 'VSS');

insert into odgojnaskupina(sifra, naziv, odgajatelj, djecjivrtic)
values (null, 'Zvrkovi95', 1, 1),
(null, 'Tratinčice97', 2, 2);

insert into dijete(sifra, osoba, odgojnaskupina)
values (null, 3, 1),
(null, 4, 2),
(null, 5, 2),
(null, 6, 1);