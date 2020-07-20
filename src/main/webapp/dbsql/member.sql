drop table personalMember   cascade constraint;
create table personalMember
(
    userNo        number        primary key,
    userId     varchar2(20)   unique not null,
    pwd        varchar2(15)    not null,
    name        varchar2(20)    not null,
    imageURL varchar2(20) null,
    nickname varchar2(20) null,
    birth number varchar2(20) null,
    gender varchar2(10) null,
zipcode    varchar2(7)        null,
    address    varchar2(200)   null,
    addressDetail    varchar2(50)   null,
    email     varchar2(30)    null,
    hp          varchar2(20)    null,
    regdate     date        default sysdate,
    outdate		date        null--Ε»ΕπΐΞ °ζΏμ Ε»ΕπΐΟ ³Φ΄Β΄Ω    
);

--drop sequence personalMember_seq;
create sequence personalMember_seq
increment by 1
start with 1
nocache;

select * from personalMember;

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
