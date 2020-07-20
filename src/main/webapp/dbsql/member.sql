drop table member   cascade constraint;
create table member
(
    user_no        number        primary key,
    user_id     varchar2(20)   unique not null,
    pwd        varchar2(15)    not null,
    user_name        varchar2(20)    not null,
    imageURL varchar2(20) null,
    nickname varchar2(20) null,
    birth number varchar2(20) null,
    gender varchar2(10) null,
    zipcode    varchar2(7)        null,
    address    varchar2(200)   null,
    addressDetail    varchar2(50)   null,
    email     varchar2(30)    null,
    hp          varchar2(20)    null,
    regdate     varchar2(30)        default sysdate,
    outdate     varchar2(30)        null--Ż���� ��� Ż���� �ִ´�    
);

--drop sequence member_seq;
create sequence member_seq
increment by 1
start with 1
nocache;

select * from member;

/*
create table zipcode
(
 ZIPCODE varchar2(10),
 SIDO varchar2(30),
 GUGUN varchar2(30),
 DONG varchar2(200),
 BUNJI varchar2(100),
 SEQ number
);

select * from zipcode;
*/