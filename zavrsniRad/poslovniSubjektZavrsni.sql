drop database if exists poslovniSubjekt;
create database poslovniSubjekt character set utf8;
use poslovniSubjekt;

create table poslovnaJedinica(
    sifraPoslovneJedinice int not null primary key auto_increment,
    nazivPoslovneJedinice varchar(50) not null,
    adresa varchar(50) not null
);

create table posao(
    sifraPosla int not null primary key auto_increment,
    opisPosla varchar(200) not null,
    cijenaPosla decimal(18,2) not null,
    lokacijaPosla varchar(250) not null,
    pocetakPosla datetime not null,
    krajPosla datetime,
    napomena varchar(200)
);

create table djelatnik(
    oib int primary key not null,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    adresaStanovanja varchar(50) not null,
    IBAN varchar(50) not null,
    poslovnaJedinica int not null,
    datumRodenja date not null,
    poreznaKartica varchar(50) not null,
    ugovorORadu varchar(50) not null,
    svjedozba varchar(50) not null,
    email varchar(50) not null
);

create table tim(
    sifraTima int not null primary key,
    nazivTima varchar(50) not null,
    napomena varchar(200)
);

create table clanTima(
    sifraClana int not null primary key auto_increment,
    djelatnik int not null,
    tim int not null,
    posao int not null
);

alter table djelatnik add foreign key (poslovnaJedinica) references poslovnaJedinica(sifraPoslovneJedinice);

alter table clanTima add foreign key (djelatnik) references djelatnik(oib);
alter table clanTima add foreign key (tim) references tim(sifraTima);
alter table clanTima add foreign key (posao) references posao(sifraPosla);


insert into poslovnaJedinica(sifraPoslovneJedinice, nazivPoslovneJedinice, adresa) values
(null, 'Arteco Osijek', 'Ulica Martina Divalta 133b'),
(null, 'Arteco Đakovo', 'Ulica Vladimira Nazora 10'),
(null, 'Arteco Vukovar', 'Fruškogorska 12');

insert into posao(sifraPosla, opisPosla, cijenaPosla, lokacijaPosla, pocetakPosla, krajPosla, napomena) values
(null, 'Unutrašnja keramika', 13206.95, 'Ulica Lorenza Jegera 5, Osijek', '2021-09-18', '2021-10-02', 'Posavijetovati se sa klijentom koje kombinacije stavljati'),
(null , 'Soboslikarski radovi', 9785.50, 'Ulica Kestenova 53, Osijek', '2021-09-29', '2021-10-04', 'Provjeriti koje boje točno koristiti'),
(null, 'Fasada', 32500.00, 'Ulica Vladimira Nazora 10, Đakovo', '2021-12-01', null, null),
(null, 'Soboslikarski radovi', 13450.75, 'Ulica Kralja Tomislava, Vukovar', '2021-10-26', '2021-11-08', 'Ponjeti vlastiti materijal');

#c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\users\skrla\OneDrive\Documents\Github\JP25SQL\zavrsniRad\poslovniSubjektZavrsni.sql