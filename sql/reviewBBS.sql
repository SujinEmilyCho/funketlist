drop sequence reviewBBS_seq;
drop table reviewBBS;
create table reviewBBS(
	num number primary key,
	id varchar2(20) references accounts(id),
	sub varchar2(30),
	content varchar2(1024),
	postdate date	
);
create sequence reviewBBS_seq;
--dummy
insert into reviewBBS values(reviewBBS_seq.nextval, 'root', 'test1', 'test1', sysdate);
insert into reviewBBS values(reviewBBS_seq.nextval, 'root', 'test2', 'test2', sysdate);
insert into reviewBBS values(reviewBBS_seq.nextval, 'root', 'test3', 'test3', sysdate);
insert into reviewBBS values(reviewBBS_seq.nextval, 'root', 'test4', 'test4', sysdate);
insert into reviewBBS values(reviewBBS_seq.nextval, 'root', 'test5', 'test5', sysdate);
commit;
exit;