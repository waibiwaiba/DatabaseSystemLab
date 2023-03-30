select student.name
from student
    inner join sc on student.num = sc.snum
group by student.num
HAVING count(*) > 3;
select name
from student
where num in (
        select snum
        from sc
        where cnum = %s
    )
select snum,
    avg(grade)
from sc
where snum in (
        select num
        from student
        where name = %s
    )
    and grade >= 60
group by snum