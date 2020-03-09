-- Admin account
INSERT INTO `notecommerce_db`.`users` (`usr_id`, `usr_email`, `usr_password`, `usr_role`) VALUES ('1', 'admin@admin.com', 'admin', 'admin');

-- Customer account
INSERT INTO `notecommerce_db`.`users` (`usr_id`, `usr_email`, `usr_password`, `usr_role`) VALUES ('2', 'client@client.com', 'client', 'client');
INSERT INTO `notecommerce_db`.`customers` (`cus_id`, `cus_name`, `cus_cpf`, `cus_date_of_birth`, `cus_phone`, `cus_gender`, `cus_usr_id`) VALUES ('1', 'Cliente de Teste', '44404019025', '1999-05-20', '(21) 12345-6789', 'male', '2');

-- Brands
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('1', 'Acer');
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('2', 'Asus');
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('3', 'Dell');
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('4', 'Hp');
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('5', 'Lenovo');
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('6', 'Positivo');
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('7', 'Samsung');

-- Products
