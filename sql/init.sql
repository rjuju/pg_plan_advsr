-- for CTE (less than PG12)
create table t1 (a int, b int);
insert into t1 (select a, random() * 1000 from generate_series(0, 999999) a);
create index i_t1_a on t1 (a);
analyze t1;

create table t2 (a int, b int);
insert into t2 (select a, random() * 1000 from generate_series(0, 999999) a);
create index i_t2_a on t2 (a);
analyze t2;

create extension pg_hint_plan;
create extension pg_store_plans;
create extension pg_plan_advsr;
