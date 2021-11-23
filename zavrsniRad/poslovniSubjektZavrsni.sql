drop database if exists poslovniSubjekt;
create database poslovniSubjekt character set utf8;
use poslovniSubjekt;

create table poslovnaJedinica(
    sifraPoslovneJedinice int not null primary key auto_increment,
    nazivPoslovneJedinice varchar(50) not null,
    adresa varchar(50) not null
);

create table posao(
    redniBrojPosla int not null primary key auto_increment,
    opisPosla varchar(200) not null,
    cijenaPosla decimal(18,2) not null,
    lokacijaPosla varchar(50) not null,
    pocetakPosla datetime not null,
    krajPosla datetime,
    napomena varchar(200)
);

create table djelatnik(
    oib char(11) primary key not null,
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
    redniBrojTima int not null primary key,
    napomena varchar(200)
);

create table clanTima(
    sifra int not null primary key auto_increment,
    djelatnik char(11) not null,
    tim int not null,
    posao int not null
);

alter table djelatnik add foreign key (poslovnaJedinica) references poslovnaJedinica(sifraPoslovneJedinice);

alter table clanTima add foreign key (djelatnik) references djelatnik(oib);
alter table clanTima add foreign key (tim) references tim(redniBrojTima);
alter table clanTima add foreign key (posao) references posao(redniBrojPosla);

# zamijeniti primary key poslocvne nazivPoslovneJedinice