-- Kapittel 5

use BibliotekDB;

-- 5.8.2. a)
select * from Utlån
where LNr = 2;

-- 5.8.2. b)
select * from Låner
left join Utlån
on Låner.LNr = Utlån.LNr;

-- 5.8.2. c)

update Utlån set Utlånsdato = '2025-02-01' where UtlånsNr in (1,2,4,6);
select 
    L.Lnr,
    L.Fornavn,
    count(U.UtlånsNr) as antall_utlån
from Låner L
left join Utlån U on L.LNr = U.LNr
where date_format(Utlånsdato, '%Y-%m') = date_format(now(), '%Y-%m')    
group by L.Lnr
order by antall_utlån;

-- 5.8.2. d)
