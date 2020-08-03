--[3] COMPANY_INFO 
CREATE TABLE COMPANY_INFO (
	COM_CODE VARCHAR2(30) NOT NULL, /* ȸ���ڵ� */
	COM_NAME VARCHAR2(30), /* ȸ��� */
	CEO VARCHAR2(30), /* ��ǥ�ڸ� */
	COM_NUM VARCHAR2(30), /* ����ڵ�Ϲ�ȣ */
	ZIPCODE VARCHAR2(100), /* �����ȣ */
	ADDRESS VARCHAR2(100), /* �ּ� */
	ADDRESSDETAIL VARCHAR2(100), /* ���ּ� */
	IMAGEURL VARCHAR2(100), /* ȸ����� */
	COM_HP VARCHAR2(30), /* ��ȭ��ȣ */
	COM_TYPE VARCHAR2(30), /* ������� */
	COM_INDUSTRY VARCHAR2(30), /* ȸ��з� */
	CONTENT VARCHAR2(300), /* �ֿ������� */
	HOMEPAGE VARCHAR2(50), /* Ȩ������ */
	C_MEMBER_CODE int /* ���ȸ���ڵ� */
);

drop table COMPANY_INFO cascade constraint;

--drop sequence companyInfo_seq;
create sequence companyInfo_seq
start with 1
increment by 1
nocache;


Select * From COMPANY_INFO;

