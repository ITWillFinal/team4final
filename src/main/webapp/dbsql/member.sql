drop table member   cascade constraint;
create table member
(
    user_no     varchar2(20)        primary key,
    user_id     varchar2(20)   unique not null,
    pwd        varchar2(15)    not null,
    user_name        varchar2(20)    not null,
    imageURL varchar2(100) null,
    nickname varchar2(20) null,
    birth varchar2(20) null,
    gender varchar2(10) null,
    zipcode    varchar2(50)        null,
    address    varchar2(200)   null,
    address_Detail    varchar2(200)   null,
    email     varchar2(30)    null,
    hp          varchar2(20)    null,
    regdate     varchar2(30)        default sysdate,
    outdate     varchar2(30)        null,
    user_status varchar2(3) default 'U',
    resume_no number null,
    yorn varchar2(4) default 'N'
);

drop sequence member_seq;
create sequence member_seq
increment by 1
start with 1
nocache;

select * from member;
commit;


insert into member(user_no, user_id, pwd, user_name, imageURL, nickname,
		birth, gender, zipcode, address, address_detail, email, hp)
		values(member_seq.nextval,'123457', 1, 'userName', 'imageURL', 'nickname',
		 920805, '남자', '#{zipcode}', '#{address}','#{addressDetail}', '#{email}', '01026121212');