drop database if exists notecommerce_db;
create database if not exists notecommerce_db;

drop user if exists notecommerce_user@localhost;
create user if not exists notecommerce_user@localhost identified by 'noteCommerce_password1';
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
    cus_balance double,
    cus_usr_id int,
    cus_deleted boolean default false,
    primary key (cus_id),
    foreign key (cus_usr_id) references users(usr_id)
);

create table if not exists credit_cards(
	crd_id int auto_increment not null,
	crd_number varchar(255),
	crd_printed_name varchar(255),
	crd_security_code varchar(255),
	crd_cus_id int,
	crd_deleted boolean default false,
	primary key (crd_id),
	foreign key (crd_cus_id) references customers(cus_id)
);

create table if not exists adresses(
	ads_id int auto_increment not null,
    ads_cep varchar(255),
    ads_public_place varchar(255),
    ads_number varchar(255),
    ads_complement varchar(255),
	ads_neighbourhood varchar(255),
    ads_city varchar(255),
    ads_state varchar(255),
    ads_type varchar(255),
    ads_cus_id int,
    ads_deleted boolean default false,
    primary key (ads_id),
    foreign key (ads_cus_id) references customers(cus_id)
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
    prd_image_url mediumtext,
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

create table if not exists sales(
	sal_id int auto_increment not null,
	sal_date_time datetime,
    sal_balance_usage double,
    sal_ads_id int,
    sal_cus_id int,
    sal_status varchar(255),
    sal_identify_number varchar(255),
	primary key (sal_id),
    foreign key (sal_cus_id) references customers(cus_id),
    foreign key (sal_ads_id) references adresses(ads_id)
);

create table if not exists sales_credit_cards(
	scc_sal_id int,
	scc_crd_id int,
	scc_value double,
	primary key (scc_sal_id, scc_crd_id),
	foreign key (scc_sal_id) references sales(sal_id),
	foreign key (scc_crd_id) references credit_cards(crd_id)
);

create table if not exists sales_products(
    sap_sal_id int,
    sap_prd_id int,
    sap_quantity int,
    sap_subtotal double,
    primary key (sap_prd_id, sap_sal_id),
    foreign key (sap_prd_id) references products(prd_id),
    foreign key (sap_sal_id) references sales(sal_id)
);

create table if not exists trades(
	trd_id int auto_increment not null,
	trd_tracking_number varchar(50) not null,
	trd_request_date datetime not null,
	trd_type varchar(50) not null,
	trd_status varchar(50) not null,
	trd_quantity int not null,
    trd_sal_id int not null,
    trd_prd_id int not null,
    trd_deleted boolean default false,
    primary key (trd_id),
    foreign key (trd_sal_id) references sales(sal_id),
    foreign key (trd_prd_id) references products(prd_id)
);
