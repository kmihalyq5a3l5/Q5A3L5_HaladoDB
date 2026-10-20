CREATE TABLE Auto2 (
    ID number(4)PRIMARY KEY,
    Rendszam varchar2(6),
    Tipus varchar2(30),
    Szin varchar2(20),
    Kor number(3),
    Ar number(10),
    Muszaki_erv date
);

desc auto2;

//Adatok beszúrása

BEGIN

INSERT INTO Auto2 VALUES(1, 'ABC123', 'Opel Corsa', 'Piros', 6, 3200000, TO_DATE('05.08.2024', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES(2, 'QWJ612', 'Suzuki Alto', 'Kék', 15, 5000000, TO_DATE('03.12.2024', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES(3, 'PHD229', 'Skoda Scala', 'Fehér', 1, 6800000, TO_DATE('10.06.2025', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES(4, 'PET220', 'Opel Astra', 'Fekete', 3, 4400000, TO_DATE('08.05.2024', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES(5, 'RWE611', 'Ford Focus', 'Sárga', 4, 5300000, TO_DATE('05.12.2025', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES(6, 'MNS418', 'Skoda Karoq', 'Kék', 2, 7000000, TO_DATE('25.11.2025', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES(7, 'MUX312', 'Suzuki Swift', 'Piros', 8, 1600000, TO_DATE('05.09.2025', 'DD-MM-YYYY'));
END;

select * from auto2;

//Irattassa ki a szerveren a mai dátumot!

SELECT sysdate FROM dual;

SET SERVEROUTPUT ON;

//Tárolt eljárások
//1. Készítsen egy tárolt eljárást (neve: Atlag), amely az Auto2 táblában lévő autók Átlag árát írja ki!

CREATE OR REPLACE Procedure Atlag AS 
    b Auto2.Ar%TYPE;
BEGIN
    SELECT AVG(Ar) INTO b FROM Auto2;
        DBMS_OUTPUT.PUT_LINE(b);
END;
/
BEGIN
    Atlag;
END;
/

2. Módosítsa a kiírást, azaz a kapott eredményt tagolt (ezres) legyen!

CREATE OR REPLACE Procedure Atlag As
x Auto2.Ar%TYPE;
    xb1 varchar(30);
BEGIN 
SELECT AVG(Ar) INTO x FROM Auto2;
    xb1:= TO_CHAR(x, '9G999G999G999');
    xb1:= LTRIM(REPLACE(xb1, ',', ' '));
    DBMS_OUTPUT.PUT_LINE('Eredmény: '||xb1||' HUF');
END;

BEGIN
    Atlag;
END;

3. IN és OUT paraméterre - példa
Határozza meg a négyzet területét!

CREATE Procedure negyzet (a in number, b out number) is
BEGIN
    b := a*a;
END;

Futtatás:

DECLARE
    a int:=10;
    b int;
BEGIN
    negyzet (a, b);
    dbms_output.put_line(b);
end;

Tárolt függvény
3. Készítsen egy tárolt függvényt (neve: RendszamSzin), amely visszaadja egy megadott rendszámú auto színét!

CREATE OR REPLACE Function RendszamSzin(rszbe in char) RETURN char AS
    b auto2.szin%TYPE;
BEGIN
    SELECT Szin INTO b FROM Auto2 WHERE Rendszam= rszbe;
    RETURN b;
END;

SELECT RendszamSzin('ABC123') FROM Dual;
//VAGY
DECLARE
    b char(40);
BEGIN
    b := RendszamSzin('ABC123');
    DBMS_OUTPUT.PUT_LINE(B);
    END;

Tárolt eljárások: rekord felvitele, módosítása, törlése

1. Készítsen egy tárolt eljárást, amely egy új rekordot visz fel Auto2 táblába.

CREATE OR REPLACE Procedure UjRekord (idbe in number, rszbe in char, tipbe in char, szinbe in char, korbe in number, arbe in number, muszbe in date) IS
BEGIN
INSERT INTO Auto2 VALUES (idbe, rszbe, tipbe, szinbe, korbe, arbe, muszbe);
END;

select * from auto2;

BEGIN 
    UjRekord (8, 'RRR555', 'Ford Kuga', 'szürke', 5, 5200000, DATE '2017-06-05');
END;

select * from auto2;

2. Készítsen egy tárolt eljárást, amely egy adott ID Auto színét módosítja egy másik színre!

CREATE OR REPLACE Procedure AutoModosit (idbe in number, szinbe in char) is 
BEGIN 
    UPDATE Auto2 SET Szin = szinbe WHERE ID = idbe;
END;

BEGIN 
    AutoModosit(8, 'Türkiz kék');
END;

SELECT * FROM Auto2;

3. Készítsen egy tárolt eljárást, amely egy adott ID Auto rekordját törli!

CREATE OR REPLACE Procedure AutoTorol (idbe in number) is
BEGIN
    DELETE FROM Auto2 WHERE ID = idbe;
END;



