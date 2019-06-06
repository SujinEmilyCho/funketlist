drop table accounts;
drop sequence accounts_seq;
create table accounts(
	seq number primary key,
	id varchar2(20) not null unique,
	pw varchar2(20) not null,
	name varchar2(12) not null,
	gender varchar2(3) check (gender in ('��', '��')),
	mobileNum number(11) not null
);
create sequence accounts_seq;
--dummy
insert into accounts values(accounts_seq.nextval, 'root', '1234', '������', '��', 01000000000);
insert into accounts values(accounts_seq.nextval, 'user1', '1234', '������', '��', 01000000000);
insert into accounts values(accounts_seq.nextval, 'user2', '1234', '������','��', 01000000000);
insert into accounts values(accounts_seq.nextval, 'user3', '1234', '������', '��', 01000000000);
insert into accounts values(accounts_seq.nextval, 'user4', '1234', '�����', '��', 01000000000);
commit;
exit;