INSERT INTO RESERVATION VALUES (1,'dmstj333', 1 , 3, '2023-08-21','2023-08-23',300000,4);
INSERT INTO RESERVATION VALUES (2,'thwjd111', 1 , 3, '2023-09-01','2023-09-04',300000,1);
INSERT INTO RESERVATION VALUES (3,'thwjd111', 1 , 3, '2023-09-07','2023-09-10',300000,2);
INSERT INTO RESERVATION VALUES (4,'thwjd111', 1 , 3, '2023-09-13','2023-09-15',300000,3);
INSERT INTO RESERVATION VALUES (5,'thwjd111', 1 , 3, '2023-09-20','2023-09-21',300000,0);

INSERT INTO RESERVATION VALUES (11,'dmstj333', 21 , 3, '2023-08-21','2023-08-23',300000,4);
INSERT INTO RESERVATION VALUES (12,'thwjd111', 21 , 3, '2023-09-01','2023-09-04',300000,1);
INSERT INTO RESERVATION VALUES (13,'thwjd111', 21 , 3, '2023-09-07','2023-09-10',300000,2);
INSERT INTO RESERVATION VALUES (14,'thwjd111', 21 , 3, '2023-09-13','2023-09-15',300000,3);
INSERT INTO RESERVATION VALUES (15,'thwjd111', 21 , 3, '2023-09-20','2023-09-21',300000,0);

-- 추천게시물
INSERT INTO recomm (recom_id, title, detail, recom_loc, recom_time, reservation_id)
SELECT 1, '가평 닭갈비 맛집', '사장님이 친절하고 닭갈비가 맛있어요.', '가평', SYSDATE, 100 FROM dual
UNION ALL
SELECT 4, '강릉 순두부 맛집', '얼큰하고 맛있어요.', '강릉', SYSDATE, 103 FROM dual
UNION ALL
SELECT 5, '부산 막창 맛집', '사람은 많지만 맛있어서 조아요.', '부산', SYSDATE, 102 FROM dual
UNION ALL
SELECT 6, '부산 광안대교 추천', '사진이 예쁘게 나와서 좋아요.', '부산', SYSDATE, 102 FROM dual;

SELECT * FROM RECOMM ;

INSERT INTO recomm_comm (rc_com_id, recom_id, user_id, rc_com_det, rc_com_time)
SELECT 1, 1, 'thwjd111', '와 저도 가고싶네요!~', TO_DATE('2023-08-19 12:36', 'YYYY-MM-DD HH24:MI') FROM dual
UNION ALL
SELECT 2, 4, 'ekdms222', '저도 거기 갔다왔는데 저는 별로였어요;;', TO_DATE('2023-08-19 12:46', 'YYYY-MM-DD HH24:MI') FROM dual
UNION ALL
SELECT 3, 4, 'dmstj333', '사장불친절끝판왕', TO_DATE('2023-08-20 3:44', 'YYYY-MM-DD HH24:MI') FROM dual;

INSERT INTO recomm_comm (rc_com_id, recom_id, user_id, rc_com_det, rc_com_time)
SELECT 4, 6, 'dpsk555', '재밌겠다..', TO_DATE('2023-08-19 12:47', 'YYYY-MM-DD HH24:MI') FROM dual
UNION ALL
SELECT 5, 6, 'dmstj333', '그 주변 맛집은 없나요?', TO_DATE('2023-08-19 12:51', 'YYYY-MM-DD HH24:MI') FROM dual;