use ciorna;

create table if not exists utilizator(
	utilizator_id INT primary key auto_increment,
	CNP VARCHAR(25),
    nume VARCHAR(25),
    prenume VARCHAR(25),
    adresa VARCHAR(25),
    IBAN VARCHAR(25),
    numar_telefon VARCHAR(25),
    numar_contract INT,
    email VARCHAR(25)
);

create table if not exists student(
	ID_utilizator INT,
    ID_student INT primary key auto_increment,
	an_studiu INT,
	ore INT,
    constraint foreign key (ID_utilizator) references utilizator(utilizator_id)
);

CREATE table if not exists profesor(
	ID_utilizator INT,
    ID_profesor INT PRIMARY KEY auto_increment,
    numar_minim_ore INT,
    numar_maxim_ore INT, 
    departament VARCHAR(25),
    numar_total_studenti INT,
	constraint foreign key (ID_utilizator) references utilizator(utilizator_id)
);

create table if not exists administrator(
	ID_utilizator INT,
    ID_administrator INT PRIMARY KEY auto_increment,
    super_administrator BOOLEAN,
	constraint foreign key (ID_utilizator) references utilizator(utilizator_id)
);

create table if not exists cursuri(
	ID_curs INT PRIMARY KEY AUTO_INCREMENT,
    id_profesor INT,
    descriere VARCHAR(25),
    numar_maxim_studenti INT, 
    numar_studenti_inscrisi INT
);

create table if not exists ponderi_note(
	ID_curs INT PRIMARY KEY,
    pondere_laborator int,
    pondere_seminar int,
    pondere_curs int
);

create table if not exists note(
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
	id_student INT,
    ID_curs INT,
    nota_curs decimal(4,2),
    nota_laborator decimal(4,2),
    nota_seminar decimal(4,2),
    medie decimal(4,2),
	constraint foreign key (ID_student) references student(ID_student),
    constraint foreign key (ID_curs) references cursuri(ID_curs),
    constraint foreign key(ID_curs) references ponderi_note(ID_curs)
);

create table if not exists grupa_studiu(
	ID_grupa INT primary key auto_increment,
    materie_ID int,
    nume_grup VARCHAR(25),
	constraint foreign key (materie_ID) references cursuri(ID_curs)
);

create table if not exists mesaje_grup(
	id_mesaj INT PRIMARY KEY auto_increment,
    mesaj VARCHAR(100),
    id_student INT,
    id_grupa INT,
    constraint foreign key (id_grupa) references grupa_studiu(ID_grupa)    
);

create table if not exists activitate(
    id_activitate int primary key auto_increment,
	ID_grupa int,
    denumire varchar(25),
    data_organizare DATE,
    ora VARCHAR(25),
    numar_minim_participanti INT,
    numar_studenti_inscrisi INT,
    durata_expirare INT,
    data_creare datetime,
    constraint foreign key (ID_grupa) references grupa_studiu(ID_grupa)
);

create table if not exists calendar(
	ID_activitate INT PRIMARY KEY auto_increment,
	ID_profesor int,
    id_curs INT,
    activitate VARCHAR(25),
    data_inceput DATE,
    data_incheiere DATE,
    ora_inceput VARCHAR(5),
    ora_incheiere VARCHAR(5),
    zi VARCHAR(9),
    numar_participanti int,
    constraint foreign key (ID_profesor) references profesor(ID_profesor),
    constraint foreign key (ID_curs) references cursuri(ID_curs)
);

create table if not exists inscriere_curs(
	ID_inscriere INT PRIMARY KEY AUTO_INCREMENT,
	ID_student int,
    ID_curs int,
    data_inscriere DATE,
    data_renuntare DATE,
	constraint foreign key (ID_student) references student(ID_student),
	constraint foreign key (ID_curs) references cursuri(ID_curs)
);

create table if not exists curs_profesor(
	ID_curs int,
    id INT primary key auto_increment,
    ID_profesor int,
	constraint foreign key (ID_profesor) references profesor(ID_profesor),
	constraint foreign key (ID_curs) references cursuri(ID_curs)
);

create table if not exists membrii_grupa(
	ID_grupa INT,
    ID_membru INT primary key AUTO_INCREMENT,
    id_student INT,
    constraint foreign key(ID_grupa) references grupa_studiu(ID_grupa),
    constraint foreign key(id_student) references student(ID_student)
);

insert into cursuri (id_profesor,descriere,numar_maxim_studenti,numar_studenti_inscrisi) values (1,"POO",100,0);
insert into cursuri (id_profesor,descriere,numar_maxim_studenti,numar_studenti_inscrisi) values (2,"CAN",75,0);
insert into cursuri (id_profesor,descriere,numar_maxim_studenti,numar_studenti_inscrisi) values (3,"AF",50,0);
insert into cursuri (id_profesor,descriere,numar_maxim_studenti,numar_studenti_inscrisi) values (4,"MSI",20,0);
insert into cursuri (id_profesor,descriere,numar_maxim_studenti,numar_studenti_inscrisi) values (5,"MES",50,0);
insert into cursuri (id_profesor,descriere,numar_maxim_studenti,numar_studenti_inscrisi) values (6,"BD",100,0);

insert into utilizator(CNP,nume,prenume,adresa,IBAN,numar_telefon,numar_contract,email) values ("1990721263131","Popovici","Ioan","Bd. Decebal","RO79PORL9114934259159658","0735559367","34","glla@email-temp.com");
insert into profesor(ID_utilizator,numar_minim_ore,numar_maxim_ore,departament,numar_total_studenti) values (1,2,4,"Calculatoare",0);

insert into utilizator (CNP,nume,prenume,adresa,IBAN,numar_telefon,numar_contract,email) values ("2950806287753","Potolescu","Dumitru","Bd. Independentei","RO72RZBR5734543967933388","0711555256","123","romulo@high-tech.su");
insert into profesor (ID_utilizator,numar_minim_ore,numar_maxim_ore,departament,numar_total_studenti) values (2,4,6,"Calculatoare",0);

insert into utilizator (CNP,nume,prenume,adresa,IBAN,numar_telefon,numar_contract,email) values ("1950409422938","Bobol","Suzana","Str. Trandafirilor","RO16RZBR3748832234635485","0705554001","45","xhosam@king.buzz");
insert into profesor (ID_utilizator,numar_minim_ore,numar_maxim_ore,departament,numar_total_studenti) values (3,2,8,"Calculatoare",0);

insert into utilizator (CNP,nume,prenume,adresa,IBAN,numar_telefon,numar_contract,email) values ("1990714526310","Alman","Ruben","Bd. Decebal","RO71PORL9257327467999643","0711555149","3","srena@abyssnet.org");
insert into profesor (ID_utilizator,numar_minim_ore,numar_maxim_ore,departament,numar_total_studenti)  values (4,2,6,"Calculatoare",0);

insert into utilizator (CNP,nume,prenume,adresa,IBAN,numar_telefon,numar_contract,email) values ("1980529171663","Tortolescu","Iulia","Str. Mihai Eminescu","RO13PORL7523369848372519","0755558018","70","kkattie@ecallen.com");
insert into profesor (ID_utilizator,numar_minim_ore,numar_maxim_ore,departament,numar_total_studenti) values (5,4,6,"Calculatoare",0);

insert into utilizator (CNP,nume,prenume,adresa,IBAN,numar_telefon,numar_contract,email) values ("2991113405301","Pop","George","Str. Victoriei","RO07RZBR9836662282891444","0711555232","104","3rida@ikimaru.com");
insert into profesor (ID_utilizator,numar_minim_ore,numar_maxim_ore,departament,numar_total_studenti) values (6,2,2,"Calculatoare",0);

insert into utilizator (CNP,nume,prenume,adresa,IBAN,numar_telefon,numar_contract,email) values ("1900225314511","Papan","Georgiana","Str. Trandafirilor","RO76RZBR2561471343528874","0755552619","331","kepele@ikimaru.com");
insert into profesor values (7,8,2,4,"Calculatoare",0);

insert into utilizator (CNP,nume,prenume,adresa,IBAN,numar_telefon,numar_contract,email) values ("2910906072169","Papan","Catalin","Str. Trandafirilor","RO98RZBR6564822844916974","0705558854","342","4happy@staminafamily.com");
insert into profesor values (8,9,2,6,"Calculatoare",0);

insert into utilizator (CNP,nume,prenume,adresa,IBAN,numar_telefon,numar_contract,email) values ("2861227167961","Buzdau","Iulia","Str. Dimitrie Cantemir","RO75RZBR5393122627631371","0725559975","200","mhanaking@imperrone.com");
insert into profesor values (9,10,2,2,"Calculatoare",0);

insert into activitati values (1,"seminar");
insert into activitati values (1,"curs");
insert into activitati values (1,"laborator");