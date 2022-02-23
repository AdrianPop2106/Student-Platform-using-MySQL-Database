----------------------------------- Functionalitati administrator ---------------------

-- insereaza utilizator 
delimiter //
create procedure insert_utilizator(CNP VARCHAR(25),nume VARCHAR(25),prenume VARCHAR(25),adresa VARCHAR(25),IBAN VARCHAR(25),numar_telefon VARCHAR(25),numar_contract INT,email VARCHAR(25))
begin
insert into utilizator(CNP,nume,prenume,adresa,IBAN,numar_telefon,numar_contract,email) values (CNP,nume,prenume,adresa,IBAN,numar_telefon,numar_contract,email);
end;//

-- insereaza student
delimiter //
create procedure insert_student(ID_utilizator INT,an_studiu INT,ore INT)
begin
insert into student(ID_utilizator,an_studiu,ore) values (ID_utilizator,an_studiu,ore);
end;//

-- insereaza profesor
delimiter //
create procedure insert_profesor(ID_utilizator INT,numar_minim_ore INT,numar_maxim_ore INT, departament VARCHAR(25),numar_total_studenti INT)
begin
insert into profesor(ID_utilizator,numar_minim_ore,numar_maxim_ore, departament,numar_total_studenti)
values (ID_utilizator,numar_minim_ore,numar_maxim_ore, departament,numar_total_studenti);
end;//

-- super-administratorul poate sa insereze administratori
delimiter //
create procedure insert_administrator(ID_utilizator INT,super_administrator BOOLEAN,id_super int)
begin
if true=(select super_administrator from administrator where administrator.ID_administrator=id_super)
then
insert into administrator(ID_utilizator,super_administrator) values (ID_utilizator,super_administrator);
end if;
end;//

-- sterge un stuent
delimiter //
create procedure delete_student(ID_student int)
begin
delete from note 
where note.id_student=ID_student;
delete from curs_student
where curs_student.ID_student=ID_student; 
delete from student
where student.ID_student=ID_student;
end;//

-- sterge un profesor
delimiter //
create procedure delete_profesor(ID_profesor int)
begin
delete from calendar
where calendar.ID_profesor=ID_profesor;
delete from curs_profesor
where curs_profesor.ID_profesor=ID_profesor;
delete from profesor 
where profesor.ID_profesor=ID_profesor;
end;//

-- super-administratorul poate sa sterga un administrator
delimiter //
create procedure delete_administrator(ID_administrator int,Id_super int)
begin
if true=(select super_administrator from administrator where administrator.ID_administrator=Id_super)
then
delete from administrator
where administrator.ID_administrator=ID_administrator;
end if;
end;//


delimiter //
create procedure update_adresa(utilizator_id int,adresa varchar(25))
begin
update utilizator set adresa=adresa
where utilizator.utilizator_id=utilizator_id;
end;//

delimiter //
create procedure update_email(utilizator_id int,email varchar(25))
begin
update utilizator set email=email
where utilizator.utilizator_id=utilizator_id;
end;//

delimiter //
create procedure update_telefon(utilizator_id int,numar_telefon varchar(25))
begin
update utilizator set numar_telefon=numar_telefon
where utilizator.utilizator_id=utilizator_id;
end;//

delimiter //
create procedure update_contract(utilizator_id int,numar_contract varchar(25))
begin
update utilizator set numar_contract=numar_contract
where utilizator.utilizator_id=utilizator_id;
end;//

delimiter //
create procedure update_iban(utilizator_id int,IBAN varchar(25))
begin
update utilizator set IBAN=IBAN
where utilizator.utilizator_id=utilizator_id;
end;//

delimiter //
create procedure update_nrore(ID_profesor int,numar_maxim_ore INT)
begin
update profesor set numar_maxim_ore=numar_maxim_ore
where profesor.ID_profesor=ID_profesor;
end;//

delimiter //
create procedure update_an(ID_student int,an_studiu INT)
begin
update student set an_studiu=an_studiu
where student.ID_student=ID_student;
end;//

-- cauta un utilazator dupa nume
delimiter //
create procedure cauta_nume(nume varchar(25))
begin
select *
from utilizator
where utilizator.nume=nume;
end;//

-- filtreaza si afiseaza studentii
delimiter //
create procedure filtare_studenti()
begin
select *
from utilizator,student
where utilizator_ID=ID_utilizator;
end;//

-- filtraza si afiseaza profesorii
delimiter //
create procedure filtare_profesori()
begin
select *
from utilizator,profesor
where utilizator_ID=ID_utilizator;
end;//

-- filtreaza si afiseaza administratorii
delimiter //
create procedure filtare_administratori()
begin
select *
from utilizator,student
where utilizator_ID=ID_utilizator;
end;//

-- asigneaza un profesor la un curs
delimiter //
create procedure asignare_prof(ID_profesor int,ID_curs int)
begin
insert into curs_profesor values(ID_curs,ID_profesor);
end;//

-- cauta un curs si afiseaza numele profesorului de la curs
delimiter //
create procedure cauta_curs(ID_curs int)
begin
select nume,prenume
from utilizator,profesor,curs_profesor
where utilizator.utilizator_id=profesor.ID_utilizator
and profesor.ID_profesor=curs_profesor.ID_profesor
and curs_profesor.ID_curs=ID_curs;
end;//
