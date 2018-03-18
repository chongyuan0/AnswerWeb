-- 创建数据库
drop database if exists answerWeb;
create database answerWeb;
use answerWeb;

drop table if exists options;
drop table if exists records;
drop table if exists question;
drop table if exists questiontype;
drop table if exists user;
drop table if exists admin;

-- 创建用户表
create table user(
	userno int auto_increment primary key, -- 自增主键id
	username varchar(20) UNIQUE KEY not null,	-- 用户名
	password varchar(40) not null,	-- 用户密码
	email varchar(50),	-- 用户邮箱
	sex varchar(2),		-- 用户性别
	status int default 0 -- 用户是否通过邮箱验证 , 0未通过, 1通过
);

-- 创建题目类型表
create table questiontype(
	typeno int auto_increment primary key,	-- 自增主键id
	typename varchar(30) not null,		-- 题目类型Id
	belongtypeno int,		-- 属于哪个题目类型id
	constraint fk_questiontype_belongtypeno foreign key(belongtypeno) 
		references questiontype(typeno) on delete cascade
);

-- 创建题目表
create table question(
	questionno int auto_increment primary key,	-- 自增主键id
	content varchar(200) not null,	-- 题目内容,可能是文本或链接
	description varchar(200),		-- 题目涉及知识描述,用于答题后, 文本或链接
	constatus int not null,	-- 内容类型, 1文本, 2图片, 3视频, 4音乐
	desstatus int,	-- 描述类型, 1文本, 2图片
	typeno int not null,		-- 题目类型id
	constraint fk_question_typeno foreign key(typeno)
		references questiontype(typeno) on delete cascade
);

-- 创建题目选项表
create table options(
	optionsno int auto_increment primary key, -- 自增主键id
	questionno int not null, -- 题目id
	content varchar(200) not null, -- 选项内容
	status int,	-- 选项对错, 1对 0错
	constraint fk_options_questionno foreign key(questionno)
		references question(questionno) on delete cascade
);

-- 创建记录表
create table records(
	recordsno int auto_increment primary key, -- 自增主键id
	userno int not null, -- 用户id
	typeno int not null, -- 类型id
	acnumber int default 0,	-- 答对题数
	erunmber int default 0, -- 答错题数
	constraint fk_records_userno foreign key(userno)
		references user(userno) on delete cascade,
	constraint fk_records_typeno foreign key(typeno)
		references questiontype(typeno) on delete cascade
);

-- 创建管理员表
create table admins(
	adminid int auto_increment primary key, -- 自增主键id
	adminname varchar(30) not null,	-- 管理员名称
	password varchar(40) not null,	-- 管理员密码
	adminflag int default 1	-- 管理员权限, 1普通 2超级
);

-- 插入数据
insert into user(username,password,email,sex,status) values('yuan','yuan','123','男',1);

