-- Name: Charles Carter
-- File: exercise6.sql
-- Date: September 10, 2018

use tsqlv4;



create table test (
  testdate date );
insert into test (testdate) values ('2018-09-10');
insert into test (testdate) values ('07/04/1776');
select * from test;
drop table if exists test;

drop table if exists dbo.presidents;


create table dbo.presidents (
  lastname varchar(25),
  firstname varchar(25),
  middlename varchar(25),
  datebirth date,
  datedeath date,
  statebirth varchar(25),
  statehome varchar(25),
  party varchar(50),
  tookoffice date,
  leftoffice date,
  assampt char(5),
  asssucc char(5),
  religion varchar(25)
  );

bulk insert dbo.presidents from 'd:\playpen1\pres.csv'
  with (
  datafiletype = 'char',
  fieldterminator = ',',
  rowterminator = '\n'
  ); 

ALTER TABLE dbo.presidents ADD pid integer unique not NULL identity(1,1);
alter table dbo.presidents add constraint PK_presidents primary key (pid);

delete from dbo.presidents where pid > 44;
select * from dbo.presidents;