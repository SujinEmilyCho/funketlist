drop table accounts;
drop sequence accounts_seq;
create table accounts(
	seq number primary key,
	id varchar2(20),
	pw varchar2(20),
	name varchar2(12),
	gender varchar2(3) in (��, ��);
);
create sequence accounts_seq;
--dummy
insert into accounts values(accounts_seq.nextval, 'root', '1234', '������');
insert into accounts values(accounts_seq.nextval, 'user1', '1234', '������');
insert into accounts values(accounts_seq.nextval, 'user2', '1234', '������');
insert into accounts values(accounts_seq.nextval, 'user3', '1234', '������');
insert into accounts values(accounts_seq.nextval, 'user4', '1234', '�����');
commit;
exit;