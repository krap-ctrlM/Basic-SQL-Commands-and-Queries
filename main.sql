CREATE TABLE napr
(shifr_napr char(30) PRIMARY KEY NOT null,
 name_napr char(30) not null)


CREATE TABLE SVYAZI
(id int AUTO_INCREMENT PRIMARY KEY NOT null,
 
 disc_1 int NOT NULL,
 CONSTRAINT SV1
 FOREIGN KEY (disc_1)
 REFERENCES disc_ (disc_),
 
group_1 int NOT NULL,
 CONSTRAINT SV2
 FOREIGN KEY (group_1)
 REFERENCES group_ (group_),
 
otdel_1 int NOT NULL,
 CONSTRAINT SV3
 FOREIGN KEY (otdel_1)
 REFERENCES otdel_ (otdel_),
 
sem_1 int NOT NULL,
 CONSTRAINT SV4
 FOREIGN KEY (sem_1)
 REFERENCES sem_ (sem_))




INSERT into disc_
VALUES(1,4399,'СПО',14,14),(2,9766,'БД',14,14),
(3,1573,'Физика',6,6),(4,6544,'Философия',6,6)


INSERT into group_
VALUES(1,'БСБО-09-20',25), (2,'БСБО-10-20',27), 
(3,'БСБО-11-20',31)


INSERT into otdel_
VALUES(1,232,'информационные технологии'), (2,343,'ИИ'), 
(3,565,'радиотехники')


INSERT into sem_
VALUES(1,1,'осенний'), (2,2,'летний')


SELECT nomer_sem , SUM(lek_disc) FROM sem_, disc_ GROUP BY sem_;


SELECT nomer_sem , max(disc_) FROM sem_, disc_ GROUP BY sem_;


SELECT COUNT(*) FROM disc_;


SELECT nomer_sem , COUNT(*) FROM sem_, svyazi WHERE sem_1 = 1 GROUP BY sem_;


DELIMITER //
CREATE PROCEDURE proc1111
( IN new_shifr char(30), IN n int)

BEGIN
UPDATE group_
SET shifr_group = new_shifr
WHERE chislenost_group < n;

END//

CALL proc1111('МАЛО ЧЕЛОВЕК', 26);



DELIMITER //
CREATE PROCEDURE proc3333
( IN new_lek double, IN new_prak double)

BEGIN
UPDATE disc_
SET proc_lek = lek_disc * proc_lek,
proc_prak = prak_disc * proc_prak,
lek_disc = lek_disc + proc_lek,
prak_disc = prak_disc + proc_prak
WHERE lek_disc + prak_disc < s;
END//

CALL proc3333(100,100);



DELIMITER //
CREATE PROCEDURE proc7777
( IN new_disc int, IN new_shifr int, IN new_name chsr(30), IN new_lek int, IN new_prak int)

BEGIN
INSERT into disc_
VALUES(new_disc,new_shifr,new_name,new_lek,new_prak);

END//

CALL proc7777(5,3434,'русский язык',10,10);



DELIMITER $$
CREATE TRIGGER tr1
BEFORE UPDATE ON group_
FOR EACH ROW BEGIN
declare msg varchar(128);
IF NEW.chislenost_group < 10 THEN
SET msg ='XTO R';
SIGNAL SQLSTATE '45000' SET message_text = msg;
END IF;
END $$


UPDATE group_ 
SET chislenost_group = 5







DELIMITER //
CREATE PROCEDURE pr7_1 ()
BEGIN
         DECLARE id_t1, p0_t1, p1_t1 INT;
         SET id_t1 = 0;
         START TRANSACTION;
                  WHILE id_t1 < 10 DO 
                   SET id_t1 = id + 1;
                   SET p0_t1 = FLOOR(RAND()*(21-9)+9);
                   SET p1_t1 = FLOOR(RAND()*(14-3)+3);	
INSERT INTO t1 VALUES (id_t1, p0_t1, p1_t1);
            END WHILE;
            COMMIT;
             END




DELIMITER //
CREATE PROCEDURE pr7_2 ()
BEGIN
         DECLARE id_t2, p0_t2, p1_t2 INT;
         SET id_t2 = 0;
         START TRANSACTION;
                  WHILE id_t2 < 20 DO 
                   SET id_t2 = id_t2 + 1;
                   SET p0_t2 = FLOOR(RAND()*(100-10)+10);
                   SET p1_t2 = FLOOR(RAND()*(150-30)+30);
INSERT INTO t2 VALUES (id_t2, p0_t2, p1_t2);
            END WHILE;
            COMMIT;
             END






SELECT name_dol, familia_sot FROM dol, sot GROUP BY dol;
SELECT COUNT(familia_sot) FROM sot;



CREATE VIEW view1 (шифр_группы, номер_семестра, часы_практик)
as select svyazi.grup_sv,svyazi.sem_sv, avg(disc.prak_disc) 
from (svyazi join disc on((disc.shifr_disc = svyazi.disc_sv)))



CREATE VIEW view1 (шифр_группы, номер_семестра, часы_практик)
as select grup.shifr_grup, sem.shifr_sem, avg(disc.prak_disc) 
from svyazi INNER JOIN grup on grup.shifr_grup = svyazi.grup_sv INNER JOIN sem on sem.shifr_sem = svyazi.sem_sv INNER JOIN disc on disc.shifr_disc = svyazi.disc_sv
GROUP BY grup.shifr_grup, sem.shifr_sem



CREATE VIEW view2 (номер_семестра,название_семестра)
as select sem.shifr_sem,
case shifr_sem
when 1111
then "осенний"
when  2222
then "весенний"
when  3333
then "осенний"
when  4444
then "весенний"
when  5555
then "осенний"
when  6666
then "весенний"
when  7777
then "осенний"
when  8888
then "весенний"
end 
FROM sem



CREATE VIEW view3
AS
SELECT shifr_disc, lek_disc, prak_disc, sam_disc, kont_disc FROM disc WHERE sam_disc > 0


UPDATE view3 SET sam_disc = sam_disc + 1 WHERE shifr_disc = 2


select * from disc





CREATE TABLE deistvia
(id int PRIMARY KEY not null AUTO_INCREMENT, 
 table_dei VARchar(30),
 user_dei varchar(30),
 date_dei date, 
 function_dei varchar(30))

ОБНОВЛЕНИЕ:
DELIMITER //
CREATE TRIGGER update_disc
AFTER UPDATE on disc
for EACH ROW
BEGIN
INSERT INTO deistvia (table_dei, user_dei ,date_dei ,function_dei) VALUES ("disc",SYSTEM_USER(),sysdate(3),"update");
END

УДАЛЕНИЕ:
DELIMITER //
CREATE TRIGGER delete_disc
AFTER DELETE ON disc
for EACH ROW
BEGIN
INSERT INTO deistvia(table_dei ,user_dei, date_dei, function_dei) VALUES ('disc',SYSTEM_USER(),sysdate(3),'delete');
END

ДОБАВЛЕНИЕ:
DELIMITER //
CREATE TRIGGER insert_disc
AFTER INSERT ON disc
for EACH ROW
BEGIN
INSERT INTO deistvia(table_dei, user_dei, date_dei, function_dei) VALUES ('disc',SYSTEM_USER(),sysdate(3),'insert');
END




CREATE TABLE Contacts
(Id_contacts int primary key NOT NULL,
phone_number varchar(255) NOT NULL);


INSERT INTO Contacts VALUES(1, "8789456731");
INSERT INTO Contacts VALUES(2, "8789487231");
INSERT INTO Contacts VALUES(3, "8789456712");
INSERT INTO Contacts VALUES(4, "8780056731");
INSERT INTO Contacts VALUES(5, "8789456731");
INSERT INTO Contacts VALUES(6, "8798270731");
INSERT INTO Contacts VALUES(7, "8715678731");
INSERT INTO Contacts VALUES(8, "8789927731");



UPDATE Contacts
SET phone_number = RPAD(SUBSTR(phone_number,1,4),length(phone_number),'*');


SELECT RPAD(SUBSTR(phone_number,1,4),length(phone_number),'*') FROM Contacts


GRANT SELECT,INSERT,UPDATE,DELETE ON prak_bd.* TO 'student'@'%'

USE prak_bd
SELECT * FROM GROUP_NET;
DROP TABLE GROUP_NET;
