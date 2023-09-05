

SELECT * FROM RESERVATION r ;
SELECT * FROM  "MEMBER" m ;


-- 예약번호 시퀀스
CREATE SEQUENCE res_no
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE
NOCACHE;


-- 문의글번호 시퀀스
CREATE SEQUENCE qna_no
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE
NOCACHE;

-- 공지글번호 시퀀스
CREATE SEQUENCE notice_no
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE
NOCACHE;


-- 회원번호 시퀀스
CREATE SEQUENCE mem_no
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE
NOCACHE;

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

DROP TABLE "MEMBER" ;


SELECT * FROM "MEMBER" m ;

INSERT INTO  "MEMBER" m  VALUES (mem_no.nextval,'asdasag','123123','김동영','010-3777-7835',100,'남',0);
INSERT INTO  "MEMBER" m  VALUES (mem_no.nextval,'asda','123123','김동영','010-3777-7835',100,'남',0);
INSERT INTO  "MEMBER" m  VALUES (mem_no.nextval,'asdasag','123123','김동영','010-3777-7835',100,'남',0);






INSERT INTO  "MEMBER" m  VALUES (mem_no.nextval,'asdasag','123123','김동영','010-3777-7835',100,'남',0);
INSERT INTO  "MEMBER" m  VALUES (mem_no.nextval,'asdasag12','123123','준수님','010-3777-7835',200,'남',0);
INSERT INTO  "MEMBER" m  VALUES (mem_no.nextval,'asdasag32','123123','박성욱','010-3777-7835',300,'남',0);
INSERT INTO  "MEMBER" m  VALUES (mem_no.nextval,'asdasag3232','123123','박성욱','010-3777-7835',500,'남',0);
INSERT INTO  "MEMBER" m  VALUES (mem_no.nextval,'asdasag3232532','123123','박성욱','010-3777-7835',600,'남',0);



SELECT
	rownum ,
	MEM_SCORE,
	MEM_ID
FROM
	(SELECT
	mem_score,
	mem_id
FROM
	MEMBER
ORDER BY
	mem_score DESC);




--예약테이블
CREATE TABLE reservation (
  res_no NUMBER  PRIMARY KEY, --시퀀스사용
  mem_no NUMBER NOT NULL ,
  res_date varchar2(50) NOT NULL   --sysdate로 현재날짜값 입력
);

INSERT  INTO RESERVATION r  VALUES (res_no.nextval,16,'2017-03-26');

INSERT INTO  RESERVATION r  VALUES (RES_NO.nextval,2,to_char(sysdate,'YYYY-MM-DD'));
INSERT INTO  RESERVATION r  VALUES (RES_NO.nextval,3,to_char(sysdate,'YYYY-MM-DD'));

	SELECT
		r.RES_NO ,
		r.RES_DATE ,
		m.MEM_NO ,
		m.MEM_ID
		FROM
		RESERVATION r
		INNER JOIN MEMBER m ON
		r.MEM_NO = m.MEM_NO order by r.RES_NO;

	SELECT
		r.RES_NO ,
		r.RES_DATE ,
		m.MEM_NO ,
		m.MEM_ID
		FROM
		RESERVATION r
		INNER JOIN MEMBER m ON
		r.MEM_NO = m.MEM_NO ;






SELECT * FROM RESERVATION r ;
SELECT
	r.RES_NO ,
	r.RES_DATE ,
	m.MEM_NO ,
	m.MEM_ID
FROM
	RESERVATION r
INNER JOIN "MEMBER" m ON
	r.MEM_NO = m.MEM_NO ; 
 




-- 문의 테이블
CREATE TABLE qna (
  qna_no NUMBER PRIMARY KEY, --시퀀스사용
  mem_no NUMBER NOT NULL ,
  qna_title VARCHAR2(100)  NOT NULL ,
  qna_date varchar2(50)  NOT NULL ,  --sysdate로 현재날짜값 입력
  qna_content VARCHAR2(1000)  NOT NULL,
  qna_answer VARCHAR2(1000)
);


SELECT * FROM QNA q ;

INSERT INTO qna VALUES  (qna_no.nextval,'1','제목1','날짜','내용',' ');
INSERT INTO qna VALUES  (qna_no.nextval,'2','제목2','날짜','내용',' ');
INSERT INTO qna VALUES  (qna_no.nextval,'3','제목3','날짜','내용',' ');
INSERT INTO qna VALUES  (qna_no.nextval,'4','제목4','날짜','내용',' ');
INSERT INTO qna VALUES  (qna_no.nextval,'5','제목5','날짜','내용',' ');

DROP  SEQUENCE qna_no;


DROP  TABLE QNA ;

-- 공지 테이블
CREATE TABLE notice (
  notice_no NUMBER PRIMARY KEY , -- 시퀀스사용
  notice_title VARCHAR2(100)  NOT NULL ,
  notice_date varchar2(50) NOT NULL,  -- sysdate로 현재날짜값 입력
  notice_content VARCHAR2(1000)  NOT NULL
);


SELECT * FROM NOTICE n  ;





-- 댓글 테이블
CREATE TABLE qnacomment (
  qna_no NUMBER,
  mem_no NUMBER,
  cmt_content VARCHAR2(1000),
  cmt_date varchar2(50) -- sysdate로 현재날짜값 입력
);
SELECT * FROM QNACOMMENT ;

SELECT  * FROM "MEMBER" m ;
-- 결제테이블
CREATE TABLE pay (
  mem_no NUMBER NOT NULL ,
  reservation_no NUMBER NOT NULL ,
  pay_price NUMBER NOT NULL ,
  pay_date varchar2(50) NOT NULL  --sysdate로 현재날짜값 입력
);

SELECT * FROM PAY p  ;

SELECT
		r.RES_NO ,
		r.RES_DATE ,
		m.MEM_NO ,
		m.MEM_ID
FROM
		RESERVATION r
INNER JOIN MEMBER m ON
		r.MEM_NO = m.MEM_NO
WHERE
	m.mem_name = '최기성'
ORDER BY
		r.RES_NO;

SELECT
		r.RES_NO ,
		r.RES_DATE ,
		m.MEM_NO ,
		m.MEM_ID,
		m.mem_name
		FROM
		RESERVATION r
		INNER JOIN MEMBER m ON
		r.MEM_NO = m.MEM_NO
		WHERE
		m.mem_name
		= '유다연'
		ORDER BY
		r.RES_NO;