-- 오늘 이후부터 휴무일 확인하는 뷰 만들기 
CREATE OR REPLACE VIEW V_AFTER_TODAY_HOLIDAY AS
SELECT STAFF_SEQ, HOLI_DT  FROM T_HOLIDAY
WHERE TO_CHAR(HOLI_DT,'YYYY/MM/DD')>(SELECT TO_CHAR(SYSDATE+1,'YYYY/MM/DD') FROM DUAL);

SELECT * FROM  V_AFTER_TODAY_HOLIDAY
WHERE STAFF_SEQ=1 ; -- 원하는 staff_seq 넣어주기

-- 오늘이후의 예약일 확인하는 뷰
CREATE OR REPLACE VIEW V_AFTER_TODAY_REV AS
SELECT REV_DT, STAFF_SEQ  FROM T_RESERVATION
WHERE TO_CHAR(REV_DT,'YYYY/MM/DD HH:MI:SS')>(SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') FROM DUAL);

SELECT * FROM V_AFTER_TODAY_REV
WHERE STAFF_SEQ=1 ; -- 원하는 staff_seq 넣어주기

-- 예약현황 직원이름 연동한 뷰 만들기 
SELECT * FROM V_RV_STAFF;

CREATE OR REPLACE VIEW V_RV_STAFF AS
SELECT A.REV_SEQ, A.M_ID, A.JOB_T, A.REV_DT, A.PET_YN, A.STAFF_SEQ, B.STAFF_NAME, A.REV_NOTE, A.M_ADDR
FROM T_RESERVATION A, T_STAFF B
WHERE A.STAFF_SEQ = B.STAFF_SEQ; 

-- 








-- 테이블 생성 SQL - T_RESERVATION
CREATE TABLE T_RESERVATION
(
    REV_SEQ      NUMBER(15, 0)     NOT NULL, 
    M_ID         VARCHAR2(30)      NOT NULL, 
    JOB_T        VARCHAR2(50)      NOT NULL, 
    REV_DT       DATE              NOT NULL, 
    PET_YN       CHAR(1)           NOT NULL, 
    STAFF_SEQ    NUMBER(15, 0)     NOT NULL, 
    REV_NOTE     VARCHAR2(4000)    NOT NULL, 
    REG_DT       DATE              NOT NULL, 
    M_ADDR       VARCHAR2(600)     NULL, 
     PRIMARY KEY (REV_SEQ)
);

-- Auto Increment를 위한 Sequence 추가 SQL - T_RESERVATION.REV_SEQ
CREATE SEQUENCE T_RESERVATION_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - T_RESERVATION.REV_SEQ
CREATE OR REPLACE TRIGGER T_RESERVATION_AI_TRG
BEFORE INSERT ON T_RESERVATION 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT T_RESERVATION_SEQ.NEXTVAL
    INTO :NEW.REV_SEQ
    FROM DUAL;
END;

-- DROP TRIGGER T_RESERVATION_AI_TRG; 

-- DROP SEQUENCE T_RESERVATION_SEQ; 

-- 테이블 Comment 설정 SQL - T_RESERVATION
COMMENT ON TABLE T_RESERVATION IS '집사 예약 현황';

-- 컬럼 Comment 설정 SQL - T_RESERVATION.REV_SEQ
COMMENT ON COLUMN T_RESERVATION.REV_SEQ IS '예약 번호';

-- 컬럼 Comment 설정 SQL - T_RESERVATION.M_ID
COMMENT ON COLUMN T_RESERVATION.M_ID IS '회원 아이디';

-- 컬럼 Comment 설정 SQL - T_RESERVATION.JOB_T
COMMENT ON COLUMN T_RESERVATION.JOB_T IS '청소 내용';

-- 컬럼 Comment 설정 SQL - T_RESERVATION.REV_DT
COMMENT ON COLUMN T_RESERVATION.REV_DT IS '예약 일자';

-- 컬럼 Comment 설정 SQL - T_RESERVATION.PET_YN
COMMENT ON COLUMN T_RESERVATION.PET_YN IS '펫유무';

-- 컬럼 Comment 설정 SQL - T_RESERVATION.STAFF_SEQ
COMMENT ON COLUMN T_RESERVATION.STAFF_SEQ IS '직원 번호';

-- 컬럼 Comment 설정 SQL - T_RESERVATION.REV_NOTE
COMMENT ON COLUMN T_RESERVATION.REV_NOTE IS '요청사항';

-- 컬럼 Comment 설정 SQL - T_RESERVATION.REG_DT
COMMENT ON COLUMN T_RESERVATION.REG_DT IS '등록 일자';

-- 컬럼 Comment 설정 SQL - T_RESERVATION.M_ADDR
COMMENT ON COLUMN T_RESERVATION.M_ADDR IS '회원 주소';

-- Foreign Key 설정 SQL - T_RESERVATION(M_ID) -> T_MEMBER(M_ID)
ALTER TABLE T_RESERVATION
    ADD CONSTRAINT FK_T_RESERVATION_M_ID_T_MEMBER FOREIGN KEY (M_ID)
        REFERENCES T_MEMBER (M_ID) ;

-- Foreign Key 삭제 SQL - T_RESERVATION(M_ID)
-- ALTER TABLE T_RESERVATION
-- DROP CONSTRAINT FK_T_RESERVATION_M_ID_T_MEMBER;

-- Foreign Key 설정 SQL - T_RESERVATION(STAFF_SEQ) -> T_STAFF(STAFF_SEQ)
ALTER TABLE T_RESERVATION
    ADD CONSTRAINT FK_T_RESERVATION_STAFF_SEQ_T_S FOREIGN KEY (STAFF_SEQ)
        REFERENCES T_STAFF (STAFF_SEQ) ;

-- Foreign Key 삭제 SQL - T_RESERVATION(STAFF_SEQ)
-- ALTER TABLE T_RESERVATION
-- DROP CONSTRAINT FK_T_RESERVATION_STAFF_SEQ_T_S;
        
-- 테이블 생성 SQL - T_REVIEW
CREATE TABLE T_REVIEW
(
    REVIEW_SEQ        NUMBER(15, 0)     NOT NULL, 
    REV_SEQ           NUMBER(15, 0)     NOT NULL, 
    REVIEW_CONTENT    VARCHAR2(4000)    NOT NULL, 
    REVIEW_RATING     NUMBER(15, 0)     NOT NULL, 
    REVIEW_DT         DATE              NOT NULL, 
    M_ID              VARCHAR2(30)      NOT NULL, 
     PRIMARY KEY (REVIEW_SEQ)
);

-- Auto Increment를 위한 Sequence 추가 SQL - T_REVIEW.REVIEW_SEQ
CREATE SEQUENCE T_REVIEW_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - T_REVIEW.REVIEW_SEQ
CREATE OR REPLACE TRIGGER T_REVIEW_AI_TRG
BEFORE INSERT ON T_REVIEW 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT T_REVIEW_SEQ.NEXTVAL
    INTO :NEW.REVIEW_SEQ
    FROM DUAL;
END;

-- DROP TRIGGER T_REVIEW_AI_TRG; 

-- DROP SEQUENCE T_REVIEW_SEQ; 

-- 테이블 Comment 설정 SQL - T_REVIEW
COMMENT ON TABLE T_REVIEW IS '고객 리뷰';

-- 컬럼 Comment 설정 SQL - T_REVIEW.REVIEW_SEQ
COMMENT ON COLUMN T_REVIEW.REVIEW_SEQ IS '리뷰 순번';

-- 컬럼 Comment 설정 SQL - T_REVIEW.REV_SEQ
COMMENT ON COLUMN T_REVIEW.REV_SEQ IS '예약 번호';

-- 컬럼 Comment 설정 SQL - T_REVIEW.REVIEW_CONTENT
COMMENT ON COLUMN T_REVIEW.REVIEW_CONTENT IS '리뷰 내용';

-- 컬럼 Comment 설정 SQL - T_REVIEW.REVIEW_RATING
COMMENT ON COLUMN T_REVIEW.REVIEW_RATING IS '리뷰 별점';

-- 컬럼 Comment 설정 SQL - T_REVIEW.REVIEW_DT
COMMENT ON COLUMN T_REVIEW.REVIEW_DT IS '리뷰 날짜';

-- 컬럼 Comment 설정 SQL - T_REVIEW.M_ID
COMMENT ON COLUMN T_REVIEW.M_ID IS '리뷰 작성자';

-- Foreign Key 설정 SQL - T_REVIEW(REV_SEQ) -> T_RESERVATION(REV_SEQ)
ALTER TABLE T_REVIEW
    ADD CONSTRAINT FK_T_REVIEW_REV_SEQ_T_RESERVAT FOREIGN KEY (REV_SEQ)
        REFERENCES T_RESERVATION (REV_SEQ) ;

-- Foreign Key 삭제 SQL - T_REVIEW(REV_SEQ)
-- ALTER TABLE T_REVIEW
-- DROP CONSTRAINT FK_T_REVIEW_REV_SEQ_T_RESERVAT;

-- Foreign Key 설정 SQL - T_REVIEW(M_ID) -> T_MEMBER(M_ID)
ALTER TABLE T_REVIEW
    ADD CONSTRAINT FK_T_REVIEW_M_ID_T_MEMBER_M_ID FOREIGN KEY (M_ID)
        REFERENCES T_MEMBER (M_ID) ;

-- Foreign Key 삭제 SQL - T_REVIEW(M_ID)
-- ALTER TABLE T_REVIEW
-- DROP CONSTRAINT FK_T_REVIEW_M_ID_T_MEMBER_M_ID;
        
        
-- 테이블 생성 SQL - T_MEMBER
CREATE TABLE T_MEMBER
(
    M_ID          VARCHAR2(30)    NOT NULL, 
    M_PW          VARCHAR2(30)    NOT NULL, 
    M_NAME        VARCHAR2(30)    NOT NULL, 
    M_PHONE       VARCHAR2(20)    NOT NULL, 
    M_JOINDATE    DATE            NOT NULL, 
    M_TYPE        CHAR(1)         NOT NULL, 
     PRIMARY KEY (M_ID)
);

-- 테이블 Comment 설정 SQL - T_MEMBER
COMMENT ON TABLE T_MEMBER IS '고객 정보';

-- 컬럼 Comment 설정 SQL - T_MEMBER.M_ID
COMMENT ON COLUMN T_MEMBER.M_ID IS '회원 아이디';

-- 컬럼 Comment 설정 SQL - T_MEMBER.M_PW
COMMENT ON COLUMN T_MEMBER.M_PW IS '회원 비밀번호';

-- 컬럼 Comment 설정 SQL - T_MEMBER.M_NAME
COMMENT ON COLUMN T_MEMBER.M_NAME IS '회원 이름';

-- 컬럼 Comment 설정 SQL - T_MEMBER.M_PHONE
COMMENT ON COLUMN T_MEMBER.M_PHONE IS '회원 전화번호';

-- 컬럼 Comment 설정 SQL - T_MEMBER.M_JOINDATE
COMMENT ON COLUMN T_MEMBER.M_JOINDATE IS '회원 가입일자';

-- 컬럼 Comment 설정 SQL - T_MEMBER.M_TYPE
COMMENT ON COLUMN T_MEMBER.M_TYPE IS '회원 유형';

-- 테이블 생성 SQL - T_HOLIDAY
CREATE TABLE T_HOLIDAY
(
    HOLI_SEQ     NUMBER(15, 0)    NOT NULL, 
    STAFF_SEQ    NUMBER(15, 0)    NOT NULL, 
    HOLI_DT      DATE             NOT NULL, 
     PRIMARY KEY (HOLI_SEQ)
);

-- Auto Increment를 위한 Sequence 추가 SQL - T_HOLIDAY.HOLI_SEQ
CREATE SEQUENCE T_HOLIDAY_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - T_HOLIDAY.HOLI_SEQ
CREATE OR REPLACE TRIGGER T_HOLIDAY_AI_TRG
BEFORE INSERT ON T_HOLIDAY 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT T_HOLIDAY_SEQ.NEXTVAL
    INTO :NEW.HOLI_SEQ
    FROM DUAL;
END;

-- DROP TRIGGER T_HOLIDAY_AI_TRG; 

-- DROP SEQUENCE T_HOLIDAY_SEQ; 

-- 테이블 Comment 설정 SQL - T_HOLIDAY
COMMENT ON TABLE T_HOLIDAY IS '집사직원 휴무일';

-- 컬럼 Comment 설정 SQL - T_HOLIDAY.HOLI_SEQ
COMMENT ON COLUMN T_HOLIDAY.HOLI_SEQ IS '휴무 순번';

-- 컬럼 Comment 설정 SQL - T_HOLIDAY.STAFF_SEQ
COMMENT ON COLUMN T_HOLIDAY.STAFF_SEQ IS '직원 번호';

-- 컬럼 Comment 설정 SQL - T_HOLIDAY.HOLI_DT
COMMENT ON COLUMN T_HOLIDAY.HOLI_DT IS '휴무 날짜';

-- Foreign Key 설정 SQL - T_HOLIDAY(STAFF_SEQ) -> T_STAFF(STAFF_SEQ)
ALTER TABLE T_HOLIDAY
    ADD CONSTRAINT FK_T_HOLIDAY_STAFF_SEQ_T_STAFF FOREIGN KEY (STAFF_SEQ)
        REFERENCES T_STAFF (STAFF_SEQ) ;

-- Foreign Key 삭제 SQL - T_HOLIDAY(STAFF_SEQ)
-- ALTER TABLE T_HOLIDAY
-- DROP CONSTRAINT FK_T_HOLIDAY_STAFF_SEQ_T_STAFF;
        
-- 테이블 생성 SQL - T_STAFF
CREATE TABLE T_STAFF
(
    STAFF_SEQ      NUMBER(15, 0)    NOT NULL, 
    STAFF_NAME     VARCHAR2(30)     NOT NULL, 
    STAFF_PHONE    VARCHAR2(20)     NOT NULL, 
    ALLERGY_YN     CHAR(1)          NOT NULL, 
     PRIMARY KEY (STAFF_SEQ)
);

-- Auto Increment를 위한 Sequence 추가 SQL - T_STAFF.STAFF_SEQ
CREATE SEQUENCE T_STAFF_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - T_STAFF.STAFF_SEQ
CREATE OR REPLACE TRIGGER T_STAFF_AI_TRG
BEFORE INSERT ON T_STAFF 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT T_STAFF_SEQ.NEXTVAL
    INTO :NEW.STAFF_SEQ
    FROM DUAL;
END;

-- DROP TRIGGER T_STAFF_AI_TRG; 

-- DROP SEQUENCE T_STAFF_SEQ; 

-- 테이블 Comment 설정 SQL - T_STAFF
COMMENT ON TABLE T_STAFF IS '집사 직원';

-- 컬럼 Comment 설정 SQL - T_STAFF.STAFF_SEQ
COMMENT ON COLUMN T_STAFF.STAFF_SEQ IS '직원 번호';

-- 컬럼 Comment 설정 SQL - T_STAFF.STAFF_NAME
COMMENT ON COLUMN T_STAFF.STAFF_NAME IS '직원 이름';

-- 컬럼 Comment 설정 SQL - T_STAFF.STAFF_PHONE
COMMENT ON COLUMN T_STAFF.STAFF_PHONE IS '직원 연락처';

-- 컬럼 Comment 설정 SQL - T_STAFF.ALLERGY_YN
COMMENT ON COLUMN T_STAFF.ALLERGY_YN IS '직원 알러지유무';

select * from T_MEMBER;
