drop database if exists muzejjp25;
create database muzejjp25;
use muzejjp25;

create table muzej(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    vrsta varchar(50) not null
);

create table izlozba(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    muzej int not null,
    kustos int not null,
    sponzor int not null
);

create table djelo(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    stvaratelj varchar(50),
    izlozba int not null,
    godina int
);

create table kustos(
    sifra int not null primary key auto_increment,
    osoba int not null,
    muzej int not null,
    pocetakrada datetime not null
);

create table sponzor(
    sifra int not null primary key auto_increment,
    osoba int not null,
    nacinsponzorstva varchar(50)
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib varchar(50)
);

alter table izlozba add foreign key(muzej) references muzej(sifra);
alter table izlozba add foreign key(kustos) references kustos(sifra);
alter table izlozba add foreign key(sponzor) references sponzor(sifra);

alter table djelo add foreign key(izlozba) references izlozba(sifra);

alter table kustos add foreign key(muzej) references muzej(sifra);
alter table kustos add foreign key(osoba) references osoba(sifra);

alter table sponzor add foreign key(osoba) references osoba(sifra);