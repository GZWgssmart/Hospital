CREATE DATABASE IF NOT EXISTS hospital DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

use hospital;

/*管理员表*/
DROP TABLE IF EXISTS t_admin;
create table t_admin(
  id int PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
  email VARCHAR(50) not null UNIQUE COMMENT '邮箱',
  pwd VARCHAR(30) not null COMMENT '密码',
  name VARCHAR(30) COMMENT '姓名',
  phone varchar(11) comment '手机号',
  created_time datetime comment '创建时间'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*用户表*/
DROP TABLE IF EXISTS t_user;
create table t_user(
  id int primary key auto_increment COMMENT '用户编号',
  name varchar(30) COMMENT '用户名称',
  pwd varchar(30) not null COMMENT '用户密码',
  phone varchar(11) COMMENT '手机号',
  created_time datetime COMMENT '创建时间'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*医院基本信息表*/
DROP TABLE IF EXISTS t_hospital;
create table t_hospital(
  id int primary key auto_increment COMMENT '医院编号',
  name VARCHAR(50) NOT NULL COMMENT '名字',
  level VARCHAR(30) COMMENT '等级',
  address	varchar(100) COMMENT '医院地址',
  tel_no varchar(12) COMMENT '电话',
  web_address	varchar(30) COMMENT '官方网站链接',
  bus_line	varchar(500) COMMENT '公交路线',
  longidute	double COMMENT '经度',
  laditude	double COMMENT '纬度',
  image varchar(500) COMMENT '平面图',
  des	text COMMENT '描述'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*医院科室表*/
DROP TABLE IF EXISTS t_department;
create table t_department(
  id int primary key auto_increment COMMENT '编号',
  name varchar(30) COMMENT '名称',
  address varchar(100) COMMENT '楼栋，楼层，房号',
  des varchar(500) COMMENT '描述'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*医院医生表*/
DROP TABLE IF EXISTS t_doctor;
create table t_doctor(
  id int primary key auto_increment COMMENT '编号',
  name varchar(30) COMMENT '姓名',
  major varchar(200) COMMENT '专长',
  dept_id int COMMENT '科室编号',
  des text COMMENT '描述'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table t_doctor ADD CONSTRAINT fk_doctor_dept_id FOREIGN KEY (dept_id) REFERENCES t_doctor(id);

/*新闻动态表*/
DROP TABLE IF EXISTS t_news;
create table t_news(
  id int primary key auto_increment COMMENT '编号',
  title VARCHAR(50) COMMENT '标题',
  admin_id int COMMENT '管理员编号',
  author VARCHAR(50) COMMENT '作者',
  content	text COMMENT '内容',
  pub_time datetime COMMENT '发布时间'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table t_news ADD CONSTRAINT fk_news_admin_id FOREIGN KEY (admin_id) REFERENCES t_admin(id);

/*系统消息表*/
DROP TABLE IF EXISTS t_message;
create table t_message(
  id int primary key auto_increment COMMENT '编号',
  title VARCHAR(50) COMMENT '标题',
  admin_id int COMMENT '管理员编号',
  author VARCHAR(50) COMMENT '作者',
  content	text COMMENT '内容',
  send_time datetime COMMENT '发送时间',
  user_id int COMMENT '接收人编号'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table t_message ADD CONSTRAINT fk_msg_user_id FOREIGN KEY (user_id) REFERENCES t_user(id);
alter table t_message ADD CONSTRAINT fk_msg_admin_id FOREIGN KEY (admin_id) REFERENCES t_admin(id);

/*文章类型表，包括服务指南，健康百科，体检流程，使用帮助等*/
DROP TABLE IF EXISTS t_article_type;
create table t_article_type(
  id int primary key auto_increment COMMENT '编号',
  name varchar(30) COMMENT '类型'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

insert into t_article_type(name) values('服务指南');
insert into t_article_type(name) values('健康百科');
insert into t_article_type(name) values('体检流程');
insert into t_article_type(name) values('体检套餐');
insert into t_article_type(name) values('使用帮助');

/*文章表*/
DROP TABLE IF EXISTS t_article;
create table t_article(
  id int primary key auto_increment COMMENT '编号',
  type_id int COMMENT '类型编号',
  title VARCHAR(50) COMMENT '标题',
  admin_id int COMMENT '管理员编号',
  author VARCHAR(50) COMMENT '作者',
  content text COMMENT '内容',
  pub_time datetime COMMENT '发布时间'
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table t_article ADD CONSTRAINT fk_article_type_id FOREIGN KEY (type_id) REFERENCES t_article_type(id);
alter table t_article ADD CONSTRAINT fk_article_admin_id FOREIGN KEY (admin_id) REFERENCES t_admin(id);



