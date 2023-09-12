SELECT * FROM PRODUCT;

SELECT * FROM ROOM;

SELECT p.PRO_NAME, m.ROOM_NAME
FROM room m
INNER JOIN PRODUCT p  ON p.pro_id = m.pro_id
WHERE p.bsn_id = 'dan001'

SELECT p.PRO_NAME, m.ROOM_NAME, m.ROOM_ID 
FROM room m
INNER JOIN PsRODUCT p ON p.pro_id = m.pro_id
WHERE p.bsn_id = 'dan001';

SELECT START_DT, END_DT, STATUS, USER_ID FROM RESERVATION
WHERE ROOM_ID = 2000301;

SELECT * FROM IJ_USER;

SELECT * FROM RESERVATION;
SELECT * FROM room;
SELECT * FROM PRODUCT;

SELECT
    r.status,r.start_dt,r.end_dt,
    r.user_cnt,r.payment,
    u.user_name,u.user_phone
FROM
    ij_user u
JOIN
    reservation r ON r.reservation_id = 1
WHERE room_id = 2000301;

SELECT * FROM RESERVATION
WHERE RESERVATION_ID = 1;

SELECT
    r.status, r.start_dt,r.end_dt,
    r.user_cnt,r.payment,
    u.user_name, u.user_phone
FROM
    reservation r
JOIN
    ij_user u ON r.user_id = u.user_id
WHERE
    r.reservation_id = 1;


UPDATE RESERVATION SET STATUS = 2
WHERE RESERVATION_ID = 1;


SELECT * FROM reservation;
SELECT * FROM RES_CANCLE;

SELECT c.cancle_reason
FROM reservation r
JOIN res_cancle c ON c.reservation_id = 1
WHERE r.status = 2;

CREATE TABLE chat_room (
    room_id NUMBER PRIMARY KEY,
    se_user VARCHAR2(255),
    re_user VARCHAR2(255)
);
CREATE SEQUENCE room_id_se;


DROP TABLE CHAT_MESSAGE;
DROP TABLE CHAT_ROOM ;
DROP SEQUENCE chat_room_se;
DROP SEQUENCE chat_message_se;



SELECT p.BSN_ID,
	   r.room_id, r.room_name, r.room_price
FROM product p
JOIN room r ON p.pro_id = r.pro_id;

SELECT * FROM chat_room;
INSERT INTO chat_room (room_id, se_user, re_user) VALUES (chat_room_se.nextval, 'ekdms222', 'dan001');
INSERT INTO chat_room (room_id, se_user, re_user) VALUES (chat_room_se.nextval, 'thwjd111', 'dan001');

SELECT * FROM chat_message;

SELECT * FROM chat_message
ORDER BY id ASC;

SELECT * FROM chat_message WHERE room_id = 1
ORDER BY id ASC;

SELECT * FROM Chat_Room
WHERE se_user = 'ekdms222' AND re_user = 'dan001';

CREATE TABLE chat_message (
    id NUMBER PRIMARY KEY,
    room_id NUMBER,
    sender VARCHAR2(255),
    message CLOB
);
CREATE SEQUENCE chat_message_se;
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 1, 'ekdms222', '이러저러해서 이랬다');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 1, 'dan001', '알겠다');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 1, 'ekdms222', '감사하다');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 2, 'thwjd111', '문의요');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 2, 'dan001', 'ㅇ');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 2, 'thwjd111', '왜욘');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 2, 'thwjd111', '왜그러는건데요');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 1, 'ekdms222', '알겠습니다');

SELECT ROOM_ID, SE_USER, RE_USER FROM Chat_room WHERE re_user = 'dan001';
SELECT * FROM chat_room WHERE room_id = 1;
SELECT * FROM chat_message WHERE room_id = 1;

SELECT * FROM CHAT_ROOM;

        SELECT * FROM Chat_room 
        WHERE se_user = 'ekdms222';
        
       SELECT chat_room_se.nextval AS room_id FROM dual;
       SELECT * FROM RECOMM;
ALTER TABLE recomm ADD (recommType VARCHAR2(100));
ALTER TABLE recomm ADD (latitude NUMBER(10, 6));
ALTER TABLE recomm ADD (longitude number(10, 6));





		SELECT
		    rc.title,
		    rc.recom_loc,
		    rc.recom_time,
		    u.n_name,
		    b.fname
		FROM
		    recomm rc
		JOIN
		    reservation rv ON rc.reservation_id = rv.reservation_id
		JOIN
		    ij_user u ON rv.user_id = u.user_id
		LEFT JOIN
			board_img b ON rc.recom_id = b.recom_id;

		SELECT bsn_id FROM PRODUCT
		WHERE PRO_ID =1;

	    SELECT * FROM chat_room
	    WHERE se_user = 'ekdms222' AND re_user = 'dan001';

SELECT * FROM ROOM_IMG;

		SELECT * FROM ROOM r
		JOIN ROOM_IMG ri ON ri.room_id = r.ROOM_ID 
		WHERE r.room_id = 3;

SELECT * FROM IJ_USER;

SELECT * FROM wish;

SELECT * FROM IJ_USER;

INSERT INTO wish (wish_id, user_id, pro_id)
VALUES (wish_seq.nextval, 'ekdms222', 5);


SELECT * FROM PRODUCT;
SELECT * FROM PRO_IMG;
SELECT * FROM ROOM_IMG;
SELECT * FROM WISH;

SELECT p.*, i.* 
FROM wish w
JOIN product p ON w.pro_id = p.pro_id
JOIN pro_img i ON w.pro_id = i.pro_id
WHERE w.user_id = 'asd';

SELECT * FROM PRODUCT;
SELECT * FROM ROOM;




