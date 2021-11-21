drop database if exists opcinajp25;
create database opcinajp25 character set utf8;
use opcinajp25;

create table zupanija (
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    zupan int not null
);

create table opcina (
    sifra int not null primary key auto_increment,
    zupanija int not null,
    naziv varchar(50) not null
);

create table mjesto (
    sifra int primary key not null auto_increment,
    opcina int not null,
    naziv varchar(50) not null
);

create table zupan(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

alter table zupanija add foreign key(zupan) references zupan(sifra);
alter table opcina add foreign key(zupanija) references zupanija(sifra);
alter table mjesto add foreign key(opcina) references opcina(sifra);

insert into zupan(sifra, ime, prezime)
values(null, 'Ivan', 'Anušić');

insert into zupan(sifra, ime, prezime)
values(null, 'Damir', 'Dekanić');

insert into zupan(sifra, ime, prezime)
values(null, 'Danijel', 'Marušić');

insert into zupanija(sifra, naziv, zupan)
values(null, 'Osječko-Barnjska', 1);

insert into zupanija(sifra, naziv, zupan)
values(null, 'Vukovarsko-Srijesmka', 2);

insert into zupanija(sifra, naziv, zupan)
values(null, 'Brodsko-posavska', 3);

insert into opcina(sifra, zupanija, naziv)
values(null, 1, 'Satnica Đakovačka');

insert into opcina(sifra, zupanija, naziv)
values(null, 1, 'Bilje');

insert into opcina(sifra, zupanija, naziv)
values(null, 2, 'Bogdanovci');

insert into opcina(sifra, zupanija, naziv)
values(null, 2, 'Nuštar');

insert into opcina(sifra, zupanija, naziv)
values(null, 3, 'Brodski Stupnik');

insert into opcina(sifra, zupanija, naziv)
values(null, 3, 'Bukovlje');

insert into mjesto(sifra, opcina, naziv)
values(null, 1, 'Satnica Đakovačka');

insert into mjesto(sifra, opcina, naziv)
values(null, 1, 'Gašinci');

insert into mjesto(sifra, opcina, naziv)
values(null, 2, 'Bilje');

insert into mjesto(sifra, opcina, naziv)
values(null, 2, 'Kopačevo');

insert into mjesto(sifra, opcina, naziv)
values(null, 2, 'Kozjak');

insert into mjesto(sifra, opcina, naziv)
values(null, 2, 'Lug');

insert into mjesto(sifra, opcina, naziv)
values(null, 3, 'Bogdanovci');

insert into mjesto(sifra, opcina, naziv)
values(null, 3, 'Petrovci');

insert into mjesto(sifra, opcina, naziv)
values(null, 3, 'Svinjarevci');

insert into mjesto(sifra, opcina, naziv)
values(null, 4, 'Nuštar');

insert into mjesto(sifra, opcina, naziv)
values(null, 4, 'Cerić');

insert into mjesto(sifra, opcina, naziv)
values(null, 5, 'Brodski Stupnik');

insert into mjesto(sifra, opcina, naziv)
values(null, 6, 'Bukovlje');

update mjesto
set opcina = 4,
naziv = 'Marinci'
where sifra=9;

update mjesto
set naziv = 'Krajačići'
where sifra = 12;

update mjesto 
set naziv = 'Ježevik'
where sifra = 13;

delete from mjesto
where sifra = 13;

delete from mjesto 
where sifra = 12;

delete from opcina
where sifra = 5;

delete from opcina
where sifra = 6;