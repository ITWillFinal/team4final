select * from chatbot;
select * from chatbot_answer;
select answer from chatbot_answer
where answer_no = (select answer_no from chatbot 
    where keyword = '�ȳ�');

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
values(1,'�ȳ��ϼ���~ �����Դϴ�!<br> �ñ��Ѱ� �ִٸ� ������ּ���!');

insert into chatbot(keyword, answer_no, answer_rank)
values('�ȳ�',1,0);

insert into chatbot(keyword, answer_no, answer_rank)
values('����',1,0);

insert into chatbot(keyword, answer_no, answer_rank)
values('�氡',1,0);

insert into chatbot(keyword, answer_no, answer_rank)
values('����',1,0);

insert into chatbot(keyword, answer_no, answer_rank)
values('ȸ������',2,1);

insert into chatbot_answer(answer_no, answer)
values(2,'�Ϲ�ȸ�� ������ ���Ͻø� <a href="/team4final/member/register.do"><b>����</b></a><br> ���ȸ�� ������ ���Ͻø� <a href="/team4final/companypage/member/companyJoin.do"><b>����</b></a><br>�� Ŭ���� �ּ���!');

insert into chatbot(keyword, answer_no, answer_rank)
values('�̷¼�',3,3);

insert into chatbot_answer(answer_no, answer)
values(3,'�̷¼� ���� �� �ۼ���<br>�α��� �� [�� ���� > �̷¼�]����<br>�����Ͻ� �� �ֽ��ϴ�.');

insert into chatbot(keyword, answer_no, answer_rank)
values('����ȯ',9999,9999);

insert into chatbot_answer(answer_no, answer)
values(9999,'��Ī ��������.<br>���� �ƹ�ÿ��� �������̴�.<br>������ ���� �ܸ�� ���ڵ��� ������ �Ѹ��� ����');

insert into chatbot(keyword, answer_no, answer_rank)
values('2952',9998,9998);

insert into chatbot_answer(answer_no, answer)
values(9998,'�̲ٿ���!!');

insert into chatbot(keyword, answer_no, answer_rank)
values('����Ī����',9997,9997);

insert into chatbot_answer(answer_no, answer)
values(9997,'<img src="/team4final/resources/images/cldEkdh.PNG"/><b style="font-size:large">����Ī����!</b>');