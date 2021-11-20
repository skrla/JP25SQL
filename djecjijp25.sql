drop database if exists djecjijp25;
create database djecjijp25;
use djecjijp25;

create table djecjivrtic(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    godinaosnutka datetime not null,
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