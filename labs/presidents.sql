use tsqlv4;

update dbo.presidents set leftoffice = '2017-01-20', assampt = 'FALSE', asssucc = 'FALSE' 
  output inserted.lastname, inserted.leftoffice, deleted.leftoffice, inserted.assampt, deleted.assampt,
  inserted.asssucc, deleted.asssucc 
  where lastname = 'Obama';

  insert into dbo.presidents (lastname, firstname, middlename, datebirth, statebirth,
    statehome, party, tookoffice, religion)
	output inserted.lastname, inserted.firstname, inserted.middlename, inserted.datebirth,
	inserted.statebirth, inserted.statehome, inserted.party, inserted.tookoffice, 
	inserted.religion
	values ('Trump','Donald','John','1946-06-14','New York','New York',
	'Republican','2017-01-20','Presbyterian')

select * from dbo.presidents;

select statehome, party, count(*) as count from dbo.presidents
  group by statehome, party order by count desc;

select firstname, lastname, datediff(day, tookoffice, leftoffice) as daysinoffice
  from dbo.presidents order by daysinoffice desc;

select firstname, lastname, datediff(year, datebirth, tookoffice) - 1 as ageatelection
  from dbo.presidents order by ageatelection desc;

select religion, party, count(*) as count from dbo.presidents
  group by  party, religion order by count desc;

select religion, count(*) as count from dbo.presidents
  group by religion order by count desc;