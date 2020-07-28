alter table CAREER  add career_rank varchar2(50); 
alter table CAREER  add career_year varchar2(50); 
alter table CAREER  add career_location varchar2(50);
alter table CAREER  add career_sal varchar2(50);  
alter table resume
rename column resume_title to self_int_title;
alter table CERTIFY
rename column get_date to certify_get_date;

create sequence EDUCATION_seq
start with 1
increment by 1
nocache;

create sequence CAREER_seq
start with 1
increment by 1
nocache;

create sequence LANGUAGE_seq
start with 1
increment by 1
nocache;

create sequence ADDINFO_seq
start with 1
increment by 1
nocache;

create sequence ACTIVE_seq
start with 1
increment by 1
nocache;

create sequence AWARD_seq
start with 1
increment by 1
nocache;

create sequence POTFOLIO_seq
start with 1
increment by 1
nocache;

create sequence CERTIFY_seq
start with 1
increment by 1
nocache;