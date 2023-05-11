-- 회원정보 테이블
CREATE TABLE 집사회원(
ID      VARCHAR2(50)  PRIMARY KEY ,
PW      VARCHAR2(100) NOT NULL    ,
NAME    VARCHAR2(100) NOT NULL    ,
TEL     VARCHAR2(100) NOT NULL    ,
ADDRESS VARCHAR2(500) NOT NULL
);

-- 직원정보 테이블
CREATE TABLE 집사직원(
직원번호   NUMBER        PRIMARY KEY,
NAME      VARCHAR2(100) NOT NULL,
TEL       VARCHAR2(100) NOT NULL,
ALLERGY   VARCHAR2(10)  NOT NULL   
);
CREATE SEQUENCE 직원_NUMBER INCREMENT BY 1 START WITH 1;
-- INSERT INTO 집사직원 VALUES( 직원_NUMBER.NEXTVAL, 이름, 전화번호, 알러지유무);

--직원휴무일
CREATE TABLE 직원휴무일(
직원번호 NUMBER,
OFF     date, --휴무일
CONSTRAINT FK_직원번호 FOREIGN KEY(직원번호)REFERENCES 집사직원(직원번호)
);

--집사 리뷰
CREATE TABLE 집사리뷰(
리뷰번호  NUMBER      PRIMARY KEY,
예약번호  NUMBER         NOT NULL,
내용     VARCHAR2(500)   NOT NULL,
별점     NUMBER          NOT NULL,
작성일자  DATE            NOT NULL,
CONSTRAINT FK_집사리뷰_예약번호 FOREIGN KEY(예약번호) REFERENCES 집사예약현황(예약번호)
);
-- 리뷰번호
CREATE SEQUENCE REVIEW_NUMBER INCREMENT BY 1 START WITH 1;
--INSERT INTO 집사리뷰 VALUES( REVIEW_NUMBER.NEXTVAL, 예약번호, 내용, 별점, SYSDATE);

-- 청소 카테고리
CREATE TABLE 집사카테고리(
청소번호 NUMBER      PRIMARY KEY,
청소내용 VARCHAR2(50)
);
INSERT INTO 집사카테고리 VALUES(1, '가사도우미');
INSERT INTO 집사카테고리 VALUES(2, '입주청소');
INSERT INTO 집사카테고리 VALUES(3, '사무실청소');
INSERT INTO 집사카테고리 VALUES(4, '이사청소');
SELECT * FROM 집사예약현황;

-- 예약현황테이블
CREATE TABLE 집사예약현황(
예약번호 NUMBER   PRIMARY KEY,
ID      VARCHAR2(100) NOT NULL,
청소번호 NUMBER        NOT NULL,
예약일자 DATE          NOT NULL,
펫유무  VARCHAR2(50)   NOT NULL,
직원번호 NUMBER        NOT NULL,
요청사항 VARCHAR2(500),
CONSTRAINT FK_예약현황_ID      FOREIGN KEY(ID)      REFERENCES 집사회원(ID),
CONSTRAINT FK_예약현황_직원번호 FOREIGN KEY(직원번호) REFERENCES 집사직원(직원번호),
CONSTRAINT FK_예약현황_청소번호 FOREIGN KEY(청소번호) REFERENCES 집사카테고리(청소번호)
);

SELECT * FROM 집사회원;
SELECT * FROM 집사직원;
SELECT * FROM 직원휴무일;
SELECT * FROM 집사리뷰;
SELECT * FROM 집사카테고리;
SELECT * FROM 집사예약현황;