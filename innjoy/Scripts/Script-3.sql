/*진짜 최최최최최종 sql문*/
CREATE TABLE admin (
   adm_id   varchar2(20)   NOT NULL,
   adm_pass   varchar2(30)   NOT NULL,
   PRIMARY KEY (adm_id)
);

CREATE TABLE ij_user (
   user_id   varchar2(20)   NOT NULL,
   user_pass   varchar2(30)   NULL,
   user_name   varchar2(20)   NULL,
   user_phone   varchar2(30)   NULL,
   email   varchar2(50)   NULL,
   n_name   varchar2(20)   NULL,
   auth   varchar2(20)   NULL,
   CONSTRAINT ij_user_pk PRIMARY KEY (user_id)
);

CREATE TABLE bsn_user (
   bsn_id   varchar2(20)   NOT NULL,
   bsn_pass   varchar2(30)   NOT NULL,
   bsn_name   varchar2(30)   NOT NULL,
   bsn_number varchar2(30)   NOT NULL,
   ceo_name   varchar2(20)   NOT NULL,
   bsn_phone   varchar2(20)   NULL,
   bsn_email   varchar2(50)   NULL,
   CONSTRAINT bsn_user_pk PRIMARY KEY (bsn_id)
);

CREATE TABLE pro_type_id (
   pro_type_id   number   NOT NULL,
   pro_type   varchar2(20)   NULL,
   CONSTRAINT pro_type_id_pk PRIMARY KEY (pro_type_id)
);

CREATE TABLE product (
   pro_id   number   NOT NULL,
   bsn_id   varchar2(20)   NOT NULL,
   pro_type_id   number   NOT NULL,
   pro_name   varchar2(30)   NOT NULL,
   pro_loc   VARCHAR2(4000)   NULL,
   basic_info   VARCHAR2(4000)   NULL,
   res_ann   VARCHAR2(4000)   NULL,
   ser_conts   VARCHAR2(4000)   NULL,
   CONSTRAINT product_pk PRIMARY KEY (pro_id),
   CONSTRAINT product_FK_bsn_id FOREIGN KEY (bsn_id) REFERENCES bsn_user(bsn_id)
   ON DELETE CASCADE,
   CONSTRAINT pt_FK_bsn_id FOREIGN KEY (pro_type_id) REFERENCES pro_type_id(pro_type_id)
   ON DELETE CASCADE
);

CREATE TABLE room (
   room_id   number   NOT NULL,
   room_name   varchar2(30)   NULL,
   room_price   number   NULL,
   checkin   varchar2(30)   NULL,
   checkout   varchar2(30)   NULL,
   min_cnt   number   NULL,
   max_cnt   number   NULL,
   smoking   varchar2(30)   NULL,
   bed_cnt   VARCHAR2(4000)   NULL,
   pro_id   number   NOT NULL,
   CONSTRAINT room_pk PRIMARY KEY (room_id),
   CONSTRAINT room_FK_pro_id FOREIGN KEY (pro_id) REFERENCES product(pro_id)
   ON DELETE CASCADE
);

CREATE TABLE reservation (
   reservation_id   number   NOT NULL,
   user_id   varchar2(20)   NOT NULL,
   room_id   number   NOT NULL,
   user_cnt   number   NULL,
   start_dt   date   NULL,
   end_dt   date   NULL,
   payment   number   NULL,
   status number NULL,
   CONSTRAINT res_pk PRIMARY KEY (reservation_id),
   CONSTRAINT res_FK_user_id FOREIGN KEY (user_id) REFERENCES ij_user(user_id)
   ON DELETE cascade,
   CONSTRAINT res_FK_room_id FOREIGN KEY (room_id) REFERENCES room(room_id)
   ON DELETE cascade
);
DROP TABLE recomm;
CREATE TABLE recomm ( /* 추천게시물 */
   recom_id   number   NOT NULL,
   title   varchar2(100)   NULL,
   detail   varchar2(1000)   NULL,
   recom_loc   varchar2(100)   NULL,
   recom_time   date   NULL,
   reservation_id   number   NOT NULL,
   CONSTRAINT recom_id_PK PRIMARY KEY (recom_id),
   CONSTRAINT r_id_PK_reservation_id FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id)
   ON DELETE cascade
);


CREATE TABLE recomm_comm (/* 추천게시물의 댓글*/
   rc_com_id   number   NOT NULL,
   recom_id   number   NOT NULL,
   user_id   varchar2(50)   NOT NULL,
   rc_com_det   varchar2(500)   NULL,
   rc_com_time   date   NULL,
   CONSTRAINT rc_id_PK PRIMARY KEY (rc_com_id),
   CONSTRAINT rid_FK_recom_id FOREIGN KEY (recom_id) REFERENCES recomm(recom_id) ON DELETE cascade,
   CONSTRAINT rc_com_FK_user_id FOREIGN KEY (user_id) REFERENCES ij_user(user_id)
   ON DELETE cascade
   );
CREATE TABLE review (
   review_id   number   NOT NULL,
   star   number   NULL,
   review_det   varchar2(1000)   NULL,
   rev_time   date   NULL,
   reservation_id   number   NOT NULL,
   CONSTRAINT rv_id PRIMARY KEY (review_id),
   CONSTRAINT rf_FK_res FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id) ON DELETE cascade
);



CREATE TABLE pro_img ( /*숙소이미지*/
   no   number   NOT NULL,
   pro_id   number   NOT NULL,
   pfname   varchar2(300)   NULL,
   updte   date   NULL,
   CONSTRAINT no_pk PRIMARY KEY (no),
   CONSTRAINT pro_id_FK_r FOREIGN KEY (pro_id) REFERENCES product(pro_id)
   ON DELETE cascade
);
SELECT * FROM PRO_IMG;
DROP TABLE PRO_IMG;

CREATE TABLE board_img ( /*추천게시글 이미지*/
   no   number   NOT NULL,
   fname   varchar2(300)   NULL,
   updte   date   NULL,
   recom_id   number   NOT NULL,
   CONSTRAINT n_pk PRIMARY KEY (no),
   CONSTRAINT n_FK_recom FOREIGN KEY (recom_id) REFERENCES recomm(recom_id) ON DELETE cascade
);

CREATE TABLE review_img (/*댓글 이미지*/
   no   number   NOT NULL,
   fname   varchar2(300)   NULL,
   updte   date   NULL,
   review_id   number   NOT NULL,
   CONSTRAINT nn_pk PRIMARY KEY (no),
   CONSTRAINT rv_FK_rv FOREIGN KEY (review_id) REFERENCES review(review_id) ON DELETE cascade
);

CREATE TABLE room_img (/*방 이미지*/
   no   number   NOT NULL,
   fname   varchar2(300)   NULL,
   updte   date   NULL,
   room_id   number   NOT NULL,
   CONSTRAINT nono_PK PRIMARY KEY (no),
   CONSTRAINT room_id_FK FOREIGN KEY (room_id) REFERENCES room(room_id) ON DELETE cascade
);

CREATE TABLE res_cancle ( /*예약취소*/
   cancle_id   number   NOT NULL,
   reservation_id   number   NOT NULL,
   cancle_reason   varchar2(300)   NULL,
  CONSTRAINT ci_pk PRIMARY KEY (cancle_id),
   CONSTRAINT ci_fk_r FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id) ON DELETE cascade
);

CREATE TABLE notice ( /*공지사항*/
   NO NUMBER PRIMARY KEY,
   refno NUMBER,
   n_title varchar2(200),
   n_content varchar2(2000),
   readcnt NUMBER,
   regdate date,
   uptdate date
);

CREATE TABLE noticefile(/*공지사항 파일*/
   NO NUMBER,
   fname varchar2(200),
   directory varchar2(500),
   info varchar2(300)
);

CREATE TABLE review_comm (
   rv_com_id   number   NOT NULL,
   review_id   number   NOT NULL,
   rv_com_det   varchar2(4000)   NULL,
   rv_com_time   date   NULL,
  constraint rev_c_pk PRIMARY KEY (rv_com_id),
  constraint rev_c_fk FOREIGN KEY (review_id) REFERENCES review(review_id) ON DELETE cascade
);

CREATE TABLE pay (
   pay_id   number   NOT NULL,
   reservation_id   number   NOT NULL,
   pay_price   number   NULL,
   pay_type   varchar2(4000)   NULL,
   pay_time   date   NULL,
   constraint pay_pk PRIMARY KEY (pay_id),
   constraint pay_fk FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id) ON DELETE cascade
);

CREATE TABLE chat_room ( /*채팅룸*/
    room_id NUMBER PRIMARY KEY,
    se_user VARCHAR2(255),
    re_user VARCHAR2(255)
);

CREATE TABLE chat_message (/*채팅메세지*/
    id NUMBER PRIMARY KEY,
    room_id NUMBER,
    sender VARCHAR2(255),
    message CLOB
);
CREATE TABLE wish ( /*찜하기*/
	wish_id NUMBER PRIMARY KEY,
	user_id NOT NULL,
	pro_id NOT NULL,
	FOREIGN KEY (user_id) REFERENCES ij_user(user_id),
	FOREIGN KEY (pro_id) REFERENCES product(pro_id)
);

-- 후기
CREATE SEQUENCE review_id_seq
START WITH 100
INCREMENT BY 1;

-- 게시물
CREATE SEQUENCE recomm_id_seq
START WITH 100
INCREMENT BY 1;

-- 추천게시물 댓글
CREATE SEQUENCE rc_com_id_seq
START WITH 100
INCREMENT BY 1;

-- 예약하기
CREATE SEQUENCE reservation_id_seq
START WITH 100
INCREMENT BY 1;
SELECT * FROM RESERVATION r2 ;

-- 숙소 시퀀스(총 3개)
create sequence pro_id_seq
start with 100
increment by 1;

-- 숙소 이미지 시퀀스
CREATE SEQUENCE pImg_seq
START WITH 100
INCREMENT BY 1;

-- 게시물 이미지 시퀀스
CREATE SEQUENCE bImg_seq
START WITH 100
INCREMENT BY 1;

-- 후기 이미지 시퀀스
CREATE SEQUENCE rvImg_seq
START WITH 100
INCREMENT BY 1;

-- 룸 이미지 시퀀스
CREATE SEQUENCE rImg_seq
START WITH 100
INCREMENT BY 1;

-- 공지사항 시퀀스
CREATE SEQUENCE nt_no_seq;

-- 채팅룸 시퀀스
CREATE SEQUENCE chat_room_se;

-- 채팅메세지 시퀀스
CREATE SEQUENCE chat_message_se;

-- 룸아이디 시퀀스
CREATE SEQUENCE room_id_seq;
-- 찜하기 시뭔스
CREATE SEQUENCE wish_seq;


-- insert 
SELECT *FROM admin;
-- 관리자 계정
INSERT INTO admin (adm_id, adm_pass)
SELECT 'admin001', 'admpass1!' FROM dual
UNION ALL
SELECT 'admin002', 'admpass2!' FROM dual
UNION ALL
SELECT 'admin003', 'admpass3!' FROM dual;

SELECT * FROM ij_user;
-- 일반회원
INSERT INTO ij_user (user_id, user_pass, user_name, user_phone, email, n_name)
SELECT 'thwjd111', 'qwerty123!', '김소정', '010-1111-1111', 'thwjd111@gmail.com', 'imsso' FROM dual
UNION ALL
SELECT 'ekdms222', 'asdfg123!', '정다영', '010-1234-5678', 'ekdms222@gmail.com', 'dangni' FROM dual
UNION ALL
SELECT 'dmstj333', 'zxcvb123!', '이은성', '010-2222-2222', 'dmstj333@gmail.com', 'eunthe' FROM dual
UNION ALL
SELECT 'dpwls444', 'poiuy123!', '김남진', '010-3333-3333', 'dpwls444@gmail.com', 'jini' FROM dual
UNION ALL
SELECT 'dpsk555', 'lkjhg123!', '유예남', '010-4444-4444', 'dpsk555@gmail.com', 'yuyenn' FROM dual;

SELECT * FROM bsn_user;
-- 사업자회원
INSERT INTO bsn_user (bsn_id, bsn_pass, bsn_name, bsn_number, ceo_name, bsn_phone, bsn_email)
SELECT 'yejin001', 'yj1234@', '멋진펜션', '123-45-67890', '김예진', '010-1111-1111', 'yejin@gmail.com' FROM dual
UNION ALL
SELECT 'sojeong001', 'sj1234@', '귀여운호텔','987-65-43210' , '임소정', '010-2222-2222', 'sojeong@gmail.com' FROM dual
UNION ALL
SELECT 'eundung001', 'ed1234@', '기깔나는리조트', '234-56-78901', '이은서', '010-3333-3333', 'eunseo@gmail.com' FROM dual
UNION ALL
SELECT 'yena001', 'yn1234@', '굉장한모텔', '567-89-01234', '유예나', '010-4444-4444', 'yena@gmail.com' FROM dual
UNION ALL
SELECT 'dan001', 'd1234@', '반짝이는호텔', '890-12-34567', '정다은', '010-5555-5555', 'daeun@gmail.com' FROM dual;

SELECT * FROM pro_type_id;
INSERT INTO pro_type_id values(10000,'모텔');
INSERT INTO pro_type_id values(20000,'호텔/리조트');
INSERT INTO pro_type_id values(30000,'펜션');

SELECT * FROM product;
-- 숙소
INSERT INTO product (pro_id, bsn_id, pro_type_id, pro_name, pro_loc, basic_info, res_ann, ser_conts)
SELECT 1, 'yejin001', 30000, '멋진펜션', '가평',
'인원 추가 정보- 인원 : 기준 2명 / 최대 2명- 인원추가 : 불가능- 최대 인원 초과시 입실 제한 환불불가객실 정보거실+방, 복층형 / 15평구비시설스파/월풀, 개별바비큐, 침대, 에어컨, TV, 취사시설, 식탁, 전자레인지, 야외공용수영장, 월풀스파,야외테라스,비치의자, 전기밥솥, 전기쿡탑, 주방집기,소형냉장고복층형(거실 + 침대룸 + 화장실) + 월풀스파깔끔하고 모던한 객실과 함께 스파를 즐길 수 있으시며 또한 여름에는 야외 수영장을 즐기실 수 있습니다.[바비큐]이용 시간 : 17:00 ~22:00',
'보호자 동반 없이 미성년자 입실 불가합니다.애완동물 동반 입실 불가합니다.예약 인원에서 인원이 추가되는 경우 펜션에 미리 연락을 주시기 바랍니다.최대 인원 초과 시 입실이 불가능할 수 있으며, 해당 사유로 환불 받을 수 없습니다.반려동물 입실 가능 펜션 외에 반려동물 동반 시 입실이 거부될 수 있으며, 해당 사유로 환불 받을 수 없습니다.미성년자는 혼숙이 불가능하며, 동성일 경우 보호자 동반이나 동의가 있을 경우에만 입실이 가능합니다.다음 이용 고객을 위해 입실, 퇴실 시간을 준수해 주시기 바랍니다.객실 및 주변시설 이용 시 시설물의 훼손, 분실에 대한 책임은 투숙객에게 있으며, 손해배상의 책임을 질 수 있습니다.객실의 안전과 화재예방을 위해 객실 내에서 생선이나 고기 등을 굽는 직화 방식은 허용되지 않으며, 개인적으로 준비해 오는 취사도구(그릴, 숯, 전기/전열기구 등)은 반입이 금지되어 있습니다.객실 내에서의 흡연은 금지되어 있으며, 지정된 장소를 이용해 주시기 바랍니다.다른 이용객에게 피해를 줄 수 있는 무분별한 오락, 음주, 고성방가는 삼가주시기 바랍니다.',
'' FROM dual
UNION ALL
SELECT 2, 'sojeong001', 20000, '귀여운호텔', '서울',
'※ 호텔 내 부대시설 운영방안은 코로나 바이러스로 인한 정부지침에 따라 변경될 수 있으며 사전 안내없이 변경될 수 있습니다.. 객실뷰 확정이 불가한 상품입니다.. 공원전망(파크뷰)의 객실을 원하실 경우 추가요금(현장결제)이 발생될 수 있습니다.9평, 더블 침대 1개2인 기준 / 인원 추가 불가체크인 15시 이후 체크아웃 11시 이전에어컨, TV, 개인금고욕조(일부객실), 욕실용품, 드라이기무료 Wi-Fi피트니스 무료 이용',
'· 체크인/체크아웃 시간 룸타입 공지, 연박불가상품 확인 필수[레스토랑 안내]· Level 19 / 상설뷔페· 마스크를 필수 착용 부탁드립니다.· 1) 이용 금액· - 조식뷔페 이용 가격· 성인 : 35,000원 / 소아(48개월~10세이하) : 17,500원· - 런치뷔페 이용 가격· 주중 성인 : 49,000원 / 소아(48개월~10세 이하) : 24,500원· 주말 (토,일,공휴일) 성인 : 65,000원 / 소아 (48개월 ~10세 이하) : 32,500원· - 디너뷔페 이용 가격',
'세면도구~~~' FROM dual
UNION ALL
SELECT 3, 'eundung001', 20000, '기깔나는리조트','부산',
'본 상품은 [확정예약]이므로 결제 완료 시 1시간 이내 예약번호 발송해드립니다.2박 이상의 경우 1박씩 각각 예약 진행 하셔야 합니다.스탠다드는 비전망 객실입니다.상기 이미지는 실제와 다를 수 있습니다.싱글 2일부 객실은 좌식형 식탁과 의자가 준비되어있습니다.침실+거실겸 침실+주방+욕실[객실 비품 관련 안내]-기타 객실비품구성 및 부대시설 관련 상세정보는 소노호텔&리조트 홈페이지 참조',
'[대기예약] 상품의 경우 대기상태로, 예약이 완료되면 별도로 예약번호를 발송해드립니다.예약이 불가능할 경우 별도로 문자로 안내드리며, 결제하신 금액은 전액 환불됩니다.세면도구 유료객실 내 버너/불판/전기 그릴 등 화기용품 사용 금지[객실 비품 관련 안내]-기타 객실비품구성 및 부대시설 관련 상세정보는 소노호텔&리조트 홈페이지 참조',
'욕조/사우나' FROM dual
UNION ALL
SELECT 4, 'yena001', 10000, '굉장한모텔', '강릉',
'',
'숙소상황에 따라 금연객실이 제공되지 않을 수 있습니다.객실요금은 2인기준퇴실시간 초과시 추가요금 발생반려동물 동반입실 불가풍선, 촛불 등 이벤트 불가미성년자의 혼숙예약으로 인한 입실거부시 환불 불가','베드구성
더블 침대 1개' FROM dual
UNION ALL
SELECT 5, 'dan001', 20000, '반짝이는호텔', '인천',
'33m² , 더블 침대 1개, 바다전망2인 기준 / 인원 추가 불가샤워시설, 유선인터넷, LCD HD T무료 Wi-Fi오션뷰 (19층 또는 20층 배정)해당 객실은 상기 사진 이미지와 다를 수 있습니다.체크인 3일 17시 까지 100% 환불',
'예약공지[숙박 안내]※미성년자 투숙 불가치약,칫솔 제공무료 Wi-Fi인원 추가 요금 없음침구 추가 1채 22,000원 (1인 1박 기준, 현장결제)엑스트라 베드 미제공짐 보관 서비스 제공 (체크인 전 & 체크아웃 후)가운은 제공되지 않습니다.',
'인피니티풀'
FROM dual;

SELECT * FROM room;
-- 방
INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'B룸', 100000, '15:00', '11:00',   2, 2, '흡연', '1', 1);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'C룸', 120000, '15:00', '11:00',   2, 4, '금연', '2', 1);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'D룸', 150000, '12:00', '16:00',   2, 4, '흡연', '2', 1);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'A룸', 100000, '15:00', '11:00',   2, 2, '흡연', '1', 2);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'B룸', 120000, '15:00', '11:00',   2, 2, '흡연', '2', 2);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'C룸', 150000, '15:00', '11:00',   2, 4, '흡연', '2', 2);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'D룸', 350000, '15:00', '11:00',   2, 4, '흡연', '2', 2);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'A룸', 100000, '15:00', '11:00',   2, 2, '흡연', '1', 3);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'B룸', 120000, '15:00', '11:00',   2, 2, '흡연', '2', 3);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'A룸', 100000, '15:00', '11:00',   2, 2, '금연', '1', 4);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'B룸', 120000, '15:00', '11:00',   2, 2, '금연', '1', 4);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'C룸', 150000, '15:00', '11:00',   2, 2, '금연', '1', 4);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'D룸', 350000, '15:00', '11:00',   2, 2, '금연', '1', 4);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'A룸', 100000, '15:00', '11:00',   2, 2, '흡연', '1', 5);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'B룸', 120000, '15:00', '11:00',   2, 2, '흡연', '1', 5);

INSERT INTO room(room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
values(room_id_seq.nextval,   'C룸', 150000, '15:00', '11:00', 2, 4, '흡연', '2', 5);

SELECT * FROM reservation;
-- 예약
-- 예약 정보 삽입
INSERT INTO reservation (reservation_id, user_id, room_id, user_cnt, start_dt, end_dt, payment, status)
VALUES (reservation_id_seq.NEXTVAL, 'thwjd111', 1, 3, TO_DATE('2023-08-18', 'YYYY-MM-DD'), TO_DATE('2023-08-19', 'YYYY-MM-DD'), 200000, 1);

INSERT INTO reservation (reservation_id, user_id, room_id, user_cnt, start_dt, end_dt, payment, status)
VALUES (reservation_id_seq.NEXTVAL, 'ekdms222', 2, 2, TO_DATE('2023-08-21', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 487000, 0);

INSERT INTO reservation (reservation_id, user_id, room_id, user_cnt, start_dt, end_dt, payment, status)
VALUES (reservation_id_seq.NEXTVAL,  'dmstj333', 3, 4, TO_DATE('2023-09-09', 'YYYY-MM-DD'), TO_DATE('2023-09-11', 'YYYY-MM-DD'), 123123, 0);

INSERT INTO reservation (reservation_id, user_id, room_id, user_cnt, start_dt, end_dt, payment, status)
VALUES (reservation_id_seq.NEXTVAL, 'dpsk555', 4, 2, TO_DATE('2023-10-23', 'YYYY-MM-DD'), TO_DATE('2023-10-27', 'YYYY-MM-DD'), 213312, 0);

INSERT INTO reservation (reservation_id, user_id, room_id, user_cnt, start_dt, end_dt, payment, status)
VALUES (reservation_id_seq.NEXTVAL, 'dpsk555', 5, 3, TO_DATE('2023-11-02', 'YYYY-MM-DD'), TO_DATE('2023-11-06', 'YYYY-MM-DD'), 2000000, 1);

INSERT INTO reservation (reservation_id, user_id, room_id, user_cnt, start_dt, end_dt, payment, status)
VALUES (reservation_id_seq.NEXTVAL, 'dpsk555', 5, 3, TO_DATE('2023-11-02', 'YYYY-MM-DD'), TO_DATE('2023-11-06', 'YYYY-MM-DD'), 2000000, 1);

INSERT INTO reservation (reservation_id, user_id, room_id, user_cnt, start_dt, end_dt, payment, status)
VALUES (reservation_id_seq.NEXTVAL, 'dpwls444', 2, 2, TO_DATE('2023-08-18', 'YYYY-MM-DD'), TO_DATE('2023-08-19', 'YYYY-MM-DD'), 100000, 1);

INSERT INTO reservation (reservation_id, user_id, room_id, user_cnt, start_dt, end_dt, payment, status)
VALUES (reservation_id_seq.NEXTVAL, 'dmstj333', 6, 4, TO_DATE('2023-08-21', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 2000000, 1);

INSERT INTO reservation (reservation_id, user_id, room_id, user_cnt, start_dt, end_dt, payment, status)
VALUES (reservation_id_seq.NEXTVAL, 'thwjd111', 7, 3, TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('2023-09-11', 'YYYY-MM-DD'), 400000, 1);


SELECT * FROM reservation;

SELECT *FROM review;
--리뷰 ()
INSERT INTO review (review_id, star, review_det, rev_time,  reservation_id)
SELECT 1, 4, '숙소가 깨끗하고 좋았어요 주변에 편의점도 바로 있고 주차공간도 넉넉했습니다. 또 사장님이 고기도 구워주시더라고요~!', TO_DATE('2023-08-18 12:08', 'YYYY-MM-DD HH24:MI'), 100 FROM dual
UNION ALL
SELECT 2, 1, '침대 구석에 머리카락이 뭉치로 있고 화장실도 미끄러워요. 혹시라도 이 숙소에 묵으실 분들은 머리 깨질 준비하고 가세요', TO_DATE('2023-08-19 4:42', 'YYYY-MM-DD HH24:MI'), 101 FROM dual;


SELECT * FROM recomm;
-- 추천게시물
INSERT INTO recomm (recom_id, title, detail, recom_loc, recom_time, reservation_id)
SELECT 1, '가평 닭갈비 맛집', '사장님이 친절하고 닭갈비가 맛있어요.', '가평', SYSDATE, 100 FROM dual
UNION ALL
SELECT 2, '롯데월드', '볼거리도 많고 재미있어요.', '서울', SYSDATE, 101 FROM dual
UNION ALL
SELECT 3, '강남 쭈꾸미 맛집', '웨이팅은 있지만 맛있었어요.', '서울', SYSDATE, 101 FROM dual
UNION ALL
SELECT 4, '강릉 순두부 맛집', '얼큰하고 맛있어요.', '강릉', SYSDATE, 103 FROM dual
UNION ALL
SELECT 5, '부산 막창 맛집', '사람은 많지만 맛있어서 조아요.', '부산', SYSDATE, 102 FROM dual
UNION ALL
SELECT 6, '부산 광안대교 추천', '사진이 예쁘게 나와서 좋아요.', '부산', SYSDATE, 102 FROM dual;

SELECT * FROM recomm_comm;

-- 추천게시글 댓글
INSERT INTO recomm_comm (rc_com_id, recom_id, user_id, rc_com_det, rc_com_time)
SELECT 1, 1, 'thwjd111', '와 저도 가고싶네요!~', TO_DATE('2023-08-19 12:36', 'YYYY-MM-DD HH24:MI') FROM dual
UNION ALL
SELECT 2, 2, 'ekdms222', '저도 거기 갔다왔는데 저는 별로였어요;;', TO_DATE('2023-08-19 12:46', 'YYYY-MM-DD HH24:MI') FROM dual
UNION ALL
SELECT 3, 3, 'dmstj333', '사장불친절끝판왕', TO_DATE('2023-08-20 3:44', 'YYYY-MM-DD HH24:MI') FROM dual;

-- 추천게시글 댓글
SELECT * FROM recomm_comm;
INSERT INTO recomm_comm (rc_com_id, recom_id, user_id, rc_com_det, rc_com_time)
SELECT 4, 2, 'dpsk555', '재밌겠다..', TO_DATE('2023-08-19 12:47', 'YYYY-MM-DD HH24:MI') FROM dual
UNION ALL
SELECT 5, 2, 'dmstj333', '그 주변 맛집은 없나요?', TO_DATE('2023-08-19 12:51', 'YYYY-MM-DD HH24:MI') FROM dual;
INSERT INTO recomm_comm (rc_com_id, recom_id, user_id, rc_com_det, rc_com_time)
VALUES (6, 2, 'dpwls444', '답글 내용', SYSDATE);
INSERT INTO recomm_comm (rc_com_id, recom_id, user_id, rc_com_det, rc_com_time)
VALUES (7, 2, 'dpwls444', '답글 내용22', SYSDATE);


-- 상품 이미지
INSERT INTO PRO_IMG (no, pro_id, pfname, updte)
SELECT 1, 1, '1.jpg',sysdate FROM dual
UNION ALL
SELECT 2, 2, '2.jpg',sysdate FROM dual
UNION ALL
SELECT 3, 3, '3.jpg',sysdate FROM dual;

SELECT * FROM board_img;
-- 게시판 이미지
INSERT INTO board_img (no, fname, updte, recom_id)
SELECT 1, 'image1.png', sysdate, 1 FROM dual
UNION ALL
SELECT 2, 'image2.png', sysdate, 2 FROM dual;

SELECT * FROM review_img;
-- 리뷰 이미지
INSERT INTO review_img(no, fname, updte, review_id)
SELECT 1, 'image1.png', sysdate, 1 FROM dual
UNION ALL
SELECT 2, 'image2.png', sysdate, 2 FROM dual;

-- 예약취소
INSERT INTO res_cancle (cancle_id, reservation_id, cancle_reason)
SELECT 1, 100, '코로나 걸려서 못 가게 되었습니다.' FROM dual
UNION ALL
SELECT 2, 101, '예약자 변심.' FROM dual;






SELECT * FROM review_comm;
-- 사장님 댓글
INSERT INTO review_comm (rv_com_id, review_id, rv_com_det, rv_com_time)
SELECT 1, 1, '저희 숙소에서 재미있게 놀고 좋은 추억 만들고 가셨다니 다행입니다. 다음 여름에도 다시 놀러오시면 더 편안하게 보내실 수 있도록 더욱 노력하겠습니다.. 감사합니다~^^', TO_DATE('2023-08-19','YYYY-MM-DD') FROM dual
UNION ALL
SELECT 2, 2, '우선 죄송하다는 말씀부터 드립니다... 불편사항이 있으시면 언제든지 카운터로 문의주세요. 최대한 빠르게 조치하도록 하겠습니다. 다음 이용 시에는 더욱 노력하겠습니다~^^', TO_DATE('2023-08-20','YYYY-MM-DD') FROM dual;


SELECT *FROM pay;
-- 결제
INSERT INTO pay (pay_id, reservation_id, pay_price, pay_type, pay_time) 
SELECT 1, 100, 20000, '카드결제', TO_DATE('2023-07-17', 'YYYY-MM-DD') FROM dual 
UNION ALL
SELECT 2, 101, 487000, '카드결제', TO_DATE('2023-06-17', 'YYYY-MM-DD ') FROM dual 
UNION ALL
SELECT 3, 102, 123123, '계좌이체', TO_DATE('2023-08-18', 'YYYY-MM-DD') FROM dual
UNION ALL
SELECT 4, 103, 213312, '카드결제', TO_DATE('2023-07-02', 'YYYY-MM-DD') FROM dual;

-- 채팅룸
INSERT INTO chat_room (room_id, se_user, re_user) VALUES (chat_room_se.nextval, 'ekdms222', 'dan001');
INSERT INTO chat_room (room_id, se_user, re_user) VALUES (chat_room_se.nextval, 'thwjd111', 'dan001');

-- 채팅 메세지
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 1, 'ekdms222', '이러저러해서 이랬다');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 1, 'dan001', '알겠다');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 1, 'ekdms222', '감사하다');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 2, 'thwjd111', '문의요');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 2, 'dan001', 'ㅇ');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 2, 'thwjd111', '왜욘');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 2, 'thwjd111', '왜그러는건데요');
INSERT INTO chat_message (id, room_id, sender, message) VALUES (chat_message_se.nextval, 1, 'ekdms222', '알겠습니다');

-- 바뀐 것
ALTER TABLE pro_img
RENAME COLUMN fname TO pfname;
ALTER TABLE room_img
RENAME COLUMN fname TO rfname;
ALTER TABLE room_img
RENAME COLUMN no TO rno;

INSERT into ij_user VALUES ('abcd1234','abcd1234!','테스트','010-8765-7654','zemma335@gmail.com','test',' ');
INSERT into bsn_user VALUES ('abcd12345','abcd1234!','a펜션','123-13-13131','테스트','010-8765-7653','zemma335@gmail.com');

SELECT * FROM ROOM_IMG;

-- 조회
SELECT * FROM ij_user;
SELECT * FROM bsn_user;
SELECT * FROM review;
SELECT * FROM recomm;
SELECT * FROM recomm_comm;
SELECT * FROM product;
SELECT * FROM reservation;
SELECT * FROM review_comm;
SELECT *FROM pay;
SELECT *FROM res_cancle;
SELECT *FROM notice;
SELECT *FROM admin;
SELECT *FROM pro_img;
SELECT * FROM board_img;
SELECT * FROM review_img;
SELECT * FROM room_img;
SELECT * FROM pro_type_id;
SELECT * FROM room;
SELECT * FROM PRODUCT;
SELECT * FROM CHAT_MESSAGE;
SELECT * FROM CHAT_room;
SELECT * FROM wish;



-- 테이블 삭제
/*
DROP TABLE pay;
DROP TABLE review_comm;
DROP TABLE report;
DROP TABLE notice;
DROP TABLE res_cancle;
DROP TABLE review_img;
DROP TABLE board_img;
DROP TABLE pro_img;
DROP TABLE recomm_comm;
DROP TABLE recomm;
DROP TABLE review;
DROP TABLE reservation;
DROP TABLE room;
DROP TABLE product;
DROP TABLE pro_type_id;
DROP TABLE BSN_USER ;
DROP TABLE ij_user;
DROP TABLE admin;