CREATE TABLE Member (
	m_Id	varchar(10)		NOT NULL,
	Id	varchar(30)		NULL,
	pw	varchar(100)		NULL,
	mName	varchar(20)		NULL,
	nickname	varchar(20)		NULL,
	age	varchar(30)		NULL,
	email	varchar(30)		NULL,
	mPhone	varchar(30)		NULL
);

CREATE TABLE Pension (
	p_Id	varchar(10)		NOT NULL,
	pName	varchar(30)		NULL,
	Addr	varchar(50)		NULL,
	price	number		NULL,
	openHour	varchar(50)		NULL,
	ParkYN	varchar(10)		NULL,
	checkYN	varchar(1)		NULL,
	m_Id	varchar(10)		NOT NULL
);

CREATE TABLE Hospital (
	h_Id	varchar(10)		NOT NULL,
	pName	varchar(30)		NULL,
	Addr	varchar(100)		NULL,
	openHour	varchar(100)		NULL,
	parkYN	varchar(10)		NULL,
	checkYN	varchar(1)		NULL,
	m_Id	varchar(10)		NOT NULL
);

CREATE TABLE P_res (
	pr_Id	varchar(10)		NOT NULL,
	startDate	date		NULL,
	endDate	date		NULL,
	pr_Pay	varchar(20)		NULL,
	period	number		NULL,
	pName	varchar(30)		NULL,
	p_Id	varchar(10)		NOT NULL
);

CREATE TABLE H_res (
	hr_Id	varchar(10)		NOT NULL,
	r_Date	date		NULL,
	hr_Pay	varchar(20)		NULL,
	hName	varchar(30)		NULL,
	h_Id	varchar(10)		NOT NULL
);

CREATE TABLE Reply (
	r_Id	varchar(10)		NOT NULL,
	reply	varchar(100)		NULL,
	replyer	varchar(30)		NULL,
	regitDate	date		NULL,
	bno	number(10,0)		NOT NULL
);

CREATE TABLE Board (
	bno	number(10,0)		NOT NULL,
	title	varchar(30)		NULL,
	content	varchar(2000)		NULL,
	writer	varchar(20)		NULL,
	regdate	date	DEFAULT sysdate	NULL,
	updateDate	date		NULL,
	visitcount	number		NULL,
	likecount	number		NULL,
	m_Id	varchar(10)		NOT NULL
);

CREATE TABLE P_img (
	PI_Id	varchar(10)		NOT NULL,
	uploadpath	varchar(50)		NULL,
	fileName	varchar(30)		NULL,
	fileType	char(10)		NULL,
	p_Id	varchar(10)		NOT NULL
);

CREATE TABLE F_img (
	uploadpath	varchar(50)		NULL,
	fileName	varchar(30)		NULL,
	fileType	varchar(10)		NULL,
	m_Id	varchar(10)		NOT NULL
);

CREATE TABLE H_review (
	hr_no	varchar(10)		NOT NULL,
	review	varchar(500)		NULL,
	replyer	varchar(20)		NULL,
	regitDate	date		NULL,
	star	number		NULL,
	h_Id	varchar(10)		NOT NULL
);

CREATE TABLE R_img (
	RI_Id	varchar(10)		NOT NULL,
	uploadpath	varchar(50)		NULL,
	fileName	varchar(30)		NULL,
	fileType	char(10)		NULL,
	p_Id	varchar(10)		NOT NULL
);

CREATE TABLE P_review (
	pr_no	varchar(10)		NOT NULL,
	review	varchar(50)		NULL,
	replyer	varchar(20)		NULL,
	regitDate	date		NULL,
	star	number		NULL,
	p_Id	varchar(10)		NOT NULL
);

CREATE TABLE B_img (
	uploadpath	varchar(50)		NULL,
	fileName	varchar(30)		NULL,
	fileType	varchar(10)		NULL,
	bno	number(10,0)		NOT NULL
);

ALTER TABLE Member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	m_Id
);

ALTER TABLE Pension ADD CONSTRAINT PK_PENSION PRIMARY KEY (
	p_Id
);

ALTER TABLE Hospital ADD CONSTRAINT PK_HOSPITAL PRIMARY KEY (
	h_Id
);

ALTER TABLE P_res ADD CONSTRAINT PK_P_RES PRIMARY KEY (
	pr_Id
);

ALTER TABLE H_res ADD CONSTRAINT PK_H_RES PRIMARY KEY (
	hr_Id
);

ALTER TABLE Reply ADD CONSTRAINT PK_REPLY PRIMARY KEY (
	r_Id
);

ALTER TABLE Board ADD CONSTRAINT PK_BOARD PRIMARY KEY (
	bno
);

ALTER TABLE P_img ADD CONSTRAINT PK_P_IMG PRIMARY KEY (
	PI_Id
);

ALTER TABLE H_review ADD CONSTRAINT PK_H_REVIEW PRIMARY KEY (
	hr_no
);

ALTER TABLE R_img ADD CONSTRAINT PK_R_IMG PRIMARY KEY (
	RI_Id
);

ALTER TABLE P_review ADD CONSTRAINT PK_P_REVIEW PRIMARY KEY (
	pr_no
);

ALTER TABLE Pension ADD CONSTRAINT FK_Member_TO_Pension_1 FOREIGN KEY (
	m_Id
)
REFERENCES Member (
	m_Id
);

ALTER TABLE Hospital ADD CONSTRAINT FK_Member_TO_Hospital_1 FOREIGN KEY (
	m_Id
)
REFERENCES Member (
	m_Id
);

ALTER TABLE P_res ADD CONSTRAINT FK_Pension_TO_P_res_1 FOREIGN KEY (
	p_Id
)
REFERENCES Pension (
	p_Id
);

ALTER TABLE H_res ADD CONSTRAINT FK_Hospital_TO_H_res_1 FOREIGN KEY (
	h_Id
)
REFERENCES Hospital (
	h_Id
);

ALTER TABLE Reply ADD CONSTRAINT FK_Board_TO_Reply_1 FOREIGN KEY (
	bno
)
REFERENCES Board (
	bno
);

ALTER TABLE Board ADD CONSTRAINT FK_Member_TO_Board_1 FOREIGN KEY (
	m_Id
)
REFERENCES Member (
	m_Id
);

ALTER TABLE P_img ADD CONSTRAINT FK_Pension_TO_P_img_1 FOREIGN KEY (
	p_Id
)
REFERENCES Pension (
	p_Id
);

ALTER TABLE F_img ADD CONSTRAINT FK_Member_TO_F_img_1 FOREIGN KEY (
	m_Id
)
REFERENCES Member (
	m_Id
);

ALTER TABLE H_review ADD CONSTRAINT FK_Hospital_TO_H_review_1 FOREIGN KEY (
	h_Id
)
REFERENCES Hospital (
	h_Id
);

ALTER TABLE R_img ADD CONSTRAINT FK_Pension_TO_R_img_1 FOREIGN KEY (
	p_Id
)
REFERENCES Pension (
	p_Id
);

ALTER TABLE P_review ADD CONSTRAINT FK_Pension_TO_P_review_1 FOREIGN KEY (
	p_Id
)
REFERENCES Pension (
	p_Id
);

ALTER TABLE B_img ADD CONSTRAINT FK_Board_TO_B_img_1 FOREIGN KEY (
	bno
)
REFERENCES Board (
	bno
);

create sequence seq_board;

create sequence seq_member;


select bno,title,content,writer,visitcount,DECODE(TRUNC(sysdate), TRUNC(regdate), TO_CHAR(regdate, 'HH24:MI:SS'), TO_CHAR(regdate, 'YYYY-MM-DD')) AS regdate, updatedate 
	from board
	order by bno desc ;


insert into board (bno, title, content, m_id) values (seq_board.nextval,'우리강아지','귀엽죠?','m_00002');
insert into board (bno, title, content, m_id) values (seq_board.nextval,'사료 나눔 해주실분?','사료가 다 떨어졌어요','m_00003');
insert into board (bno, title, content, m_id) values (seq_board.nextval,'시바견 키우시는분 있나요..','너무 힘드네요','m_00004');
insert into board (bno, title, content, m_id) values (seq_board.nextval,'강아지 교육시키는법','어케하나요','m_00005');


-- M_ID, ID, PW, MNAME, NICKNAME, AGE, EMAIL, MPHONE 컬럼을 가지는 member 테이블이 있다고 가정합니다.

-- 더미 데이터 5개를 삽입합니다.

-- LPAD 함수를 사용하여 m_00001 형태의 회원번호를 생성하고 더미 데이터를 삽입합니다.
INSERT INTO member (M_ID, ID, PW, MNAME, NICKNAME, AGE, EMAIL, MPHONE)
VALUES ('m_' || LPAD(seq_member.NEXTVAL, 5, '0'), 'user1', '1234', '김진규', '진규짱', 30, 'john.doe@example.com', '1234567890');

INSERT INTO member (M_ID, ID, PW, MNAME, NICKNAME, AGE, EMAIL, MPHONE)
VALUES ('m_' || LPAD(seq_member.NEXTVAL, 5, '0'), 'user2', '1234', '허윤빈', '윤빈짱', 25, 'jane.smith@example.com', '9876543210');

INSERT INTO member (M_ID, ID, PW, MNAME, NICKNAME, AGE, EMAIL, MPHONE)
VALUES ('m_' || LPAD(seq_member.NEXTVAL, 5, '0'), 'user3', '1234', '안태영', '태영짱', 35, 'michael.johnson@example.com', '5555555555');

INSERT INTO member (M_ID, ID, PW, MNAME, NICKNAME, AGE, EMAIL, MPHONE)
VALUES ('m_' || LPAD(seq_member.NEXTVAL, 5, '0'), 'user4', '1234', '김지아', '지아짱', 28, 'emily.brown@example.com', '1111111111');

INSERT INTO member (M_ID, ID, PW, MNAME, NICKNAME, AGE, EMAIL, MPHONE)
VALUES ('m_' || LPAD(seq_member.NEXTVAL, 5, '0'), 'user5', '1234', '김솔이', '솔이짱', 32, 'william.lee@example.com', '9999999999');

INSERT INTO member (M_ID, ID, PW, MNAME, NICKNAME, AGE, EMAIL, MPHONE)
VALUES ('m_' || LPAD(seq_member.NEXTVAL, 5, '0'), 'user6', '1234', '정승진', '승진짱', 32, 'tmdwlsaos@example.com', '9999999999');


create sequence seq_reply;
create sequence seq_file;


INSERT INTO reply (r_ID, reply,replyer, bno )
VALUES ('r_' || LPAD(seq_reply.NEXTVAL, 5, '0'), '리플테스트입니다', '진규짱', 5);


	select *
		from(
				select t.*, rownum rn
				from (
						SELECT 
						    r.r_id,
						    r.bno,
						    r.reply,
						    TO_CHAR(r.regitDate, 'yyyy-MM-dd') AS regitDate,
						    r.updateDate,
						    m.nickname
						FROM
						    reply r
						JOIN
						    board b ON r.bno = b.bno
						JOIN
						    member m ON b.m_Id = m.m_Id
						WHERE
						    r.bno = 5
						ORDER BY
						    r.r_id DESC
					 ) t
			)
	where rn between 1 and 5;
    
    
    
    select *
		from(
				select t.*, rownum rn
				from (
						SELECT 
						    r.r_id,
						    r.bno,
						    r.reply,
						    TO_CHAR(r.regitDate, 'yyyy-MM-dd') AS regitDate,
						    r.updateDate,
						    m.nickname
						FROM
						    reply r
						JOIN
						    board b ON r.bno = b.bno
						JOIN
						    member m ON b.m_Id = m.m_Id
						WHERE
						    r.bno = 5
						ORDER BY
						    r.r_id DESC

					 ) t
			)
	where rn between 1 and 5;
    
		insert into b_img (UUID, UPLOADPATH, FILENAME, FILETYPE, BNO,FNO) 
		values ('f','f','f','f','f',('f_' || LPAD(seq_file.NEXTVAL, 5, '0')));
        
        
        	insert into b_img (UUID, UPLOADPATH, FILENAME, FILETYPE, BNO) 
		values ('sdfsdf','sdfsdf','sdfsdf','i',26);
        
        
        		SELECT t.*,
		      'c:\upload\' || uploadpath || uuid || '_' || filename AS savePath,
		       DECODE(filetype, 'I', 'c:\upload\' || uploadpath || 's_' || uuid || '_' || filename, 'NO_image') AS s_savePath
		FROM b_img t
		WHERE bno = {bno};
        
        SELECT t.*,
		      'c:\upload\' || uploadpath || uuid || '_' || filename AS savePath,
		DECODE(filetype, 'I', 'c:\upload\' || uploadpath || 's_' || uuid || '_' || filename, 'NO_image') AS s_savePath
		FROM b_img t
		WHERE bno = 36;
        
        
        	 	SELECT 
		    b.bno,
		    b.title,
		    b.content,
		    b.m_id,
		    b.visitcount,
		    b.likecount,
		    DECODE(TRUNC(SYSDATE), TRUNC(b.regdate), TO_CHAR(b.regdate, 'HH24:MI:SS'), TO_CHAR(b.regdate, 'YYYY-MM-DD')) AS regdate,
		    b.updatedate,
		    m.nickname
		FROM 
		    board b
		LEFT JOIN 
		    member m ON b.m_id = m.M_ID
		WHERE bno=42
		ORDER BY 
		    b.bno DESC ;

