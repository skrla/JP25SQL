drop database if exists SZUjp25;
create database SZUjp25;
use SZUjp25;

create table salonzauljepsavanje(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    salonzauljepsavanje int not null,
    placa decimal(18,2) not null,
    iban varchar(50)
);

create table korisnik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    djelatnik int not null,
    prvaposijet datetime not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    korisnik int not null,
    cijena decimal(18,2)
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    brojtelefona int not null
);

alter table djelatnik add foreign key(osoba) references osoba(sifra);
alter table djelatnik add foreign key(salonzauljepsavanje) references salonzauljepsavanje(sifra);

alter table korisnik add foreign key(osoba) references osoba(sifra);
alter table korisnik add foreign key (djelatnik) references djelatnik(sifra);

alter table usluga add foreign key(korisnik) references korisnik(sifra);