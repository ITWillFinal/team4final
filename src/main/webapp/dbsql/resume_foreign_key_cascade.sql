ALTER TABLE potfolio DROP CONSTRAINT FK_RESUME_TO_POTFOLIO;

ALTER TABLE potfolio ADD CONSTRAINT FK_RESUME_TO_POTFOLIO
FOREIGN KEY(resume_no) REFERENCES resume(resume_no) ON DELETE CASCADE;

ALTER TABLE ACTIVE DROP CONSTRAINT FK_RESUME_TO_ACTIVE;

ALTER TABLE ACTIVE ADD CONSTRAINT FK_RESUME_TO_ACTIVE
FOREIGN KEY(resume_no) REFERENCES resume(resume_no) ON DELETE CASCADE;

ALTER TABLE EDUCATION DROP CONSTRAINT FK_RESUME_TO_EDUCATION;

ALTER TABLE EDUCATION ADD CONSTRAINT FK_RESUME_TO_EDUCATION
FOREIGN KEY(resume_no) REFERENCES resume(resume_no) ON DELETE CASCADE;

ALTER TABLE ADDINFO DROP CONSTRAINT FK_RESUME_TO_ADDINFO;

ALTER TABLE ADDINFO ADD CONSTRAINT FK_RESUME_TO_ADDINFO
FOREIGN KEY(resume_no) REFERENCES resume(resume_no) ON DELETE CASCADE;

ALTER TABLE career DROP CONSTRAINT FK_RESUME_TO_CAREER;

ALTER TABLE career ADD CONSTRAINT FK_RESUME_TO_CAREER
FOREIGN KEY(resume_no) REFERENCES resume(resume_no) ON DELETE CASCADE;

ALTER TABLE AWARD DROP CONSTRAINT FK_RESUME_TO_AWARD;

ALTER TABLE AWARD ADD CONSTRAINT FK_RESUME_TO_AWARD
FOREIGN KEY(resume_no) REFERENCES resume(resume_no) ON DELETE CASCADE;

ALTER TABLE CERTIFY DROP CONSTRAINT FK_RESUME_TO_CERTIFY;

ALTER TABLE CERTIFY ADD CONSTRAINT FK_RESUME_TO_CERTIFY
FOREIGN KEY(resume_no) REFERENCES resume(resume_no) ON DELETE CASCADE;

ALTER TABLE LANGUAGE DROP CONSTRAINT FK_RESUME_TO_LANGUAGE;

ALTER TABLE LANGUAGE ADD CONSTRAINT FK_RESUME_TO_LANGUAGE
FOREIGN KEY(resume_no) REFERENCES resume(resume_no) ON DELETE CASCADE;

create or replace view resume_career_view
as
select r.*, c.career_company
from resume r inner join career c
on r.resume_no = c.resume_no;

create or replace view resume_career_one_view
as
SELECT * FROM resume_career_view 
WHERE ROWID IN 
(SELECT MAX(ROWID) FROM resume_career_view GROUP BY resume_no);