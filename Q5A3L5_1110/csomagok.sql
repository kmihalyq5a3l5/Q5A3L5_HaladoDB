CREATE OR REPLACE Package body AutoCsomag as Procedure UjAuto (idbe in number, rszbe in char, tipbe in char, szinbe in char, korbe in number, arbe in number, muszbe in char) is 

BEGIN
    INSERT INTO Auto2 VALUES(idbe, rszbe, tipbe, szinbe, korbe, arbe, muszbe);
END;

Procedure AutoModosit (idbe in number, szinbe in char) is

BEGIN
    UPDATE Auto2 SET Szin = szinbe WHERE ID = idbe;
END;

Procedure AutoTorol (idbe in number) is

BEGIN
    DELETE FROM Auto2 WHERE ID = idbe;
END;
END AutoCsomag;