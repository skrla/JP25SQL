drop database if exists poslovniSubjekt;
create database poslovniSubjekt character set utf8;
use poslovniSubjekt;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\users\skrla\OneDrive\Documents\Github\JP25SQL\zavrsniRad\poslovniSubjektZavrsni.sql
# c:\xampppp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\users\skrla\desktop\Edunova\JP25SQL\zavrsniRad\poslovniSubjektZavrsni.sql

create table poslovnaJedinica(
    sifraPoslovneJedinice int not null primary key auto_increment,
    nazivPoslovneJedinice varchar(50) not null,
    adresa varchar(50) not null
);

create table posao(
    sifraPosla int not null primary key auto_increment,
    opisPosla varchar(200) not null,
    cijenaPosla decimal(18,2) not null,
    lokacijaPosla varchar(300) not null,
    pocetakPosla datetime not null,
    krajPosla datetime,
    napomena varchar(200)
);

create table djelatnik(
    sifraDjelatnika int primary key not null auto_increment,
    oib char(15) not null,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    adresaStanovanja varchar(300) not null,
    IBAN varchar(50) not null,
    poslovnaJedinica int not null,
    datumRodenja date not null,
    strucnaSprema varchar(50) not null,
    email varchar(50) not null
);

create table tim(
    sifraTima int not null primary key auto_increment,
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

alter table clanTima add foreign key (djelatnik) references djelatnik(sifraDjelatnika);
alter table clanTima add foreign key (tim) references tim(sifraTima);
alter table clanTima add foreign key (posao) references posao(sifraPosla);


insert into poslovnaJedinica(sifraPoslovneJedinice, nazivPoslovneJedinice, adresa) values
(null, 'Arteco Osijek', 'Ulica Martina Divalta 133b'),
(null, 'Arteco Đakovo', 'Ulica Vladimira Nazora 10'),
(null, 'Arteco Vukovar', 'Fruškogorska 12');

insert into posao(sifraPosla, opisPosla, cijenaPosla, lokacijaPosla, pocetakPosla, krajPosla, napomena) values
(null, 'Unutrašnja keramika', 13206.95, 'Ulica Lorenza Jegera 5, Osijek', '2021-09-18', '2021-10-02', 'Posavijetovati se sa klijentom koje kombinacije stavljati'),
(null, 'Soboslikarski radovi', 9785.50, 'Ulica Kestenova 53, Osijek', '2021-09-29', '2021-10-04', 'Provjeriti koje boje točno koristiti'),
(null, 'Fasada', 32500.00, 'Ulica Vladimira Nazora 10, Đakovo', '2021-12-01', null, null),
(null, 'Soboslikarski radovi', 13450.75, 'Ulica Kralja Tomislava, Vukovar', '2021-10-26', '2021-11-08', 'Ponjeti vlastiti materijal');

insert into djelatnik(sifraDjelatnika, oib, ime, prezime, adresaStanovanja, IBAN, poslovnaJedinica, datumRodenja, strucnaSprema, email) values
(null, 49959630206, 'Adam', 'Labak', 'Braće Banas 125, Josipovac Punitovački', 'HR6024020067279214859', 2, '1993-06-08', 'SSS', 'adam.labak@gmail.com'),
(null, 08400200940, 'Ivan', 'Ivić', 'Vladimira Nazora 10, Satnica Đakovačka', 'HR9325000099871779178', 2, '1990-02-25', 'SSS', 'i.ivic90@gmail.com'),
(null, 23319388596, 'Marko', 'Barišić', 'Hercegovačka ulica 23, Ilok', 'HR1725000096186344892', 3, '1998-05-30', 'SSS', 'barisic.m98@gmail.com'),
(null, 53066596410, 'Luka', 'Lučić', 'Vukovarska ulica 209, Osijek', 'HR2023600009968567693', 1, '1969-10-10', 'NSS', 'lukalucic@gmail.com'),
(null, 31087828861, 'Stjepan', 'Marković', 'Ulica Kralja Tomisliva 15, Tenja', 'HR2324840085856281912', 1, '1976-05-09', 'NSS', 'smarkovic@gmail.com'),
(null, 53422846355, 'Ivan', 'Horvat', 'Diljska ulica 5, Čepin', 'HR9525000098359577563', 1, '1986-03-20', 'VSS', 'ivanhorvat@gmail.com'),
(null, 36335440393, 'Mario', 'Ivić', 'Fruškogorska 30, Vukovar', 'HR3223400094499261621', 3, '2000-09-28', 'VSS', 'ivicmar@gmail.com'),
(null, 98669839241, 'Miroslav', 'Sesar', 'Dunavska 70, Đakovo', 'HR5725000094218693158', 2, '1978-12-20', 'SSS', 'mirkan@gmail.com'),
(null, 04460455325, 'Slavko', 'Ferenčić', 'Ulica kralja Zvonimira 57, Vukovar', 'HR7325000091558138846', 3, '1980-04-24', 'SSS', 'ferencic@gmail.com'),
(null, 50990426783, 'Vedran', 'Vidaković', 'Osječka ulica 12, Čepin', 'HR5224020066445496511', 1, '1986-01-24', 'SSS', 'vvidakovic@gmail.com'),
(null, 66356460501, 'Janko', 'Bilanđija', 'Ulica Matije Gubca 10, Piškorevci', 'HR3024840084941866666', 2, '1993-07-08', 'SSS', 'jankob@gmail.com'),
(null, 50593234628, 'Vatroslav', 'Svršić', 'Ulica bana Josipa Jelačića 68, Bogdanovci', 'HR6825000098745344721', 3, '1978-04-15', 'SSS', 'vatro@gmail.com'),
(null, 81310918711, 'Tomislav', 'Jerkan', 'Dalmatinska ulica 1, Lipovača', 'HR6923400092353419874', 3, '1974-05-30', 'SSS', 'tomjer@gmail.com'),
(null, 67634616329, 'Krunoslav', 'Groznica', 'Ulica Ivana Gorana Kovačića 37, Kuševac', 'HR4323600001497342715', 2, '1986-02-25', 'SSS', 'groznikruno@gmail.com'),
(null, 61736793888, 'Davor', 'Jaglac', 'Ulica Pere Kovačevića 32, Samatovci', 'HR7925000093399198932', 1, '2001-11-11', 'SSS', 'jaglacd@gmail.com');

insert into tim(sifraTima, nazivTima, napomena) values
(null, 'SlikariOS', null),
(null, 'KeramičariOS', 'Pustiti novom djelatniku uz nazor da obavlja sam određene kompliciranije poslove'),
(null, 'FasaderiDJ', null),
(null, 'SlikariVU', null);

insert into clanTima(sifraClana, djelatnik, tim, posao) values
(null, 1, 3, 3),
(null, 2, 3, 3),
(null, 3, 4, 4),
(null, 4, 2, 1),
(null, 5, 1, 2),
(null, 6, 2, 1),
(null, 7, 4, 4),
(null, 8, 3, 3),
(null, 9, 4, 4),
(null, 10, 1, 2),
(null, 11, 3, 3),
(null, 12, 4, 4),
(null, 13, 4, 4),
(null, 14, 3, 3),
(null, 15, 2, 1);

#select * from clanTima a 
#inner join djelatnik b on a.djelatnik = b.oib
#inner join tim c on a.tim = c.sifraTima
#inner join posao d on a.posao = d.sifraPosla
#inner join poslovnaJedinica e on b.poslovnaJedinica = e.sifraPoslovneJedinice;