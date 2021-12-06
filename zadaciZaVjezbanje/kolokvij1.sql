#c:\xampppp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\users\skrla\desktop\Edunova\JP25SQL\zadaciZaVjezbanje\kolokvij1.sql
# Početak: 16:34
drop database if exists kolokvij1;
create database kolokvij1 character set utf8;
use kolokvij1;

create table sestra (
    sifra int primary key not null auto_increment,
    introvertno boolean,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);

create table zena (
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno boolean,
    ekstrovento boolean not null,
    dukserica varchar(48) not null,
    muskarac int
);

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);

insert into sestra_svekar(sifra, sestra, svekar) values
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);


insert into sestra(sifra, haljina, hlace, narukvica) values
(null, 'mala', 'jeans', 1),
(null, 'xl', 'poslovne', 1),
(null, 'l', 'smeđe', 2);

insert into zena(sifra, kratkamajica, jmbag, bojaociju, sestra) values
(null, 'L', 12345678901, 'Z', 1),
(null, 'S', 23456789012, 'P', 2),
(null, 'XS', 3456789098, 'S', 1);

insert into muskarac(sifra, bojaociju, maraka, zena) values
(null, 'S', 10.2, 1),
(null, 'XL', 12.1, 2),
(null, 'M', 16.2, 3);

insert into sestra_svekar(sifra, sestra, svekar) values
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);

insert into svekar(sifra, bojaociju) values
(null, 'zelena'),
(null, 'plava'),
(null, 'smeđa');

update cura
set gustoca = 15.77;

delete from mladic
where kuna > 15.78;

select kratkamajica from zena
where hlace like '%ana%';

select a.dukserica, f.asocijalno, e.hlace from svekar a
inner join sestra_svekar b on a.sifra = b.svekar
inner join sestra c on c.sifra = b.sestra
inner join zena d on c.sifra = d.sestra
inner join muskarac e on e.zena = d.sifra
inner join mladic f on f.muskarac = e.sifra
where d.hlace like 'a%' and c.haljina like '%ba%'
order by e.hlace;

select a.haljina, a.maraka from sestra a
inner join sestra_svekar b on b.sestra = a.sifra
where b.sestra is not null;

alter table zena add foreign key(sestra) references sestra(sifra);
alter table sestra_svekar add foreign key(sestra) references sestra(sifra);
alter table sestra_svekar add foreign key(svekar) references svekar(sifra);
alter table muskarac add foreign key(zena) references zena(sifra);
alter table mladic add foreign key(muskarac) references muskarac(sifra);
alter table cura add foreign key(punac) references punac(sifra);

# Kraj: 17:13