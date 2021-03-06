--question 3
CREATE VIEW emploisDeTemps AS 
SELECT DISTINCT C.codeCours, T.jourCoursDate  FROM Cours C
JOIN Typehoraire T
ON C.codeCours= T.crsCodeCours
JOIN Jourcours J
ON J.dateJourCours=T.jourCoursDate
JOIN Coursdeclasse cls
ON  T.crsCodeCours=cls.crsCodeCours
JOIN Classe Cl
ON cl.specialiteNomSpec=cls.classSpecialiteNomspec
WHERE T.jourCoursDate 
IN ('lundi','mardi','mercredi','jeudi','vendredi','samedi');





--question 4
alter table etudiant add password varchar(50);
update etudiant set password = ora_hash(matricule) where matricule = &Matricule ;

alter table enseignants add password varchar(50);
update enseignants set password = ora_hash(matricule) where matricule = &Matricule ;


--question 5


SET ECHO OFF
SET MARKUP HTML ON SPOOL ON
SPOOL emploi_temps_TIPAM2.HTML
SELECT DISTINCT C.codeCours , 
                C.credits ,
                T.jourCoursDate,
                C.VOLUMEH 
                FROM Cours C
JOIN Typehoraire T
ON C.codeCours= T.crsCodeCours
JOIN Jourcours J
ON J.dateJourCours=T.jourCoursDate
JOIN Coursdeclasse cls
ON T.crsCodeCours=cls.crsCodeCours
JOIN Classe Cl
ON cl.specialiteNomSpec=cls.classSpecialiteNomspec
JOIN Etudiantdeclasse et 
on cls.crsCodeCours=et.COURCODECOURS
JOIN ETUDIANT pp 
ON pp.MATRICULE=et.ETUDIANTMATRICULE
WHERE et.ETUDIANTMATRICULE=&Matricule AND PASSWORD=ora_hash( &Password);
SPOOL OFF
SET MARKUP HTML OFF