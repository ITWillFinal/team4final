--[3] COMPANY_INFO 
CREATE TABLE COMPANY_INFO (
	COM_CODE VARCHAR2(30) NOT NULL, /* 회사코드 */
	COM_NAME VARCHAR2(30), /* 회사명 */
	CEO VARCHAR2(30), /* 대표자명 */
	COM_NUM VARCHAR2(30), /* 사업자등록번호 */
	ZIPCODE VARCHAR2(100), /* 우편번호 */
	ADDRESS VARCHAR2(100), /* 주소 */
	ADDRESSDETAIL VARCHAR2(100), /* 상세주소 */
	IMAGEURL VARCHAR2(100), /* 회사사진 */
	COM_HP VARCHAR2(30), /* 전화번호 */
	COM_TYPE VARCHAR2(30), /* 기업형태 */
	COM_INDUSTRY VARCHAR2(30), /* 회사분류 */
	CONTENT VARCHAR2(300), /* 주요사업내용 */
	HOMEPAGE VARCHAR2(50), /* 홈페이지 */
	C_MEMBER_CODE int /* 기업회원코드 */
);

drop table COMPANY_INFO cascade constraint;

--drop sequence companyInfo_seq;
create sequence companyInfo_seq
start with 1
increment by 1
nocache;


Select * From COMPANY_INFO;

