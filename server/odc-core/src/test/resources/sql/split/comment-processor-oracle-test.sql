insert into t_strings (c1,c2) values ('()', '''''"`\p');
delimiter $$
select * from table where name='David'/*!40100 DEFAULT CHARACTER SET latin1 */ $$
delimiter ;

--这是一句注释This is an comment
select count(*) from table where name='da/*v--i;#d'; --This is a comment注释
  -- This is a comment
  select /*+INDEX(t@SELECT$1 t_c1) INDEX(t@SEL$2 PRIMARY)*/ * from t (select * from t where c2='David/*!Marry*/') as ta where c1='Ann';update table set name='David' where id='Marry';
select name from table where name='Bom';/*This is
a comment,多子节字符注释
This is a comment
*/ select * from table \p;--This is a comment
  /*注释符号嵌套/*This is a
comment*/
--This is 注释
 select * from table where name='Ma--rry';/*This is a comment注释注释*/
select table_name from table where name=`'filedname#field'`;  /*跨行注释
跨行注释*/
select Q'[sadas'asaa]' from dual;
select 'aaaaa' from dual;
CREATE TABLE EMP
(
    EMPNO       BIGINT  PRIMARY KEY AUTO_INCREMENT,
    ENAME       VARCHAR(10),
    JOB         VARCHAR(9),
    MGR         INT,
    HIREDATE    DATETIME,
    SAL         DECIMAL(7,2),
    COMM        DECIMAL(7,2),
    NOdept      BIGINT
--    constraint check_sql check(SAL > 0 AND SAL < 20000)
--    CONSTRAIN emp_fk FOREIGN KEY(NOdept) REFERENCES dept(deptno)  -- NOdept, 子表需要设置外键约束的字段，
-- deptno主表关联的字段（需要为主键或者唯一约束）；删除时先删除子表，才能删除主表
)ENGINE=INNODB DEFAULT CHARSET='utf8mb4';

--------------------------------------------------------
--  DDL for Procedure PROC_TEST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST"."PROC_TEST" ()
begin
declare a int default 5;
declare b int default 6;
declare c int default 0;
set c=a+b;
select c as num;
end;


SELECT last_name, salary + NVL(commission_pct, 0),
   job_id, e.department_id
/* Select all employees whose compensation is
greater than that of Pataballa.*/
  FROM employees e, departments d
/*The DEPARTMENTS table is used to get the department name.*/
  WHERE e.department_id = d.department_id
    AND salary + NVL(commission_pct,0) >/* Subquery:       */
   (SELECT salary + NVL(commission_pct,0)
/* total compensation is salar + commission_pct */
      FROM employees
      WHERE last_name = 'Pataballa');

SELECT last_name,--select the name
    salary + NVL(commission_pct, 0),--total compensation
    job_id,-- job
    e.department_id-- and department
  FROM employees e,-- of all employees
       departments d
  WHERE e.department_id = d.department_id
    AND salary + NVL(commission_pct, 0) >-- whose compensation
-- is greater than
      (SELECT salary + NVL(commission_pct,0)-- the compensation
    FROM employees
    WHERE last_name = 'Pataballa')-- of Pataballa.
;

SELECT /*+ ORDERED INDEX (b, jl_br_balances_n1) USE_NL (j b)
           USE_NL (glcc glf) USE_MERGE (gp gsb) */
 b.application_id ,
 b.set_of_books_id ,
 b.personnel_id,
 p.vendor_id Personnel,
 p.segment1 PersonnelNumber,
 p.vendor_name Name
FROM  jl_br_journals j,
      jl_br_balances b,
      gl_code_combinations glcc,
      fnd_flex_values_vl glf,
      gl_periods gp,
      gl_sets_of_books gsb,
      po_vendors p;

SELECT --+ LEADING(e2 e1) USE_NL(e1) INDEX(e1 emp_emp_id_pk) USE_MERGE(j) FULL(j)
    e1.first_name, e1.last_name, j.job_id, sum(e2.salary) total_sal
  FROM employees e1, employees e2, job_history j
  WHERE e1.employee_id = e2.manager_id
    AND e1.employee_id = j.employee_id
    AND e1.hire_date = j.start_date
  GROUP BY e1.first_name, e1.last_name, j.job_id
  ORDER BY total_sal;

SELECT
/*+ JOIN_PREFIX(t2, t5@subq2, t4@subq1)
    JOIN_ORDER(t4@subq1, t3)
    JOIN_SUFFIX(t1) */
COUNT(*) FROM t1 JOIN t2 JOIN t3
           WHERE t1.f1 IN (SELECT /*+ QB_NAME(subq1) */ f1 FROM t4)
             AND t2.f1 IN (SELECT /*+ QB_NAME(subq2) */ f1 FROM t5);

SELECT /*+ INDEX_MERGE(t1 f3, PRIMARY) */ f2 FROM t1
  WHERE f1 = 'o' AND f2 = f3 AND f3 <= 4;
SELECT /*+ MRR(t1) */ * FROM t1 WHERE f2 <= 3 AND 3 <= f3;
SELECT /*+ NO_RANGE_OPTIMIZATION(t3 PRIMARY, f2_idx) */ f1
  FROM t3 WHERE f1 > 30 AND f1 < 33;
INSERT INTO t3(f1, f2, f3)
  (SELECT /*+ NO_ICP(t2) */ t2.f1, t2.f2, t2.f3 FROM t1,t2
   WHERE t1.f1=t2.f1 AND t2.f2 BETWEEN t1.f1
   AND t1.f2 AND t2.f2 + 1 >= t1.f1 + 1);
SELECT /*+ SKIP_SCAN(t1 PRIMARY) */ f1, f2
  FROM t1 WHERE f2 > 40;
select 'name''--' from dual;--sdfsdfsdfs
CREATE PACKAGE PL_DEBUG_PACKAGE AS PROCEDURE set_breakpoint(
name IN VARCHAR2,
line# IN BINARY_INTEGER,
breakpoint# OUT BINARY_INTEGER,
result OUT BINARY_INTEGER);
PROCEDURE set_breakpoint_anonymous(
line# IN BINARY_INTEGER,
breakpoint# OUT BINARY_INTEGER,
result OUT BINARY_INTEGER);
PROCEDURE show_breakpoints(listing in out varchar2);
PROCEDURE print_backtrace(listing IN OUT VARCHAR, status OUT BINARY_INTEGER);
PROCEDURE cnt_next_line(result OUT BINARY_INTEGER, message OUT VARCHAR2);
PROCEDURE cnt_next_breakpoint(result OUT BINARY_INTEGER, message OUT VARCHAR2);
PROCEDURE cnt_step_in(result OUT BINARY_INTEGER, message OUT VARCHAR2);
PROCEDURE cnt_abort(result OUT BINARY_INTEGER, message OUT VARCHAR2);
PROCEDURE cnt_step_out(result OUT BINARY_INTEGER, message OUT VARCHAR2);
PROCEDURE get_values(scalar_values OUT VARCHAR2, result OUT BINARY_INTEGER);
PROCEDURE get_value(variable_name VARCHAR2,
frame# BINARY_INTEGER,
value OUT VARCHAR2,
result OUT BINARY_INTEGER);
PROCEDURE get_runtime_info(
status OUT BINARY_INTEGER,
result OUT BINARY_INTEGER);
PROCEDURE get_line(
line OUT VARCHAR2, status OUT INTEGER);
END PL_DEBUG_PACKAGE;

delimiter $$ select '$$' from dual $$ delimiter     ; select ';' from dual   ;
select '; second' from dual; delimiter 00;12@ select 'delimiter00;12@' from dual00;12@
delimiter $$ -- this is a comment
select 'comment after' from dual $$ delimiter ; -- this is a single comment
select 'comment after ;' from dual;