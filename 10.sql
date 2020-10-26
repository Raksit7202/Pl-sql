/*
Write a database trigger that will not allow the changes to the salary of employees 
who are having an experience less than 3 years.
emp(eno(P.K.),name,salary,exp)
*/
DROP TABLE EMP;
CREATE TABLE EMP
(
	ENO NUMBER PRIMARY KEY,
	NAME VARCHAR(15),
    salary NUMBER,
    experience NUMBER 
);

insert into EMP Values (1,'AMAN',15000,5);
insert into EMP Values (2,'BHAMAN',54000,0);
insert into EMP Values (3,'CHAMAN',68000,3);
insert into EMP Values (4,'DAMAN',5000,9);
insert into EMP Values (5,'KHAMAN',95000,6);

DROP trigger MY_EXPERICNCEE;
CREATE OR REPLACE trigger MY_EXPERICNCEE
BEFORE UPDATE of salary ON EMP
begin
    if (NEW.EXPERIENCE<3) then
        RAISE_APPLICATION_ERROR(-20011,'CHANGES IN SALARY NOT ALLOW');  
    end if;
end;

