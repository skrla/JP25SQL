drop database if exists frizerskijp25;
create database frizerskijp25;
use frizerskijp25;

create table frizerskisalon(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null,
    datumotvorenja datetime
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    placa decimal(18,2) not null,
    frizerskisalon int not null
);

create table korisnik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    djelatnik int not null,
    zadnjiposijet datetime
);

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    korisnik int not null,
    cijena decimal(18,2) not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    brojtelefona int not null
);

alter table djelatnik add foreign key(frizerskisalon) references frizerskisalon(sifra);
alter table djelatnik add foreign key(osoba) references osoba(sifra);

alter table korisnik add foreign key(osoba) references osoba(sifra);
alter table korisnik add foreign key(djelatnik) references djelatnik(sifra);

alter table usluga add foreign key(korisnik) references korisnik(sifra);