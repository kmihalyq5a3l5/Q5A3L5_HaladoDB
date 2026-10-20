create table auto1 (
    rsz char(6) primary key,
    tipus char(30),
    szin char(20),
    kor number(3),
    ar number(10)
);

    desc auto1;
-- Töltse fel az auto1 nevű táblát!

insert into auto1 value ('ABC500', 'Opel Corsa', 'piros', 8, 800000);
insert into auto1 value ('MCC325', 'Opel Insignia', 'fekete', 2, 6800000);
insert into auto1 value ('BBM104', 'Suzuki Swift', 'piros', 5, 1500000);
insert into auto1 value ('CHR411', 'Renault Twingo', 'piros', 12, 700000);
insert into auto1 value ('JRZ932', 'BMW M3', 'fekete', 5, 4500000);
insert into auto1 value ('JEG113', 'Opel Corsa', 'piros', 7, 900000);
insert into auto1 value ('DER842', 'Seat Ibiza', 'szürke', 14, 500000);
insert into auto1 value ('BAB422', 'Lada 1300S', 'fehér', 28, 129908);
insert into auto1 value ('UFF666', 'Audi TT', 'fekete', 4, 6075000);
insert into auto1 value ('UFF888', 'Audi TT', 'fekete', 4, 5500000);
insert into auto1 value ('JEG114', 'Opel Corsa', 'piros' 7, 364500);

Select * from auto1;

--c.) Írjon egy PL/SQL blokkot, amely 10% csökkenti a 7 évnél idősebb autók árát! Kérdezze le!

declare
    x number(2) := 7;
begin
    update auto1 set ar=ar*0.9 where kor >= x;
    end;

Select * from auto1;

--d.) Írjon egy PL/SQL blokkot, amely autók átlagárát kérdezi le és jeleníti meg a DBMS kimeneten (oszlopváltozóval)

declare
    x auto1.ar%type;
begin
    select avg(ar) into x from auto1;
    dbms_output.put_line(x);
end;

select * from auto1;

--e.) Írjon egy PL/SQL blokkot, amely auto1 darabszámát kérdezi le és jeleníti meg DBMS kimeneten.

declare 
    x int;
begin
    select count(*) into x from auto1;
    dbms_output.put_line('Autók száma: '|| x);
end;

--f.) Írjon egy PL/SQL blokkot, amely auto1 táblát rsz = 'ABC500' alapján kérdezi le az árát és jeleníti meg DBMS kimeneten.

declare 
    x auto1%rowtype;
begin
    SELECT * INTO x FROM auto1 WHERE rsz = 'ABC500';
    dbms_output.put_line(x.ar);
end;

--g.) Szúrjon be egy rekordot az auto1 táblába oszlopváltozó használatával!

declare
    a auto1.rsz%type := 'IRM451';
    b auto1.tipus%type:== 'Renault Megane';
    c auto1.szin%type:== 'szürke';
    d auto1.kor%type:== 21;
    e auto1.ar%type := 600000;
begin
    insert into auto1 values (a, b, c, d, e);
end;

--h.) Törölje az auto1 táblából a memóriaváltozóban megadott korú autót!

declare 
    x auto1.kor%type := 21;
begin
    delete from auto1 where kor = x;
end;

-- Készítsen Naplo táblát:

CREATE TABLE Naplo
(
    Adat NUMBER(10,2),
    Datum DATE,
    Szemely VARCHAR2(20)
);
desc naplo

--i.) Írjon egy PL/SQL blokkot, amely az auto1 tábla autóinak az átlagárát kérdezi le és tárolja le a Naplo táblába!

DECLARE 
    x auto1.ar%TYPE;
BEGIN
    SELECT AVG(ar) INTO x FROM auto1;
    INSERT INTO Naplo VALUES (x, SYSDATE, USER);
END;

select * from naplo;

ALTER TABLE Naplo
MODIFY Adat NUMBER(10,2);
