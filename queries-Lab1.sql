--Q1
SELECT pid FROM Catalog WHERE cost < 10;
--Q2
SELECT DISTINCT P.pid,P.pname FROM Parts P, Catalog C WHERE C.cost<10 AND P.pid=C.pid;
--Q3
SELECT DISTINCT S.address FROM Suppliers S, Catalog C, Parts P WHERE P.pid=C.pid AND P.pname='Fire Hydrant Cap' AND S.sid=C.sid;
--Q4
SELECT S.sname FROM Suppliers S,Catalog C,Parts P WHERE P.pid=C.pid AND P.color='Green' AND S.sid=C.sid;
--Q5
SELECT S.sname,P.pname FROM Suppliers S,Catalog C,Parts P WHERE P.pid=C.pid AND S.sid=C.sid;
