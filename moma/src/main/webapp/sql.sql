select * from board;
select * from boardcmt;
select * from boardcmt where bno=1;

drop sequence boardcmt_seq;
create sequence boardcmt_seq;
select boardcmt_seq.nextval from dual;

drop sequence board_seq;
create sequence board_seq start with 7;
select board_seq.nextval from dual;

delete boardcmt;
insert into boardcmt values(1,'comment test 1', sysdate, 'n', 1, 1);
insert into boardcmt values(2,'comment test 2', sysdate, 'n', 1, 1);
insert into boardcmt values(3,'comment test 3', sysdate, 'n', 1, 1);
insert into boardcmt values(4,'comment test 4', sysdate, 'n', 1, 1);