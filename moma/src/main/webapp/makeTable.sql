-- 컨텐츠 테이블
drop table content cascade constraints;

create table content (
       	cno NUMBER CONSTRAINT content_cno_pk PRIMARY KEY NOT NULL,
        cname VARCHAR2(100) NOT NULL,
        sort CHAR(1) default 'm' NOT NULL,
        clevel NUMBER(10) NOT NULL,
        genre VARCHAR2(100) NOT NULL,
        hours VARCHAR2(20) NOT NULL,
        start_date VARCHAR2(4) NOT NULL,
        cviews NUMBER DEFAULT 0 NOT NULL,
        netflix VARCHAR2(200),
        watcha VARCHAR2(200),
        tving VARCHAR2(200),
        poster VARCHAR2(100),
        del CHAR(1) default 'n' NOT NULL,
        director VARCHAR2(50) NOT NULL,
        actor VARCHAR2(100) NOT NULL,
        reserve CHAR(1) default 'n' NOT NULL
);

alter table content modify reserve  CHAR(1)  NULL;
update CONTENT set reserve='' where reserve='N';
select * from content order by cno;

-- 회원 테이블
drop table member;
create table member(
        mno NUMBER CONSTRAINT member_mno_pk PRIMARY KEY NOT NULL,
        id VARCHAR2(30) NOT NULL,
        password VARCHAR2(20) NOT NULL,
        email VARCHAR2(30) NOT NULL,
        mname VARCHAR2(10) NOT NULL,
        nickname VARCHAR2(10) NOT NULL,
        phone VARCHAR2(20) NOT NULL,
        sms_check CHAR(1) default 'y' NOT NULL,
        email_check CHAR(1) default 'y' NOT NULL,
        join_date DATE NOT NULL,
        del CHAR(1) default 'n' NOT NULL
);

alter table member modify (nickname varchar2(20)); 
select * from member;

update member set del='n' where mno=1;
update MEMBER set del='n' where mno=4;

-- 컨텐츠 좋아요 테이블
drop table likes cascade constraints;

create table likes (
        lno NUMBER CONSTRAINT likes_lno_pk PRIMARY KEY NOT NULL,
        cno NUMBER CONSTRAINT likes_cno_fk references content NOT NULL, 
        mno NUMBER CONSTRAINT likes_mno_fk references member NOT NULL
);

select * from likes;

-- 예매 테이블
drop table reservation;

create table reservation(
        rsno NUMBER CONSTRAINT reservation_rsno_pk PRIMARY KEY NOT NULL,
        rsdate DATE NOT NULL,
        rstime VARCHAR2(20) NOT NULL,
        rsnum NUMBER(3) NOT NULL,
        cinema VARCHAR2(20) NOT NULL,
        payment VARCHAR2(20) NOT NULL,
        del CHAR(1) default 'n' NOT NULL,
        price NUMBER NOT NULL,
        mno NUMBER CONSTRAINT reservation_mno_fk references member NOT NULL,
        cno NUMBER CONSTRAINT reservation_cno_fk references content NOT NULL
);

select * from reservation;
delete from RESERVATION;

-- 리뷰 테이블
drop table review;

create table review(
        rvno NUMBER CONSTRAINT review_rvno_pk PRIMARY KEY NOT NULL,
        star_rate NUMBER(2) NOT NULL,
        rv_content VARCHAR2(200) NOT NULL,
        rv_date DATE NOT NULL,
        del CHAR(1) default 'n' NOT NULL,
        mno NUMBER CONSTRAINT review_mno_fk references member NOT NULL,
        cno NUMBER CONSTRAINT review_cno_fk references content NOT NULL
);

select * from review;

-- 저널게시판 테이블
drop table board;
create table board(
        bno NUMBER CONSTRAINT board_bno_pk PRIMARY KEY NOT NULL,
        bname VARCHAR2(100) NOT NULL,
        bo_content VARCHAR2(4000) NOT NULL,
        bviews NUMBER NOT NULL,
        image VARCHAR2(100) NOT NULL,
        del CHAR(1) default 'n' NOT NULL
);

select * from board;

-- 저널게시판 댓글 테이블
drop table boardcmt cascade constraints;

create table boardcmt(
        bcno NUMBER CONSTRAINT boardcmt_cmno_pk PRIMARY KEY NOT NULL,
        bc_content VARCHAR2(200) NOT NULL,
        bc_date DATE NOT NULL,
        del CHAR(1) default 'n' NOT NULL,
        bno NUMBER CONSTRAINT boardcmt_bno_fk references board NOT NULL,
        mno NUMBER CONSTRAINT boardcmt_mno_fk references member NOT NULL
);

select * from boardcmt;

select round(avg(star_rate), 1) from review where cno = 60 and del = 'n';