drop table payment   cascade constraint;
create table payment
(
    PAYMENT_CODE varchar2(30) primary key,
    PRODUCT_NAME varchar2(300) NULL,
    PRICE NUMBER NULL,
    START_DAY varchar2(300) default sysdate,
    END_DAY varchar2(300) NULL,
    C_MEMBER_CODE varchar2(30)
);

drop sequence payment_seq;
create sequence payment_seq
increment by 1
start with 1
nocache;


commit;
