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




select bno,title,content,writer,visitcount,DECODE(TRUNC(sysdate), TRUNC(regdate), TO_CHAR(regdate, 'HH24:MI:SS'), TO_CHAR(regdate, 'YYYY-MM-DD')) AS regdate, updatedate 
	from board
	order by bno desc 
