drop table TOS   cascade constraint;
create table TOS
(
    SERVICE_CODE varchar2(30) primary key,
    START_DATE varchar2(300) default sysdate,
    END_DATE varchar2(300) NULL,
    RECRUITMENT_CODE varchar2(30)
);

drop sequence TOS_seq;
create sequence TOS_seq
increment by 1
start with 1
nocache;

select * from TOS;

commit;