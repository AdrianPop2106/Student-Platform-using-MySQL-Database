use proiect;

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



-- Popularea bazei de date 

-- Popularea bazei de date 
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('1', '6001202018293', 'Vultur', 'Ana', 'Reghin', 'RO68RZBR9234784526367674', '0741754590', '14124', 'vultrana@gmail.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('2', '6001202018294', 'Vultur', 'Andrei', 'Targu-Mures', 'RO72PORL6376878217317667', '0776354213', '3590', 'vulturandrei@gmail.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('3', '6001202018393', 'Pop', 'Adrian', 'Cluj-Napoca', 'RO06PORL3875712397164262', '0765357586', '3850', 'popadrian@gmail.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('4', '6001202008293', 'Pop', 'Matei', 'Timisoara', 'RO57PORL8589656157421998', '0798877665', '7417', 'popmatei@gmail.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('5', '6001202018263', 'Pop', 'Vasile', 'Bucuresti', 'RO02PORL9217331569626545', '0798988875', '753', 'popvasile@gmail.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('6', '5001202018293', 'Popa', 'Andrei', 'Cluj-Napoca', 'RO05RZBR4825981584689731', '0732999999', '41753', 'popaandrei@gmail.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('7', '5001202018493', 'Molodovan ', 'Andreea', 'Cluj-Napoca', 'RO85PORL9494494616968431', '0730400000', '4175', 'moldovan@gmail.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('8', '5001202028293', 'Moldovan', 'Andrei', 'Cluj-Napoca', 'RO44PORL2557913448322244', '0711223344', '5375', 'moldovanandrei@gmail.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('9', '5021202018293', 'Mircea', 'Matei', 'Cluj-Napoca', 'RO64RZBR7216457136819318', '0778954479', '7222', 'mirceamatei@gmail.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('10', '2021202018293', 'Popescu', 'Valentin', 'Cluj-Napoca', 'RO10RZBR5551354436156116', '0708954479', '1', 'popescu@yahoo.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('11', '1021202018293', 'Rus', 'Alexandra', 'Cluj-Napoca', 'RO15PORL5289233298189765', '0722954479', '2', 'rusale@gmail.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('12', '3021202018223', 'Mera', 'Octavian', 'Bucuresti', 'RO21PORL7144161822532377', '0778954411', '3', 'meraoctav@gmail.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('13', '4421202018293', 'Popovici', 'Tiberiu', 'Bucuresti', 'RO10RZBR5551389036156116', '0742536788', '4', 'popovicitiberiu@gmail.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('14', '6000105017786', 'Costea', 'Marian', 'Suceava', 'RO64RZBR8637162294549459', '0702005206', '8756', 'costeamarian@yahoo.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('15', '5000105017666', 'Costin', 'Ana', 'Galati', 'RO86RZBR6515481558372573', '0702005201', '21241', 'costinana@yahoo.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('16', '6000105017966', 'Popa', 'Valentin', 'Sibiu', 'RO93PORL7457253774193693', '0702005202', '1234', 'popaval@yahoo.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('17', '1900114086107', 'Popa', 'Dorian', 'Alba-Iulia', 'RO78PORL9499165761424133', '0702005203', '12', 'popaadaniel@yahoo.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('18', '1900203086107', 'Stoica', 'Daniel', 'Iasi', 'RO32RZBR3246419246357213', '0702005204', '123', 'stoicadanieell@yahoo.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('19', '1900103056107', 'Silaghi', 'Andrei', 'Satu-Mare', 'RO64RZBR4563932722859953', '0702005205', '1231', 'silaghiandrei01@yahoo.com');
INSERT INTO `proiect`.`utilizator` (`utilizator_id`, `CNP`, `nume`, `prenume`, `adresa`, `IBAN`, `numar_telefon`, `numar_contract`, `email`) VALUES ('20', '1902103036107', 'Covaci', 'Dana', 'Baia-Mare', 'RO45RZBR8617844259615858', '0702005209', '234', 'covacidanana@yahoo.com');

INSERT INTO `proiect`.`administrator` (`ID_utilizator`, `ID_administrator`, `super_administrator`) VALUES ('5', '1', '1');
INSERT INTO `proiect`.`administrator` (`ID_utilizator`, `ID_administrator`, `super_administrator`) VALUES ('6', '2', '1');
INSERT INTO `proiect`.`administrator` (`ID_utilizator`, `ID_administrator`, `super_administrator`) VALUES ('8', '3', '0');
INSERT INTO `proiect`.`administrator` (`ID_utilizator`, `ID_administrator`, `super_administrator`) VALUES ('9', '4', '0');
INSERT INTO `proiect`.`administrator` (`ID_utilizator`, `ID_administrator`, `super_administrator`) VALUES ('10', '5', '0');

INSERT INTO `proiect`.`student` (`ID_utilizator`, `ID_student`, `an_studiu`, `ore`) VALUES ('1', '1', '1', '20');
INSERT INTO `proiect`.`student` (`ID_utilizator`, `ID_student`, `an_studiu`, `ore`) VALUES ('2', '2', '2', '34');
INSERT INTO `proiect`.`student` (`ID_utilizator`, `ID_student`, `an_studiu`, `ore`) VALUES ('3', '3', '3', '40');
INSERT INTO `proiect`.`student` (`ID_utilizator`, `ID_student`, `an_studiu`, `ore`) VALUES ('4', '4', '4', '20');
INSERT INTO `proiect`.`student` (`ID_utilizator`, `ID_student`, `an_studiu`, `ore`) VALUES ('7', '5', '1', '30');
INSERT INTO `proiect`.`student` (`ID_utilizator`, `ID_student`, `an_studiu`, `ore`) VALUES ('11', '6', '2', '40');
INSERT INTO `proiect`.`student` (`ID_utilizator`, `ID_student`, `an_studiu`, `ore`) VALUES ('12', '7', '2', '40');
INSERT INTO `proiect`.`student` (`ID_utilizator`, `ID_student`, `an_studiu`, `ore`) VALUES ('13', '8', '2', '40');

INSERT INTO `proiect`.`profesor` (`ID_utilizator`, `numar_minim_ore`, `numar_maxim_ore`, `departament`) VALUES ('14', '10', '50', 'Calculatoare');
INSERT INTO `proiect`.`profesor` (`ID_utilizator`, `numar_minim_ore`, `numar_maxim_ore`, `departament`) VALUES ('15', '20', '40', 'Matematica');
INSERT INTO `proiect`.`profesor` (`ID_utilizator`, `numar_minim_ore`, `numar_maxim_ore`, `departament`) VALUES ('16', '15', '40', 'Calculatoare');
INSERT INTO `proiect`.`profesor` (`ID_utilizator`, `numar_minim_ore`, `numar_maxim_ore`, `departament`) VALUES ('17', '10', '35', 'Matematica');
INSERT INTO `proiect`.`profesor` (`ID_utilizator`, `numar_minim_ore`, `numar_maxim_ore`, `departament`) VALUES ('18', '10', '45', 'Calculatoare');
INSERT INTO `proiect`.`profesor` (`ID_utilizator`, `numar_minim_ore`, `numar_maxim_ore`, `departament`) VALUES ('19', '10', '25', 'Electronica');
INSERT INTO `proiect`.`profesor` (`ID_utilizator`, `numar_minim_ore`, `numar_maxim_ore`, `departament`) VALUES ('20', '20', '30', 'Mecanica');

INSERT INTO `proiect`.`cursuri` (`ID_curs`, `descriere`, `numar_maxim_studenti`, `numar_studenti_inscrisi`) VALUES ('1', 'MSI', '10', '0');
INSERT INTO `proiect`.`cursuri` (`ID_curs`, `descriere`, `numar_maxim_studenti`, `numar_studenti_inscrisi`) VALUES ('2', 'AF', '20', '0');
INSERT INTO `proiect`.`cursuri` (`ID_curs`, `descriere`, `numar_maxim_studenti`, `numar_studenti_inscrisi`) VALUES ('3', 'POO', '30', '0');
INSERT INTO `proiect`.`cursuri` (`ID_curs`, `descriere`, `numar_maxim_studenti`, `numar_studenti_inscrisi`) VALUES ('4', 'BD', '5', '0');
INSERT INTO `proiect`.`cursuri` (`ID_curs`, `descriere`, `numar_maxim_studenti`, `numar_studenti_inscrisi`) VALUES ('5', 'CAN', '40', '0');
INSERT INTO `proiect`.`cursuri` (`ID_curs`, `descriere`, `numar_maxim_studenti`, `numar_studenti_inscrisi`) VALUES ('6', 'MSI', '50', '0');
INSERT INTO `proiect`.`cursuri` (`ID_curs`, `descriere`, `numar_maxim_studenti`, `numar_studenti_inscrisi`) VALUES ('7', 'ALGA', '20', '0');
INSERT INTO `proiect`.`cursuri` (`ID_curs`, `descriere`, `numar_maxim_studenti`, `numar_studenti_inscrisi`) VALUES ('8', 'SDA', '30', '0');
INSERT INTO `proiect`.`cursuri` (`ID_curs`, `descriere`, `numar_maxim_studenti`, `numar_studenti_inscrisi`) VALUES ('9', 'PC', '40', '0');
INSERT INTO `proiect`.`cursuri` (`ID_curs`, `descriere`, `numar_maxim_studenti`, `numar_studenti_inscrisi`) VALUES ('10', 'POO', '50', '0');

INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('1', '1');
INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('2', '2');
INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('3', '3');
INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('4', '4');
INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('5', '5');
INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('6', '6');
INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('7', '7');
INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('8', '1');
INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('9', '2');
INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('10', '3');
INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('1', '4');
INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('2', '5');
INSERT INTO `proiect`.`curs_profesor` (`ID_curs`, `ID_profesor`) VALUES ('3', '6');

INSERT INTO `proiect`.`grupa_studiu` (`materie_ID`, `nume_grup`) VALUES ('1', 'MSI');
INSERT INTO `proiect`.`grupa_studiu` (`materie_ID`, `nume_grup`) VALUES ('2', 'AF');
INSERT INTO `proiect`.`grupa_studiu` (`materie_ID`, `nume_grup`) VALUES ('3', 'POO');
INSERT INTO `proiect`.`grupa_studiu` (`materie_ID`, `nume_grup`) VALUES ('4', 'BD');
INSERT INTO `proiect`.`grupa_studiu` (`materie_ID`, `nume_grup`) VALUES ('5', 'CAN');

INSERT INTO `proiect`.`calendar` (`ID_activitate`, `ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('1', '1', '1', 'curs', '2020-01-01', '2022-01-01', '10:00', '12:00', 'Monday', 100);
INSERT INTO `proiect`.`calendar` (`ID_activitate`, `ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('2', '2', '2', 'curs', '2020-01-01', '2022-01-01', '10:00', '12:00', 'Monday', 50);
INSERT INTO `proiect`.`calendar` (`ID_activitate`, `ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('3', '3', '3', 'curs', '2020-01-01', '2022-01-01', '12:00', '14:00', 'Monday', 50);
INSERT INTO `proiect`.`calendar` (`ID_activitate`, `ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('4', '4', '4', 'curs', '2020-01-01', '2022-01-01', '12:00', '14:00', 'Tuesday', 100);
INSERT INTO `proiect`.`calendar` (`ID_activitate`, `ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('5', '5', '5', 'curs', '2022-01-01', '2024-01-01', '08:00', '10:00', 'Thursday', 100);
INSERT INTO `proiect`.`calendar` (`ID_activitate`, `ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('6', '3', '6', 'curs', '2022-01-01', '2024-01-01', '08:00', '10:00', 'Wednesday', 150);
INSERT INTO `proiect`.`calendar` (`ID_activitate`, `ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('7', '1', '1', 'seminar', '2020-01-01', '2022-01-01', '08:00', '10:00', 'Monday', 19);
INSERT INTO `proiect`.`calendar` (`ID_activitate`, `ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('8', '2', '2', 'seminar', '2020-01-01', '2022-01-01', '14:00', '16:00', 'Tuesday', 22);
INSERT INTO `proiect`.`calendar` (`ID_activitate`, `ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('9', '3', '3', 'laborator', '2020-01-01', '2022-01-01', '14:00', '16:00', 'Thursday', 23);
INSERT INTO `proiect`.`calendar` (`ID_activitate`, `ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('10', '4', '4', 'seminar', '2020-01-01', '2022-01-01', '14:00', '16:00', 'Friday', 30);
INSERT INTO `proiect`.`calendar` (`ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('7', '7', 'curs', '2021-01-01', '2021-06-01', '12:00', '14:00', 'Wednesday', '40');
INSERT INTO `proiect`.`calendar` (`ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('1', '8', 'curs', '2021-01-01', '2021-06-01', '08:00', '10:00', 'Tuesday', '40');
INSERT INTO `proiect`.`calendar` (`ID_profesor`, `id_curs`, `activitate`, `data_inceput`, `data_incheiere`, `ora_inceput`, `ora_incheiere`, `zi`, `numar_participanti`) VALUES ('2', '9', 'curs', '2021-06-01', '2021-09-01', '16:00', '18:00', 'Friday', '50');

INSERT INTO `proiect`.`inscriere_curs` (`ID_inscriere`, `ID_student`, `ID_curs`, `data_inscriere`) VALUES ('1', '1', '1', '2021-01-08');
INSERT INTO `proiect`.`inscriere_curs` (`ID_inscriere`, `ID_student`, `ID_curs`, `data_inscriere`) VALUES ('2', '2', '1', '2021-01-08');
INSERT INTO `proiect`.`inscriere_curs` (`ID_inscriere`, `ID_student`, `ID_curs`, `data_inscriere`) VALUES ('4', '3', '1', '2021-01-08');
INSERT INTO `proiect`.`inscriere_curs` (`ID_inscriere`, `ID_student`, `ID_curs`, `data_inscriere`) VALUES ('3', '1', '3', '2021-01-08');

INSERT INTO `proiect`.`ponderi_note` (`ID_curs`, `pondere_laborator`, `pondere_seminar`, `pondere_curs`) VALUES ('1', '10', '20', '70');
INSERT INTO `proiect`.`ponderi_note` (`ID_curs`, `pondere_laborator`, `pondere_seminar`, `pondere_curs`) VALUES ('3', '30', '30', '40');
INSERT INTO `proiect`.`ponderi_note` (`ID_curs`, `pondere_laborator`, `pondere_seminar`, `pondere_curs`) VALUES ('2', '30', '30', '40');
INSERT INTO `proiect`.`ponderi_note` (`ID_curs`, `pondere_seminar`, `pondere_curs`) VALUES ('4', '40', '60');
INSERT INTO `proiect`.`ponderi_note` (`ID_curs`, `pondere_seminar`, `pondere_curs`) VALUES ('5', '50', '50');
INSERT INTO `proiect`.`ponderi_note` (`ID_curs`, `pondere_laborator`, `pondere_seminar`, `pondere_curs`) VALUES ('6', '25', '25', '50');
INSERT INTO `proiect`.`ponderi_note` (`ID_curs`, `pondere_laborator`, `pondere_seminar`, `pondere_curs`) VALUES ('7', '15', '15', '70');
INSERT INTO `proiect`.`ponderi_note` (`ID_curs`, `pondere_laborator`, `pondere_seminar`, `pondere_curs`) VALUES ('8', '30', '20', '50');
INSERT INTO `proiect`.`ponderi_note` (`ID_curs`, `pondere_laborator`, `pondere_curs`) VALUES ('9', '50', '50');
INSERT INTO `proiect`.`ponderi_note` (`ID_curs`, `pondere_laborator`, `pondere_curs`) VALUES ('10', '40', '60');


select ora,ID_curs,activitate,id_profesor from calendar where zi="Luni";

select calendar.ora as ora,cursuri.descriere as curs,calendar.activitate as activitate,utilizator.nume as nume_profesor,utilizator.prenume as prenume_profesor
from calendar,cursuri,activitati,utilizator,profesor
where (cursuri.ID_curs,profesor.ID_profesor) in (select ID_curs,ID_profesor from profesor inner join calendar using (ID_profesor) where zi="Luni")
	and utilizator_ID in (select ID_utilizator from profesor,calendar where profesor.ID_profesor=calendar.ID_profesor and zi="Luni")
Order by ora;

select D.ora,D.descriere,D.activitate,C.nume,C.prenume
from (Select utilizator.nume,utilizator.prenume,ID_profesor from utilizator,profesor where utilizator_id=ID_utilizator) as C
join (
	select A.ora,B.descriere,A.activitate,A.ID_profesor
	from (select * from calendar where zi="Luni") as A
	join (select * from cursuri) as B using (ID_curs)
	) as D using (ID_profesor)
Order by ora;


select A.ora,B.descriere,A.activitate
from (select * from calendar where zi="Vineri") as A
join (select * from cursuri) as B using (ID_curs)
where A.ID_profesor=6
Order by ora;

Select ID_profesor 
from profesor 
where ID_utilizator=(select utilizator_id from utilizator where nume="Tortolescu" and prenume="Iulia");