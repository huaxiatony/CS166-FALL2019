--Lab6
--Q1
SELECT COUNT(C.pid), C.sid FROM catalog C GROUP BY C.sid;
--Q2
SELECT COUNT(C.pid), S.sid, S.sname FROM Suppliers S, Catalog C WHERE S.sid = C.sid GROUP BY S.sid HAVING COUNT(C.pid) >=3;
--Q3
SELECT S.sid, S.sname, COUNT(*) FROM suppliers S, parts P, catalog C WHERE S.sid IN (SELECT S.sid FROM suppliers S WHERE S.sid NOT IN (SELECT C.sid FROM catalog C, parts P WHERE C.pid = P.pid AND p.color != 'Green')) AND S.sid = C.sid AND P.pid =C.pid GROUP BY S.sid;
--Q4
SELECT suppliers.sname, MAX(catalog.cost) FROM suppliers, catalog, parts WHERE parts.pid = catalog.pid and suppliers.sid =catalog.sid and suppliers.sid IN(SELECT suppliers.sid FROM suppliers, parts, catalog WHERE suppliers.sid = catalog.sid and parts.pid = catalog.pid and parts.color = 'Red') and suppliers.sid IN(SELECT suppliers.sid FROM suppliers, parts,catalog WHERE suppliers.sid = catalog.sid and parts.pid = catalog.pid and parts.color = 'Green') GROUP BY suppliers.sname;
