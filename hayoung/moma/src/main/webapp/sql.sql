select * from board;
select * from boardcmt;
select * from boardcmt where bno=1;

drop sequence boardcmt_seq;
create sequence boardcmt_seq;
select boardcmt_seq.nextval from dual;