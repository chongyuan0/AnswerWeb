-- �������ݿ�
drop database if exists answerWeb;
create database answerWeb;
use answerWeb;

-- �����û���
create table user(
	userno int auto_increment primary key, --��������id
	username varchar(20) not null,	--�û���
	password varchar(40) not null,	--�û�����
	email varchar(50),	--�û�����
	sex varchar(2),		--�û��Ա�
	status int 			--�û��Ƿ�ͨ��������֤ , 0δͨ��, 1ͨ��
);

-- ������Ŀ���ͱ�
create table questiontype(
	typeno int auto_increment primary key,	-- ��������id
	typename varchar(30) not null,		-- ��Ŀ����Id
	belongtypeno int,		-- �����ĸ���Ŀ����id
	constraint fk_questiontype_belongtypeno foreign key(belongtypeno) 
		references questiontype(typeno)
);

-- ������Ŀ��
create table question(
	questionno int auto_increment primary key,	-- ��������id
	content varchar(200) not null,	-- ��Ŀ����,�������ı�������
	description varchar(200),		-- ��Ŀ�漰֪ʶ����,���ڴ����, �ı�������
	constatus int not null,	-- ��������, 1�ı�, 2ͼƬ, 3��Ƶ, 4����
	desstatus int,	-- ��������, 1�ı�, 2ͼƬ
	typeno int not null,		-- ��Ŀ����id
	constraint fk_question_typeno foreign key(typeno)
		references questiontype(typeno)
);

-- ������Ŀѡ���
create table options(
	optionsno int auto_increment primary key, -- ��������id
	questionno int not null, -- ��Ŀid
	content varchar(200) not null, -- ѡ������
	status int,	-- ѡ��Դ�, 1�� 0��
	constraint fk_options_questionno foreign key(questionno)
		references question(questionno)
);

-- ������¼��
create table records(
	recordsno int auto_increment primary key, -- ��������id
	userno int not null, -- �û�id
	typeno int not null, -- ����id
	acnumber int default 0,	-- �������
	erunmber int default 0, -- �������
	constraint fk_records_userno foreign key(userno)
		references user(userno),
	constraint fk_records_typeno foreign key(typeno)
		references questiontype(typeno)
);

-- ��������Ա��
create table admins(
	adminid int auto_increment primary key, -- ��������id
	adminname varchar(30) not null,	-- ����Ա����
	password varchar(40) not null,	-- ����Ա����
	adminflag int	-- ����ԱȨ��, 1��ͨ 2����
);

-- ��������
insert into user(username,password,email,sex,status) values('yuan','yuan','123','��',1);

