
DROP  TABLE MEMBER ;
-- 회원테이블
CREATE TABLE member (
  mem_no NUMBER PRIMARY KEY, --시퀀스사용
  mem_id VARCHAR2(50) NOT NULL UNIQUE  , 
  mem_password VARCHAR2(50) NOT NULL ,
  mem_name VARCHAR2(30)NOT NULL ,
  mem_phone VARCHAR2(30)NOT NULL UNIQUE  ,
  mem_score NUMBER  ,
  mem_gender VARCHAR2(10)NOT NULL ,
  mem_type NUMBER NOT NULL 
);

SELECT  * FROM MEMBER; 

INSERT  INTO member  VALUES (mem_no.nextval,'kisung','1234','최기성','010-3777-7835',0,'남성',0);






