-- CREAREA TABELELOR, ADAUGAREA CONSTRANGERILOR DE INTEGRITATE 
create table sectie 
    ( id_sectie number(5) constraint pk_sectie primary key,
      denumire varchar2(20) constraint den not null,
      locatie varchar2(20) constraint loc not null
    );
    
create table camera
    ( id_camera number(5) constraint pk_camera primary key,
      id_sectie number(5),
      capacitate number(2) constraint cap not null,
      constraint fk_sectie foreign key(id_sectie) references sectie(id_sectie)
    );
    
create table pacient
    ( id_pacient number(5) constraint pk_pacient primary key,
      id_camera number(5),
      nume varchar2(20) constraint nume_pacient not null,
      prenume varchar2(20) constraint prenume_pacient not null,
      data_nasterii date constraint data_pacient not null,
      numar_telefon varchar2(20),
      constraint fk_pacient foreign key(id_camera) references camera(id_camera)
    );
    
create table cadru_medical
    ( id_cadru number(5) constraint pk_cadru primary key,
      nume varchar2(20) not null,
      prenume varchar2(20) not null
    );
    
create table doctor
    ( id_doctor number(5) not null references cadru_medical(id_cadru),
      primary key(id_doctor)
    );
    
create table asistent
    ( id_asistent number(5) not null references cadru_medical(id_cadru),
      primary key(id_asistent)
    ); 
    
    
create table infirmier
    ( id_infirmier number(5) not null references cadru_medical(id_cadru),
      primary key(id_infirmier)
    ); 
    
    
create table cadru_asignat_pacientului
    ( data_asignare date ,
      id_pacient number(5) not null references pacient(id_pacient),
      id_cadru number(5) not null references cadru_medical(id_cadru),
      constraint pk_compus_asignare primary key (data_asignare,id_pacient,id_cadru)
    ); 
    
create table diagnostic
    ( id_diagnostic number(5) constraint pk_diagnostic primary key,
      id_doctor number(5),
      denumire varchar2(20),
      constraint fk_diag_doctor foreign key(id_doctor) references doctor(id_doctor)
    );
    
    
create table diagnostic_asignat_pacientului
    ( data_asignare date ,
      id_pacient number(5) not null references pacient(id_pacient),
      id_diagnostic number(5) not null references diagnostic(id_diagnostic),
      constraint pk_compus_asignare2 primary key (data_asignare,id_pacient,id_diagnostic)
    );    
    
    
    
create table clasa_medicament
    ( id_clasa number(5) constraint pk_clasa_med primary key,
      descriere varchar2(20)
    );
    
    
create table medicament
    ( id_medicament number(5) constraint pk_medicament primary key,
      id_clasa number(5),
      denumire varchar2(20),
      pret_per_unitate number(3) not null,
      constraint fk_medicament foreign key(id_clasa) references clasa_medicament(id_clasa)
    );
    
    
create table tratament
    ( data_incepere date ,
      id_diagnostic number(5) not null references diagnostic(id_diagnostic),
      id_medicament number(5) not null references medicament(id_medicament),
      constraint pk_compus_tratament primary key(data_incepere,id_diagnostic,id_medicament)
    );    
    
-- INSERAREA INFORMATIILOR IN TABELE
insert into clasa_medicament 
values(1,'ANTISPASTICE');
insert into clasa_medicament 
values(2,'ANTICOAGULANTE');
insert into clasa_medicament 
values(3,'ANTIINFLAMATORII');
insert into clasa_medicament 
values(4,'HEPATOTOXICE');
insert into clasa_medicament
values(5,'ANTIDEPRSIVE');

insert into medicament
values  (10,3,'VOLTAREN',2);
insert into medicament 
values(11,1,'NOSPA',3);
insert into medicament 
values(12,1,'UCOSIN',4);
insert into medicament 
values(13,1,'ANTISPASMIN',2);
insert into medicament 
values (14,2,'ASPIVITA',4);
insert into medicament 
values (15,4,'PARACETAMOL',5);

insert into sectie
values(5,'ATI','Etaj3');
insert into sectie
values(6,'CARDIOLOGIE','PARTER');
insert into sectie
values(7,'INFECTIOASE_ADULTI','Etaj2');
insert into sectie
values(8,'INFECTIOASE_COPII','Etaj5');
insert into sectie
values(9,'DERMATO', 'PARTER');

insert into camera
values(101,9,4);
insert into camera
values(303,5,2);
insert into camera
values(204,7,5);
insert into camera
values(501,8,3);
insert into camera
values(102,6,4);
update camera
set id_sectie = 8
where id_camera=303;
update camera
set id_sectie = 7
where id_camera=102;
commit;
    
insert into pacient
values(1001,101,'Lipan','Vitoria','17-JUN-76','0729055478');
insert into pacient
values(1002,303,'Marculescu','Otilia','13-AUG-2000','0726055478');
insert into pacient
values(1003,204,'Giurgiuveanu','Costache','1-AUG-2000','0726195478');
insert into pacient
values(1004,204,'Moromete','Ilie','03-APR-1950','0726350431');
insert into pacient
values(1005,102,'Aquaman','Iona','25-JUL-1970','0726455479');
insert into pacient
values(1006,204,'Trahanache','Zoe','06-AUG-2000','0726350331');
insert into pacient
values(1007,102,'Cetateanul','Turmentat','01-JUL-2001','0367372343');
insert into pacient
values(1008,303,'Gheorghidiu','Stefan','03-NOV-1996','0267543872');    
insert into pacient
values(1009,501,'Trahanache','Zaharia','14-JAN-1965','0726455432');
UPDATE PACIENT 
SET DATA_NASTERII = '01-JUL-2001'
WHERE ID_PACIENT = 1006;

insert into cadru_medical
values(2001,'Popescu','Andrei');
insert into cadru_medical
values(3001,'Georgescu', 'Mihai');
insert into cadru_medical
values(4001,'Ionescu','Andreea');
insert into cadru_medical
values(3002,'Serban','Mircea');
insert into cadru_medical
values(4002,'Popa','Alexandra');
insert into cadru_medical
values(2002,'Andrei', 'Ioan');
insert into cadru_medical
values(2003,'Mihaila', 'Cristian');
insert into cadru_medical
values(2004,'Draghici', 'Stefan');
insert into cadru_medical
values(2005,'Dumitru','Gheorghe');
insert into cadru_medical
values(3003,'Dirstariu', 'Daria');
insert into cadru_medical
values(4003, 'Dirstariu', 'Cristina');


insert into doctor
values(2001);
insert into doctor
values(2002);
insert into doctor
values(2003);
insert into doctor
values(2004);
insert into doctor
values(2005);

insert into asistent
values(3001);
insert into asistent
values(3002);
insert into asistent
values(3003);

insert into infirmier
values(4001);
insert into infirmier
values(4002);
insert into infirmier
values(4003);

insert into diagnostic 
values (239,2002,'Tiroidita');
insert into diagnostic
values (294,NULL,'Amiloidoza');
insert into diagnostic
values (299,NULL,'Dementa');
insert into diagnostic
values (402,2003,'Conjuctivita');
insert into diagnostic
values (415,2002,'Glaucom');
insert into diagnostic
values (428,2001,'Otita');
insert into diagnostic
values (446,2002,'Reumatism');
insert into diagnostic
values (499,2003,'Sinuzita');
insert into diagnostic
values (504,2002,'Gripa');
insert into diagnostic
values(505,2004,'Covid-19');
update diagnostic 
set id_doctor = 2004
where id_diagnostic = 299;
update diagnostic 
set id_doctor = 2004
where id_diagnostic = 294;
update diagnostic 
set id_doctor = 2001
where id_diagnostic = 239;

insert into diagnostic_asignat_pacientului
values('21-DEC-2020',1002,428);
insert into diagnostic_asignat_pacientului
values('2-DEC-2020',1002,504);
insert into diagnostic_asignat_pacientului
values('20-NOV-2020',1001,239);
insert into diagnostic_asignat_pacientului
values('12-OCT-2020',1001,504);
insert into diagnostic_asignat_pacientului
values('01-JAN-2021',1003,446);
insert into diagnostic_asignat_pacientului
values('03-AUG-2020',1003,504);
insert into diagnostic_asignat_pacientului
values('04-OCT-2019',1004,415);
insert into diagnostic_asignat_pacientului
values('05-SEP-2018',1004,504);
insert into diagnostic_asignat_pacientului
values('01-AUG-2019',1004,499);
insert into diagnostic_asignat_pacientului
values('02-JAN-2021',1006,499);
insert into diagnostic_asignat_pacientului
values('3-DEC-2020',1006,504);
insert into diagnostic_asignat_pacientului
values('28-NOV-2020',1007,294);
insert into diagnostic_asignat_pacientului
values('02-FEB-2019',1007,504);
insert into diagnostic_asignat_pacientului
values('25-JAN-2019',1008,504) ;
update diagnostic_asignat_pacientului
set id_diagnostic = 505
where data_asignare= '28-NOV-2020';
update diagnostic_asignat_pacientului
set id_diagnostic = 505
where data_asignare= '03-AUG-2020';
update diagnostic_asignat_pacientului
set id_diagnostic = 505
where data_asignare= '25-JAN-2019';

insert into cadru_asignat_pacientului
values ('21-DEC-2020',1001,2003);
insert into cadru_asignat_pacientului
values ('21-DEC-2020',1001,3001);
insert into cadru_asignat_pacientului
values ('21-DEC-2020',1001,4002);
insert into cadru_asignat_pacientului
values ('2-DEC-2020',1002,2001);
insert into cadru_asignat_pacientului
values ('2-DEC-2020',1002,3002);
insert into cadru_asignat_pacientului
values ('2-DEC-2020',1002,4001);
insert into cadru_asignat_pacientului
values ('20-NOV-2020',1003,3001);
insert into cadru_asignat_pacientului
values ('20-NOV-2020',1003,2002);
insert into cadru_asignat_pacientului
values ('20-NOV-2020',1003,4002);
insert into cadru_asignat_pacientului
values ('28-NOV-2020',1005,4001);
insert into cadru_asignat_pacientului
values ('28-NOV-2020',1005,2003);
insert into cadru_asignat_pacientului
values ('28-NOV-2020',1005,3002);
insert into cadru_asignat_pacientului
values('08-SEP-2019',1006,2001);
insert into cadru_asignat_pacientului
values('12-OCT-2020',1006,3002);
insert into cadru_asignat_pacientului
values('01-JAN-2021',1006,4001);
insert into cadru_asignat_pacientului
values('03-AUG-2020',1007,2002);
insert into cadru_asignat_pacientului
values('04-OCT-2019',1007,3001);
insert into cadru_asignat_pacientului
values('05-SEP-2018',1007,4001);
insert into cadru_asignat_pacientului
values('01-AUG-2019',1008,2003);
insert into cadru_asignat_pacientului
values('02-JAN-2021',1008,3001);
insert into cadru_asignat_pacientului
values('02-JAN-2021',1008,4002);

insert into tratament
values('28-NOV-2020',239,10);
insert into tratament
values('2-NOV-2020',294,11);
insert into tratament
values('3-NOV-2020',299,12);
insert into tratament
values('4-NOV-2020',415,13);
insert into tratament
values('02-FEB-2019',428,14);
insert into tratament
values ('25-JAN-2019',428,12);
insert into tratament
values('3-NOV-2020',446,15);
insert into tratament
values('21-SEP-2020',499,10);
insert into tratament
values('25-DEC-2020',504,12);
insert into tratament
values('23-DEC-2020',504,15);

-- 6. colectii(vector)
-- Definiti un subprogram stocat care retine intr-un tip de colectie id-urile celor mai ieftine
-- medicamente, apoi, utilizand aceasta colectie sa se incrementeze cu o unitate pretul acestor
-- medicamente.

create or replace procedure ex6 is
    type med_ids_vector is varray(5)
    of medicament.id_medicament%type not null;
    meds med_ids_vector := med_ids_vector();
    med_id medicament.id_medicament%type;
    pret medicament.pret_per_unitate%type;
begin
    select *
    bulk collect into meds
    from
    (
        select id_medicament
        from medicament
        where pret_per_unitate = ( select min(pret_per_unitate)
                                    from medicament
                                  ) 
    );
    for i IN meds.FIRST..meds.LAST loop
         med_id := meds(i);
         
         DBMS_OUTPUT.PUT_LINE('Actualizez medicamentul #' || med_id);
         
         select pret_per_unitate
         into pret
         from medicament
         where id_medicament = med_id;
         
         DBMS_OUTPUT.PUT_LINE('  Pret vechi: ' || pret);
         
         update medicament
         set pret_per_unitate = pret_per_unitate + 1
         where id_medicament = med_id;
         
         select pret_per_unitate
         into pret
         from medicament
         where id_medicament = med_id;
         
         DBMS_OUTPUT.PUT_LINE('  Pret nou: ' || pret);
    end loop;
end;
/


--apel
begin
    ex6;
end;
/

rollback;

-- 7. cursoare(rezolvare cu cicluri cursor)
-- Pentru fiecare cadru care nu e medic, obtineti primii 2 cei mai tineri pacienti pe care acesta ii
-- trateaza si sunt diagnosticati cu gripa. De asemenea, sa se precizeze daca cadrul este infirmier
-- sau asistent.
CREATE OR REPLACE PROCEDURE ex7 IS 
BEGIN
    FOR i IN ( SELECT id_cadru, nume, prenume
               FROM cadru_medical,asistent
               WHERE id_cadru = id_asistent)
    LOOP 
        DBMS_OUTPUT.PUT_LINE('Asistentul '||i. nume ||' '||i.prenume||' are in ingrijire pacientii: ' );
        FOR e IN (
        WITH pacientii_cadrului 
        AS ( SELECT nume nm, prenume pn, data_nasterii d_n
             FROM cadru_asignat_pacientului JOIN pacient using(id_pacient)
                                            JOIN diagnostic_asignat_pacientului using(id_pacient)
             WHERE id_cadru = i.id_cadru AND
                   id_diagnostic = ( SELECT id_diagnostic -- aflu id-ul diagnosticului gripa
                                     FROM diagnostic 
                                     WHERE initcap(denumire) = 'Gripa'
                                   )
             ORDER BY data_nasterii DESC
           )  
           SELECT nm,pn,d_n
           FROM pacientii_cadrului 
           WHERE ROWNUM<=2
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE(' '||e.nm || ' ' || e.pn || ', nascut la data de ' || e.d_n );
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
    
    FOR j IN ( SELECT id_cadru, nume, prenume
               FROM cadru_medical, infirmier 
               WHERE id_cadru = id_infirmier)
    LOOP
         DBMS_OUTPUT.PUT_LINE('Infirmierul '||j. nume ||' '||j.prenume||' are: ' );
         FOR e IN (
         WITH pacientii_cadrului 
         AS ( SELECT nume nm, prenume pn, data_nasterii d_n
              FROM cadru_asignat_pacientului JOIN pacient using(id_pacient)
                                             JOIN diagnostic_asignat_pacientului using(id_pacient)
              WHERE id_cadru = j.id_cadru AND
                    id_diagnostic = ( SELECT id_diagnostic -- aflu id-ul diagnosticului gripa
                                      FROM diagnostic 
                                      WHERE initcap(denumire) = 'Gripa'
                                    )
              ORDER BY data_nasterii DESC
            )  
            SELECT nm,pn,d_n
            FROM pacientii_cadrului 
            WHERE ROWNUM<=2
         )
        LOOP
            DBMS_OUTPUT.PUT_LINE(' '||e.nm || ' ' || e.pn || ', nascut la data de ' || e.d_n );
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
    
    END LOOP;
END;
/  

--apel
BEGIN
    ex7;
END;
/


-- 8. Subprogram stocat de tip func?ie
-- Pentru o anumita clasa de medicament, sa se afiseze medicamentul folosit la tratamente incepute in
-- noiembrie 2020. Cele 3 tabele folosite:clasa_medicament, medicament, tratament.

CREATE OR REPLACE FUNCTION ex8
    (v_clasa clasa_medicament.descriere%TYPE DEFAULT 'ANTIINFLAMATORII')
RETURN VARCHAR IS
     v_med medicament.denumire%TYPE;
 BEGIN
  SELECT denumire INTO v_med
  FROM medicament JOIN clasa_medicament USING(id_clasa)
                  JOIN tratament USING(id_medicament)
  WHERE to_char(data_incepere,'yyyy')='2020' 
        AND to_char(data_incepere,'MON')='NOV' --upper(descriere) = 'ANTICOAGULANTE'
        AND UPPER(descriere) = v_clasa;
        RETURN v_med;
 EXCEPTION
  WHEN NO_DATA_FOUND THEN
   RAISE_APPLICATION_ERROR(-20000,'Nu exista medicamente din aceasta clasa folosite in noiembrie 2020!');
  WHEN TOO_MANY_ROWS THEN
   RAISE_APPLICATION_ERROR(-20001,'Exista mai multe medicamente din aceasta clasa folosite in noiembrie 2020!'); 
  WHEN OTHERS THEN
   RAISE_APPLICATION_ERROR(-20002,'Eroare!');
END ex8;
/
   
--apel prin bloc SQL
BEGIN --MAI MULT DE UN REZULTAT
 DBMS_OUTPUT.PUT_LINE('Medicamentul este '|| ex8('ANTISPASTICE'));
END;
/ 

BEGIN --OK
 DBMS_OUTPUT.PUT_LINE('Medicamentul este '|| ex8());
END;
/ 


BEGIN --OK
 DBMS_OUTPUT.PUT_LINE('Medicamentul este '|| ex8('HEPATOTOXICE'));
END;
/ 

BEGIN --NU EXISTA
 DBMS_OUTPUT.PUT_LINE('Medicamentul este '|| ex8('ANTICOAGULANTE'));
END;
/ 

BEGIN --NU EXISTA
 DBMS_OUTPUT.PUT_LINE('Medicamentul este '|| ex8('ANTIDEPRSIVE'));
END;
/ 

-- 9.subprogram stocat de tip procedura
-- Definiti o procedura stocata care intoarce id-ul celui mai tanar pacient cazat intr o camera a unei
-- sectii date ca parametru in care exista cel putin un pacient diagnosticat cu COVID-19. Cele 5
-- tabele folosite : sectie, camera, pacient, diagnostic_asignat_pacientului,diagnostic


CREATE OR REPLACE PROCEDURE ex9 (
    v_sectie sectie.denumire%TYPE 
) IS
    v_id pacient.id_pacient%TYPE;
 BEGIN 
    select id_pacient
    into v_id
    from pacient 
    where data_nasterii = ( select max(data_nasterii)
                            from pacient
                            where id_camera in ( select id_camera --camerele de la sectia v_sectie in care exista cel putin un pacient diagnosticat cu Covid-19
                                                 from camera join pacient using(id_camera)
                                                             join sectie using(id_sectie)
                                                 where id_pacient in ( select id_pacient --lista pacientilor diagnosticati cu Covid-19
                                                                       from diagnostic_asignat_pacientului
                                                                       where id_diagnostic = ( select id_diagnostic
                                                                                               from diagnostic
                                                                                               where initcap(denumire)='Covid-19'
                                                                                             )
                                                                     )
                                                 and id_sectie in ( select id_sectie
                                                                    from sectie
                                                                    where upper(denumire) =  v_sectie
                                                                  )
                                               )
                          );
    DBMS_OUTPUT.PUT_LINE('Pacientul este '|| v_id);
    -- Cazul când primesc o denumire de sectie care nu exista
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000,'Nu exista pacienti!');
        WHEN TOO_MANY_ROWS THEN
            RAISE_APPLICATION_ERROR(-20001,'Exista mai multi pacienti nascuti la aceeasi data!'); 
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002,'Eroare!');
    
 END ex9;
/

BEGIN  --no data found, la fel si pentru ATI, DERMATO
    ex9('CARDIOLOGIE');
END;
/

BEGIN  --too many rows
    ex9('INFECTIOASE_ADULTI');
END;
/

BEGIN  --ok, 1002
    ex9('INFECTIOASE_COPII');
END;
/

-- 10. Trigger de tip LMD la nivel de comanda(triggerul nu are legatura cu datele mentinute in
-- liniile afectate de comanda). Sa se creeze un trigger care asigura inserarea de produse in
-- tabelul medicament se poate realiza numai in zilele lucratoare intre 9 si 17.


CREATE OR REPLACE TRIGGER trig_ex10
    BEFORE INSERT OR DELETE OR UPDATE ON medicament
BEGIN
    IF(TO_CHAR(SYSDATE,'D') = 1) --duminica
       OR (TO_CHAR(SYSDATE,'D') = 7) --sambata
       OR (TO_CHAR(SYSDATE,'HH24') NOT BETWEEN 10 AND 17)
    THEN 
     IF INSERTING THEN
      RAISE_APPLICATION_ERROR(-20001,'Inserarea de produse este permisa doar in timpul intervalului de lucru!');
     END IF;
    END IF;
END;
/

insert into medicament 
values (16,1,'IBUPROFEN',2);

-- 11. Trigger de tip LMD la nivel de linie. Definiti un declansator cu care sa se realizeze restrictia
-- conform careia un doctor nu poate stabili mai mult de 3 diagnostice(pentru aceasta vom utiliza
-- tabelele doctor si diagnostic).
-- Numarul de diagnostice date de fiecare medic:
-- 2001 –2
-- 2002 ,2004--3
-- 2003 --1


CREATE OR REPLACE PACKAGE pachet
AS
 TYPE tip_rec IS RECORD
 (id diagnostic.id_doctor%TYPE,
  v_nr_diag NUMBER );     --nr de diagnostice date date pana acum de doctorul la care s-ar mai adauga un diagnostic
 TYPE tip_ind IS TABLE OF tip_rec
 INDEX BY PLS_INTEGER;
 t tip_ind;
 contor NUMBER := 0;
END;
/



--selectez in triggerul la nivel de comanda datele din tabel
CREATE OR REPLACE TRIGGER trig_ex11_comanda
BEFORE INSERT ON diagnostic
BEGIN
    pachet.contor := 0;
    SELECT id_doctor, count(1)
    BULK COLLECT INTO pachet.t
    FROM diagnostic
    GROUP BY id_doctor;
END;
/

CREATE OR REPLACE TRIGGER trig_ex11_linie
BEFORE INSERT ON diagnostic
FOR EACH ROW
DECLARE

    v_nr_diag NUMBER;
BEGIN
    FOR i in 1..pachet.t.last LOOP
        IF pachet.t(i).id = :NEW.id_doctor
         AND pachet.t(i).v_nr_diag + pachet.contor >=3 THEN
          RAISE_APPLICATION_ERROR(-20000, 'Prea multe diagnostice');
        END IF;
    END LOOP;
END;
/


insert into diagnostic 
values(621,2002,'Vitiligo');

insert into diagnostic
select 621,2004,'Lupus'
from dual;


-- 12. Creati tabelul audit_ddm cu urmatoarele campuri:
-- - utilizator (numele utilizatorului);
-- - nume_bd (numele bazei de date);
-- - eveniment (evenimentul sistem);
-- - nume_obiect (numele obiectului);
-- - data (data producerii evenimentului).
-- Definiti un declansator care sa introduca date în acest tabel dupa ce utilizatorul a folosit o comanda LDD
-- (declansator sistem - la nivel de schema). 

CREATE TABLE audit_ddm
 ( utilizator VARCHAR2(30),
   nume_bd VARCHAR2(50),
   eveniment VARCHAR2(20),
   nume_obiect VARCHAR2(30),
 data DATE);
CREATE OR REPLACE TRIGGER trig_ex12
 AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
 INSERT INTO audit_ddm
 VALUES (SYS.LOGIN_USER, SYS.DATABASE_NAME, SYS.SYSEVENT,
 SYS.DICTIONARY_OBJ_NAME, SYSDATE);
END;
/


create table sectie
 ( id_sectie number(5) constraint pk_sectie primary key,
   denumire varchar2(20) constraint den not null,
   locatie varchar2(20) constraint loc not null
 );

select * from audit_ddm;

--13. Defini?i un pachet care sa con?ina toate obiectele definite în cadrul proiectului

CREATE OR REPLACE PACKAGE pachet_13
IS
    PROCEDURE ex6;
    
    PROCEDURE ex7;
    
    FUNCTION ex8(
        v_clasa clasa_medicament.descriere%TYPE DEFAULT 'ANTIINFLAMATORII'
    )  RETURN VARCHAR ;
    
    PROCEDURE ex9(
        v_sectie sectie.denumire%TYPE 
    );
END;
/

CREATE OR REPLACE PACKAGE BODY pachet_13
IS
    procedure ex6 is
    type med_ids_vector is varray(5)
    of medicament.id_medicament%type not null;
    meds med_ids_vector := med_ids_vector();
    med_id medicament.id_medicament%type;
    pret medicament.pret_per_unitate%type;
    begin
        select *
        bulk collect into meds
        from
        (
            select id_medicament
            from medicament
            where pret_per_unitate = ( select min(pret_per_unitate)
                                       from medicament
                                     ) 
        );
        for i IN meds.FIRST..meds.LAST loop
            med_id := meds(i);
         
            DBMS_OUTPUT.PUT_LINE('Actualizez medicamentul #' || med_id);
         
            select pret_per_unitate
            into pret
            from medicament
            where id_medicament = med_id;
         
            DBMS_OUTPUT.PUT_LINE('  Pret vechi: ' || pret);
         
            update medicament
            set pret_per_unitate = pret_per_unitate + 1
            where id_medicament = med_id;
         
            select pret_per_unitate
            into pret
            from medicament
            where id_medicament = med_id;
         
            DBMS_OUTPUT.PUT_LINE('  Pret nou: ' || pret);
        end loop;
    end;
   
    PROCEDURE ex7 IS 
    BEGIN
        FOR i IN ( SELECT id_cadru, nume, prenume
                   FROM cadru_medical,asistent
                   WHERE id_cadru = id_asistent)
        LOOP 
            DBMS_OUTPUT.PUT_LINE('Asistentul '||i. nume ||' '||i.prenume||' are in ingrijire pacientii: ' );
            FOR e IN (
            WITH pacientii_cadrului 
            AS ( SELECT nume nm, prenume pn, data_nasterii d_n
                 FROM cadru_asignat_pacientului JOIN pacient using(id_pacient)
                                                JOIN diagnostic_asignat_pacientului using(id_pacient)
                 WHERE id_cadru = i.id_cadru AND
                       id_diagnostic = ( SELECT id_diagnostic -- aflu id-ul diagnosticului gripa
                                         FROM diagnostic 
                                         WHERE initcap(denumire) = 'Gripa'
                                       )
                 ORDER BY data_nasterii DESC
               )  
               SELECT nm,pn,d_n
               FROM pacientii_cadrului 
               WHERE ROWNUM<=2
            )
            LOOP
                DBMS_OUTPUT.PUT_LINE(' '||e.nm || ' ' || e.pn || ', nascut la data de ' || e.d_n );
            END LOOP;
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
    
        FOR j IN ( SELECT id_cadru, nume, prenume
                   FROM cadru_medical, infirmier 
                   WHERE id_cadru = id_infirmier)
        LOOP
            DBMS_OUTPUT.PUT_LINE('Infirmierul '||j. nume ||' '||j.prenume||' are: ' );
            FOR e IN (
            WITH pacientii_cadrului 
            AS ( SELECT nume nm, prenume pn, data_nasterii d_n
                 FROM cadru_asignat_pacientului JOIN pacient using(id_pacient)
                                                JOIN diagnostic_asignat_pacientului using(id_pacient)
                 WHERE id_cadru = j.id_cadru AND
                       id_diagnostic = ( SELECT id_diagnostic -- aflu id-ul diagnosticului gripa
                                         FROM diagnostic 
                                         WHERE initcap(denumire) = 'Gripa'
                                       )
                 ORDER BY data_nasterii DESC
               )  
               SELECT nm,pn,d_n
               FROM pacientii_cadrului 
               WHERE ROWNUM<=2
            )
            LOOP
                DBMS_OUTPUT.PUT_LINE(' '||e.nm || ' ' || e.pn || ', nascut la data de ' || e.d_n );
            END LOOP;
            DBMS_OUTPUT.PUT_LINE('');
            
        END LOOP;
    END;
    
    FUNCTION ex8(
        v_clasa clasa_medicament.descriere%TYPE DEFAULT 'ANTIINFLAMATORII'
    ) RETURN VARCHAR 
    IS
        v_med medicament.denumire%TYPE;
    BEGIN
     SELECT denumire INTO v_med
     FROM medicament JOIN clasa_medicament USING(id_clasa)
                     JOIN tratament USING(id_medicament)
     WHERE to_char(data_incepere,'yyyy')='2020' 
           AND to_char(data_incepere,'MON')='NOV' --upper(descriere) = 'ANTICOAGULANTE'
           AND UPPER(descriere) = v_clasa;
           RETURN v_med;
     EXCEPTION
      WHEN NO_DATA_FOUND THEN
       RAISE_APPLICATION_ERROR(-20000,'Nu exista medicamente din aceasta clasa folosite in noiembrie 2020!');
      WHEN TOO_MANY_ROWS THEN
       RAISE_APPLICATION_ERROR(-20001,'Exista mai multe medicamente din aceasta clasa folosite in noiembrie 2020!'); 
      WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20002,'Eroare!');
    END ex8;
    
    PROCEDURE ex9 (
        v_sectie sectie.denumire%TYPE 
    ) IS
        v_id pacient.id_pacient%TYPE;
    BEGIN 
        select id_pacient
        into v_id
        from pacient 
        where data_nasterii = ( select max(data_nasterii)
                                from pacient
                                where id_camera in ( select id_camera --camerele de la sectia v_sectie in care exista cel putin un pacient diagnosticat cu Covid-19
                                                     from camera join pacient using(id_camera)
                                                                 join sectie using(id_sectie)
                                                     where id_pacient in ( select id_pacient --lista pacientilor diagnosticati cu Covid-19
                                                                           from diagnostic_asignat_pacientului
                                                                           where id_diagnostic = ( select id_diagnostic
                                                                                                   from diagnostic
                                                                                                   where initcap(denumire)='Covid-19'
                                                                                                 )
                                                                         )
                                                     and id_sectie in ( select id_sectie
                                                                        from sectie
                                                                        where upper(denumire) =  v_sectie
                                                                      )
                                                   )
                          );
        DBMS_OUTPUT.PUT_LINE('Pacientul este '|| v_id);
    
        EXCEPTION
         WHEN NO_DATA_FOUND THEN -- Cazul când primesc o denumire de sectie care nu exista sau o sectie care nu are pacientii ceruti
            RAISE_APPLICATION_ERROR(-20000,'Nu exista pacienti!');
         WHEN TOO_MANY_ROWS THEN
            RAISE_APPLICATION_ERROR(-20001,'Exista mai multi pacienti nascuti la aceeasi data!'); 
         WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002,'Eroare!');
    
    END ex9;
END;
/

--Testez obiectele din pachet
BEGIN
    pachet_13.ex6;
    
    pachet_13.ex7;
    
    DBMS_OUTPUT.PUT_LINE('Medicamentul este '|| pachet_13.ex8());
    
    ex9('INFECTIOASE_COPII');
END;
/





