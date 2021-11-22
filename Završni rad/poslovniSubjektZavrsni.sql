drop database if exists poslovniSubjekt;
create database poslovniSubjekt character set utf8;
use poslovniSubjekt;

create table poslovnaJedinica(
    nazivPoslovneJedinice varchar(50) not null primary key,
    adresa varchar(50) not null
);

create table posao(
    redniBrojPosla int not null primary key auto_increment,
    opisPosla varchar(200) not null,
    cijenaPosla decimal(18,2) not null,
    pokretnaImovina varchar(10) not null,
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
    poslovnaJedinica varchar(50) not null,
    datumRodenja date not null,
    poreznaKartica varchar(50) not null,
    ugovorORadu varchar(50) not null,
    svjedozba varchar(50) not null,
    email varchar(50) not null
);

create table inventar(
    sifraInventara int not null primary key auto_increment,
    naziv varchar(50) not null,
    vrijednostPoKomadu decimal(18,2),
    kolicina decimal(18,2),
    proizvodac varchar(50)
);

create table pokretnaImovina(
    registracijskaOznaka varchar(10) not null primary key,
    marka varchar(50) not null,
    model varchar(50) not null,
    datumRegistracije date not null,
    datumProizvodnje date not null,
    vrijednost decimal(18,2)
);

create table trosak(
    redniBrojPosla int not null,
    datumTroska date not null,
    hrana decimal(18,2),
    gorivo decimal(18,2),
    smjestaj decimal(18,2),
    materijal decimal(18,2),
    imovina decimal(18,2),
    ostalo decimal(18,2),
    primary key (redniBrojPosla, datumTroska)
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

create table rasporedeniInventar(
    sifra int not null primary key auto_increment,
    inventar int not null,
    posao int not null,
    datum date not null
);

create table radniDan(
    datum date not null primary key,
    zarada decimal(18,2),
    redniBrojPosla int not null,
    datumTroska date not null,
    napomena varchar(200)
);


alter table posao add foreign key (pokretnaImovina) references pokretnaImovina(registracijskaOznaka);

alter table djelatnik add foreign key (poslovnaJedinica) references poslovnaJedinica(nazivPoslovneJedinice);

alter table trosak add foreign key (redniBrojPosla) references posao(redniBrojPosla);

alter table rasporedeniInventar add foreign key (inventar) references inventar(sifraInventara);
alter table rasporedeniInventar add foreign key (posao) references posao(redniBrojPosla);

alter table clanTima add foreign key (djelatnik) references djelatnik(oib);
alter table clanTima add foreign key (tim) references tim(redniBrojTima);
alter table clanTima add foreign key (posao) references posao(redniBrojPosla);

alter table radniDan add foreign key (redniBrojPosla, datumTroska) references trosak(redniBrojPosla, datumTroska);

#