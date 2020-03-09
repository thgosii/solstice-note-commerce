drop database if exists notecommerce_db;
create database if not exists notecommerce_db;

drop user if exists notecommerce_user@localhost;
create user if not exists notecommerce_user@localhost identified by 'notecommerce_password';
grant all privileges on notecommerce_db.* to notecommerce_user@localhost;

use notecommerce_db;

create table if not exists users(
	usr_id int auto_increment not null,
    usr_email varchar(255),
    usr_password varchar(255),
    usr_role varchar(255),
    usr_deleted boolean default false,
	primary key (usr_id)
);

create table if not exists customers(
	cus_id int auto_increment not null,
    cus_name varchar(255),
    cus_cpf varchar(255),
    cus_date_of_birth date,
    cus_phone varchar(255),
    cus_gender varchar(255),
    cus_usr_id int,
    cus_deleted boolean default false,
    primary key (cus_id),
    foreign key (cus_usr_id) references users(usr_id)
);

create table if not exists brands(
	brd_id int auto_increment not null,
    brd_name varchar(255),
    brd_deleted boolean default false,
    primary key (brd_id)
);

create table if not exists products(
	prd_id int auto_increment not null,
    prd_title varchar(255),
    prd_image_url varchar(255),
    prd_price double,
    prd_description text,
    prd_brd_id int,
    prd_processor varchar(255),
    prd_graphics_card varchar(255),
    prd_ram int,
	prd_monitor varchar(255),
    prd_hd int,
    prd_ssd int,
    prd_os varchar(255),
    prd_deleted boolean default false,
    primary key (prd_id),
    foreign key (prd_brd_id) references brands(brd_id)
);