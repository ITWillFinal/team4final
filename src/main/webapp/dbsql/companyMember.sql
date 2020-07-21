drop table company_member cascade constraint;
create table company_member
(
    C_MEMBER_CODE number        primary key,
    C_USERID varchar2(20)   unique not null,
    C_PWD varchar2(15)    not null,
    C_NICKNAME varchar2(20)    not null,
    C_USERNAME varchar2(20) null,
    C_BIRTH varchar2(20) null,
    C_GENDER  varchar2(10) null,
    C_HP varchar2(10) null,
    C_EMAIL varchar2(30)        null,
    C_JOINDATE varchar2(20)   default sysdate,
    C_OUTDATE varchar2(20)   null
 
);

--drop sequence company_member_seq;
create sequence company_member_seq
increment by 1
start with 1
nocache;

select * from company_member;
