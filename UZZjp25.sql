drop database if exists UZZjp25;
create database UZZjp25;
use UZZjp25;

create table udrugazazastituzivotinja(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null
);

create table clan(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib varchar(11) not null,
    udrugazazastituzivotinja int not null,
    datumpridruzenja datetime not null
);

create table sticenik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    vrsta varchar(50) not null,
    pasmina varchar(50),
    clan int not null,
    prostor int not null
);

create table prostor(
    sifra int not null primary key auto_increment,
    rednibroj int not null,
    velicinaum2 int not null
);

alter table clan add foreign key(udrugazazastituzivotinja) references udrugazazastituzivotinja(sifra);
alter table sticenik add foreign key(clan) references clan(sifra);
alter table sticenik add foreign key(prostor) references prostor(sifra);