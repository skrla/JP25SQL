drop database if exists firmajp25;
create database firmajp25;
use firmajp25;

create table projekt(
    sifra int primary key not null auto_increment,
    naziv varchar(50) not null,
    cijena int not null
);

create table programer(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datumrodenja datetime not null,
    placa decimal(18,2) not null
);

create table sudjeluje(
    projekt int not null,
    programer int not null,
    datumpocetka datetime not null,
    datumkraja datetime
);

alter table sudjeluje add foreign key(projekt) references projekt(sifra);
alter table sudjeluje add foreign key(programer) references programer(sifra);