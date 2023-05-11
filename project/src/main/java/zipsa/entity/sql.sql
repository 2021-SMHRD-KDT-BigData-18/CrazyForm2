SELECT * FROM  V_AFTER_TODAY_HOLIDAY
WHERE STAFF_SEQ=1 ; -- 원하는 staff_seq 넣어주기

SELECT * FROM V_AFTER_TODAY_REV
WHERE STAFF_SEQ=1 ; -- 원하는 staff_seq 넣어주기

-- 오늘 이후부터 휴무일 확인하는 뷰 만들기 
CREATE OR REPLACE VIEW V_AFTER_TODAY_HOLIDAY AS
SELECT STAFF_SEQ, HOLI_DT  FROM T_HOLIDAY
WHERE TO_CHAR(HOLI_DT,'YYYY/MM/DD')>(SELECT TO_CHAR(SYSDATE+1,'YYYY/MM/DD') FROM DUAL);

-- 오늘이후의 예약일 확인하는 뷰
CREATE OR REPLACE VIEW V_AFTER_TODAY_REV AS
SELECT REV_DT, STAFF_SEQ  FROM T_RESERVATION
WHERE TO_CHAR(REV_DT,'YYYY/MM/DD HH:MI:SS')>(SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') FROM DUAL);