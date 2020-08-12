select * from chatbot;
select * from chatbot_answer;
select answer from chatbot_answer
where answer_no = (select answer_no from chatbot 
    where keyword = '안녕');

select keyword from chatbot
order by answer_rank desc;

delete chatbot_answer
where answer_no=9997;

create table chatbot(
    keyword varchar2(90) NOT NULL UNIQUE, 
    ANSWER_NO NUMBER NOT NULL,
    answer_rank NUMBER DEFAULT 0);
    
create table chatbot_answer(
    answer_no NUMBER primary key,
    answer CLOB
    );

insert into chatbot_answer(answer_no, answer)
values(1,'안녕하세요~ 잡잡입니다!<br> 궁금한게 있다면 물어봐주세요!');

insert into chatbot(keyword, answer_no, answer_rank)
values('안녕',1,0);

insert into chatbot(keyword, answer_no, answer_rank)
values('하이',1,0);

insert into chatbot(keyword, answer_no, answer_rank)
values('방가',1,0);

insert into chatbot(keyword, answer_no, answer_rank)
values('ㅎㅇ',1,0);

insert into chatbot(keyword, answer_no, answer_rank)
values('회원가입',2,1);

insert into chatbot_answer(answer_no, answer)
values(2,'일반회원 가입을 원하시면 <a href="/team4final/member/register.do"><b>여기</b></a><br> 기업회원 가입을 원하시면 <a href="/team4final/companypage/member/companyJoin.do"><b>여기</b></a><br>를 클릭해 주세요!');

insert into chatbot(keyword, answer_no, answer_rank)
values('이력서',3,3);

insert into chatbot_answer(answer_no, answer)
values(3,'이력서 관리 및 작성은<br>로그인 후 [내 정보 > 이력서]에서<br>진행하실 수 있습니다.');

insert into chatbot(keyword, answer_no, answer_rank)
values('정승환',9999,9999);

insert into chatbot_answer(answer_no, answer)
values(9999,'통칭 수서형님.<br>수서 아방궁에서 거주중이다.<br>강동원 닮은 외모로 남자들의 질투를 한몸에 받음');

insert into chatbot(keyword, answer_no, answer_rank)
values('2952',9998,9998);

insert into chatbot_answer(answer_no, answer)
values(9998,'이꾸요잇!!');

insert into chatbot(keyword, answer_no, answer_rank)
values('워싱칭따오',9997,9997);

insert into chatbot_answer(answer_no, answer)
values(9997,'<img src="/team4final/resources/images/cldEkdh.PNG"/><b style="font-size:large">워싱칭따오!</b>');