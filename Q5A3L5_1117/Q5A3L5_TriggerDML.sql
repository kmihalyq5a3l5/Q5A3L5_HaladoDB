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


CREATE TABLE AutoNaplo (
    Datum timestamp,
    Esemeny varchar2(30),
    Adat varchar2(150)
);

describe AutoNaplo;

Select * from AutoNaplo;

Delete from AutoNaplo;

CREATE OR REPLACE Trigger TriggerAutoInsert AFTER INSERT ON Auto2 FOR EACH ROW 
BEGIN
    INSERT INTO AutoNaplo VALUES(sysdate , 'Beszúrás', :new.ID||'_'||:new.Rendszam||'_'||:new.Tipus||'_'||:new.Szin||'_'||:new.Kor||'_'||:new.Ar||'_'||:new.Muszaki_erv);
END;

CREATE OR REPLACE Trigger TriggerAutoUpdate AFTER UPDATE ON Auto2 FOR EACH ROW
BEGIN
    INSERT INTO AutoNaplo VALUES(sysdate , 'Módosítás', :new.ID||'_'||:new.Rendszam||'_'||:new.Tipus||'_'||:new.Szin||'_'||:new.Kor||'_'||:new.Ar||'_'||:new.Muszaki_erv);
END;



CREATE OR REPLACE Trigger TriggerAutoDelete AFTER DELETE ON Auto2 FOR EACH ROW
BEGIN
    INSERT INTO AutoNaplo VALUES(sysdate , 'Törlés', :old.ID||'_'||:old.Rendszam||'_'||:old.Tipus||'_'||:old.Szin||'_'||:old.Kor||'_'||:old.Ar||'_'||:old.Muszaki_erv);
END;

select *from auto2;
select * from autonaplo;

BEGIN
    AutoCsomag.UjAuto(9,'SLK228','Mercedes','Piros',6,7200000,TO_DATE('15-11-2026','DD-MM-YYYY'));
    AutoCsomag.AutoModosit(9,'Ezüst');
    AutoCsomag.AutoTorol(9);
END;

DELETE FROM AutoNaplo;

CREATE OR REPLACE Trigger UniverzalisNaplozas AFTER INSERT OR UPDATE OR DELETE ON Auto2 FOR EACH ROW

BEGIN
    IF inserting THEN INSERT INTO AutoNaplo VALUES(sysdate,'Beszúrás',:new.ID||'_'||:new.Rendszam||'_'||:new.Tipus||'_'||:new.Szin||'_'||:new.Kor||'_'||:new.Ar||'_'||:new.Muszaki_erv);
    ELSIF updating THEN INSERT INTO AutoNaplo VALUES(sysdate,'Beszúrás',:new.ID||'_'||:new.Rendszam||'_'||:new.Tipus||'_'||:new.Szin||'_'||:new.Kor||'_'||:new.Ar||'_'||:new.Muszaki_erv);
    ELSIF deleting THEN INSERT INTO AutoNaplo VALUES(sysdate,'Beszúrás',:old.ID||'_'||:old.Rendszam||'_'||:old.Tipus||'_'||:old.Szin||'_'||:old.Kor||'_'||:old.Ar||'_'||:old.Muszaki_erv);
    END IF;
END;

BEGIN
    AutoCsomag.UjAuto(10,'HRT445','Toyota Prius','Piros',8,4320000, TO_DATE('28-10-2026','DD-MM-YYYY'));
    AutoCsomag.AutoModosit(10,'Kék');
    AutoCsomag.AutoTorol(10);
END;




