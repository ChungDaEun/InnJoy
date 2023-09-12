CREATE TABLE board(

);

CREATE SEQUENCE _seq;

--기본 계층적 조회
SELECT *
FROM (
	SELECT rownum cnt, LEVEL, b.*
	FROM board b
	WHERE subject LIKE '%'||''||'%'
	AND writer LIKE '%'||''||'%'
	START WITH refno = 0
	CONNECT BY PRIOR NO = refno
	ORDER siblings BY NO DESC)
WHERE cnt BETWEEN 1 AND 10;

CREATE TABLE pro_img(
	NO NUMBER PRIMARY KEY,
	pro_id NUMBER,
	fname varchar2(100),
	uptdte DATE,
	FOREIGN KEY(pro_id) REFERENCES product(pro_id)
);

CREATE TABLE review_img(
	NO NUMBER PRIMARY KEY,
	review_id NUMBER,
	fname varchar2(100),
	uptdte DATE,
	FOREIGN KEY(review_id) REFERENCES review(review_id)
);

CREATE TABLE board_img(
	NO NUMBER PRIMARY KEY,
	board_id NUMBER,
	fname varchar2(100),
	uptdte DATE,
	FOREIGN KEY(board_id) REFERENCES board(board_id)
);
