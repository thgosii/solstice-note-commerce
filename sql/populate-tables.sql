-- Admin account
INSERT INTO `notecommerce_db`.`users` (`usr_id`,`usr_email`,`usr_password`,`usr_role`,`usr_deleted`) VALUES (1,'admin@admin.com','1ED165F7E19BFB8AF429D5BF887C9D58','admin',0); -- Admin@123



-- Customer accounts
INSERT INTO `notecommerce_db`.`users` (`usr_id`,`usr_email`,`usr_password`,`usr_role`,`usr_deleted`) VALUES (2,'client@client.com','8B3E0C1BD7D07458888E214FFA3C4959','client',0); -- Client@123
INSERT INTO `notecommerce_db`.`users` (`usr_id`,`usr_email`,`usr_password`,`usr_role`,`usr_deleted`) VALUES (3,'cliente2@teste.com.br','A84E52042E0A704405CD09D54A97F18E','client',0); -- clienteteste!2
INSERT INTO `notecommerce_db`.`users` (`usr_id`,`usr_email`,`usr_password`,`usr_role`,`usr_deleted`) VALUES (4,'cliente3@teste.com.br','714EF6749C9766EC5D1DD7B55FB8B7CA','client',0); -- clienteteste!3
INSERT INTO `notecommerce_db`.`users` (`usr_id`,`usr_email`,`usr_password`,`usr_role`,`usr_deleted`) VALUES (5,'cliente4@teste.com.br','213C55D95F1CA82474D72CE708DD0C55','client',0); -- clienteteste!4
INSERT INTO `notecommerce_db`.`users` (`usr_id`,`usr_email`,`usr_password`,`usr_role`,`usr_deleted`) VALUES (6,'cliente5@teste.com.br','6B571AB1A9E61BD9F590736BF7F325C5','client',0); -- ...
INSERT INTO `notecommerce_db`.`users` (`usr_id`,`usr_email`,`usr_password`,`usr_role`,`usr_deleted`) VALUES (7,'cliente6@teste.com.br','8B2C8F073880416BA12A3C356A575E5C','client',0);
INSERT INTO `notecommerce_db`.`users` (`usr_id`,`usr_email`,`usr_password`,`usr_role`,`usr_deleted`) VALUES (8,'cliente7@teste.com.br','2753B35A29A615BC77B149F9A4613860','client',0);
INSERT INTO `notecommerce_db`.`users` (`usr_id`,`usr_email`,`usr_password`,`usr_role`,`usr_deleted`) VALUES (9,'cliente8@teste.com.br','04DF1317DD85006BA3F847F8163EFA2E','client',0);
INSERT INTO `notecommerce_db`.`users` (`usr_id`,`usr_email`,`usr_password`,`usr_role`,`usr_deleted`) VALUES (10,'cliente9@teste.com.br','DD0ED5A4E9F7E7F4DAD2F15A664F331A','client',0);
INSERT INTO `notecommerce_db`.`users` (`usr_id`,`usr_email`,`usr_password`,`usr_role`,`usr_deleted`) VALUES (11,'cliente10@teste.com.br','BCE10CCF4148E2AE8058768ABA9ACCE0','client',0);

INSERT INTO `notecommerce_db`.`customers` (`cus_id`,`cus_name`,`cus_cpf`,`cus_date_of_birth`,`cus_phone`,`cus_gender`,`cus_balance`,`cus_usr_id`,`cus_deleted`) VALUES (1,'Cliente de Teste','44404019025','1999-05-20','(21) 12345-6789','male',NULL,2,0);
INSERT INTO `notecommerce_db`.`customers` (`cus_id`,`cus_name`,`cus_cpf`,`cus_date_of_birth`,`cus_phone`,`cus_gender`,`cus_balance`,`cus_usr_id`,`cus_deleted`) VALUES (2,'Segundo cliente de teste','24275992040','2000-10-23','(11) 12345-6789','female',NULL,3,0);
INSERT INTO `notecommerce_db`.`customers` (`cus_id`,`cus_name`,`cus_cpf`,`cus_date_of_birth`,`cus_phone`,`cus_gender`,`cus_balance`,`cus_usr_id`,`cus_deleted`) VALUES (3,'Cliente de Teste 3','24275992040','2000-10-23','(11) 12345-6789','male',NULL,4,0);
INSERT INTO `notecommerce_db`.`customers` (`cus_id`,`cus_name`,`cus_cpf`,`cus_date_of_birth`,`cus_phone`,`cus_gender`,`cus_balance`,`cus_usr_id`,`cus_deleted`) VALUES (4,'Cliente de Teste 4','24275992040','2001-10-23','(11) 12345-6789','female',NULL,5,0);
INSERT INTO `notecommerce_db`.`customers` (`cus_id`,`cus_name`,`cus_cpf`,`cus_date_of_birth`,`cus_phone`,`cus_gender`,`cus_balance`,`cus_usr_id`,`cus_deleted`) VALUES (5,'Cliente de Teste 5','24275992040','1990-11-23','(11) 12345-6789','female',NULL,6,0);
INSERT INTO `notecommerce_db`.`customers` (`cus_id`,`cus_name`,`cus_cpf`,`cus_date_of_birth`,`cus_phone`,`cus_gender`,`cus_balance`,`cus_usr_id`,`cus_deleted`) VALUES (6,'Cliente de Teste 6','24275992040','2005-10-23','(11) 12345-6789','male',NULL,7,0);
INSERT INTO `notecommerce_db`.`customers` (`cus_id`,`cus_name`,`cus_cpf`,`cus_date_of_birth`,`cus_phone`,`cus_gender`,`cus_balance`,`cus_usr_id`,`cus_deleted`) VALUES (7,'Cliente de Teste 7','24275992040','2007-01-23','(11) 12345-6789','male',NULL,8,0);
INSERT INTO `notecommerce_db`.`customers` (`cus_id`,`cus_name`,`cus_cpf`,`cus_date_of_birth`,`cus_phone`,`cus_gender`,`cus_balance`,`cus_usr_id`,`cus_deleted`) VALUES (8,'Cliente de Teste 8','24275992040','2002-03-23','(11) 12345-6789','male',NULL,9,0);
INSERT INTO `notecommerce_db`.`customers` (`cus_id`,`cus_name`,`cus_cpf`,`cus_date_of_birth`,`cus_phone`,`cus_gender`,`cus_balance`,`cus_usr_id`,`cus_deleted`) VALUES (9,'Cliente de Teste 9','24275992040','2002-10-01','(11) 12345-6789','female',NULL,10,0);
INSERT INTO `notecommerce_db`.`customers` (`cus_id`,`cus_name`,`cus_cpf`,`cus_date_of_birth`,`cus_phone`,`cus_gender`,`cus_balance`,`cus_usr_id`,`cus_deleted`) VALUES (10,'Cliente de Teste 10','24275992040','1995-01-01','(11) 12345-6789','male',NULL,11,0);



-- Customers addresses
INSERT INTO `notecommerce_db`.`adresses` (`ads_id`,`ads_cep`,`ads_public_place`,`ads_number`,`ads_complement`,`ads_neighbourhood`,`ads_city`,`ads_state`,`ads_type`,`ads_cus_id`,`ads_deleted`) VALUES (10,'69921-539','Rua da Esperança','73','subsolo','Montanhês','Rio Branco','AC','shipping_and_billing',1,0);
INSERT INTO `notecommerce_db`.`adresses` (`ads_id`,`ads_cep`,`ads_public_place`,`ads_number`,`ads_complement`,`ads_neighbourhood`,`ads_city`,`ads_state`,`ads_type`,`ads_cus_id`,`ads_deleted`) VALUES (1,'87501-655','Rua Nova Aliança','12345','Fundos','Jardim Maria Lúcia','Umuarama','PR','shipping_and_billing',2,0);
INSERT INTO `notecommerce_db`.`adresses` (`ads_id`,`ads_cep`,`ads_public_place`,`ads_number`,`ads_complement`,`ads_neighbourhood`,`ads_city`,`ads_state`,`ads_type`,`ads_cus_id`,`ads_deleted`) VALUES (2,'77427-000','Avenida B','8','','Residencial Jardim América','Gurupi','TO','shipping',3,0);
INSERT INTO `notecommerce_db`.`adresses` (`ads_id`,`ads_cep`,`ads_public_place`,`ads_number`,`ads_complement`,`ads_neighbourhood`,`ads_city`,`ads_state`,`ads_type`,`ads_cus_id`,`ads_deleted`) VALUES (11,'68905-670','Rua Cândido Mendes','67','','Perpétuo Socorro','Macapá','AP','billing',3,0);
INSERT INTO `notecommerce_db`.`adresses` (`ads_id`,`ads_cep`,`ads_public_place`,`ads_number`,`ads_complement`,`ads_neighbourhood`,`ads_city`,`ads_state`,`ads_type`,`ads_cus_id`,`ads_deleted`) VALUES (3,'29222-100','Rua Turmalina','1000','','Setiba','Guarapari','ES','shipping_and_billing',4,0);
INSERT INTO `notecommerce_db`.`adresses` (`ads_id`,`ads_cep`,`ads_public_place`,`ads_number`,`ads_complement`,`ads_neighbourhood`,`ads_city`,`ads_state`,`ads_type`,`ads_cus_id`,`ads_deleted`) VALUES (4,'59615-600','Rua Alcindo Falcão','78','portão B','Santa Delmira','Mossoró','RN','shipping_and_billing',5,0);
INSERT INTO `notecommerce_db`.`adresses` (`ads_id`,`ads_cep`,`ads_public_place`,`ads_number`,`ads_complement`,`ads_neighbourhood`,`ads_city`,`ads_state`,`ads_type`,`ads_cus_id`,`ads_deleted`) VALUES (5,'49009-073','Rua José Domingos Maia III','12','','Zona de Expansão (Mosqueiro)','Aracaju','SE','shipping_and_billing',6,0);
INSERT INTO `notecommerce_db`.`adresses` (`ads_id`,`ads_cep`,`ads_public_place`,`ads_number`,`ads_complement`,`ads_neighbourhood`,`ads_city`,`ads_state`,`ads_type`,`ads_cus_id`,`ads_deleted`) VALUES (6,'95033-350','Estrada Municipal David Milani','6346','','Monte Bérico','Caxias do Sul','RS','shipping_and_billing',7,0);
INSERT INTO `notecommerce_db`.`adresses` (`ads_id`,`ads_cep`,`ads_public_place`,`ads_number`,`ads_complement`,`ads_neighbourhood`,`ads_city`,`ads_state`,`ads_type`,`ads_cus_id`,`ads_deleted`) VALUES (7,'79010-140','Rua Doutor Dolor Ferreira de Andrade','1','','Monte Castelo','Campo Grande','MS','shipping_and_billing',8,0);
INSERT INTO `notecommerce_db`.`adresses` (`ads_id`,`ads_cep`,`ads_public_place`,`ads_number`,`ads_complement`,`ads_neighbourhood`,`ads_city`,`ads_state`,`ads_type`,`ads_cus_id`,`ads_deleted`) VALUES (8,'76812-592','Rua Cruzeiro','331','ap 23','Três Marias','Porto Velho','RO','shipping_and_billing',9,0);
INSERT INTO `notecommerce_db`.`adresses` (`ads_id`,`ads_cep`,`ads_public_place`,`ads_number`,`ads_complement`,`ads_neighbourhood`,`ads_city`,`ads_state`,`ads_type`,`ads_cus_id`,`ads_deleted`) VALUES (9,'69915-112','Rua Montreal','4','','Conjunto Esperança','Rio Branco','AC','shipping_and_billing',10,0);



-- Customers credit cards
INSERT INTO `notecommerce_db`.`credit_cards` (`crd_id`,`crd_number`,`crd_printed_name`,`crd_security_code`,`crd_cus_id`,`crd_deleted`) VALUES (1,'4916559042822551','Cartão de Teste Visa','659',1,0);
INSERT INTO `notecommerce_db`.`credit_cards` (`crd_id`,`crd_number`,`crd_printed_name`,`crd_security_code`,`crd_cus_id`,`crd_deleted`) VALUES (2,'4485283312422825','JOÃO DA SILVA','321',2,0);
INSERT INTO `notecommerce_db`.`credit_cards` (`crd_id`,`crd_number`,`crd_printed_name`,`crd_security_code`,`crd_cus_id`,`crd_deleted`) VALUES (3,'5251465567765987','Vesaodir','820',3,0);
INSERT INTO `notecommerce_db`.`credit_cards` (`crd_id`,`crd_number`,`crd_printed_name`,`crd_security_code`,`crd_cus_id`,`crd_deleted`) VALUES (4,'5543849773514305','Kesyothen','638',4,0);
INSERT INTO `notecommerce_db`.`credit_cards` (`crd_id`,`crd_number`,`crd_printed_name`,`crd_security_code`,`crd_cus_id`,`crd_deleted`) VALUES (5,'4539286124457661','Gouarn Ispe','335',5,0);
INSERT INTO `notecommerce_db`.`credit_cards` (`crd_id`,`crd_number`,`crd_printed_name`,`crd_security_code`,`crd_cus_id`,`crd_deleted`) VALUES (6,'4987654321234567','CLIENTE TESTE','123',6,0);
INSERT INTO `notecommerce_db`.`credit_cards` (`crd_id`,`crd_number`,`crd_printed_name`,`crd_security_code`,`crd_cus_id`,`crd_deleted`) VALUES (7,'4916559042822551','Cartão de Teste Visa','659',7,0);
INSERT INTO `notecommerce_db`.`credit_cards` (`crd_id`,`crd_number`,`crd_printed_name`,`crd_security_code`,`crd_cus_id`,`crd_deleted`) VALUES (8,'4485283312422825','NOME IMPRESSO 321','321',8,0);
INSERT INTO `notecommerce_db`.`credit_cards` (`crd_id`,`crd_number`,`crd_printed_name`,`crd_security_code`,`crd_cus_id`,`crd_deleted`) VALUES (9,'5251465567765987','Vesaodir','820',9,0);
INSERT INTO `notecommerce_db`.`credit_cards` (`crd_id`,`crd_number`,`crd_printed_name`,`crd_security_code`,`crd_cus_id`,`crd_deleted`) VALUES (10,'5543849773514305','Kesyothen','638',10,0);
INSERT INTO `notecommerce_db`.`credit_cards` (`crd_id`,`crd_number`,`crd_printed_name`,`crd_security_code`,`crd_cus_id`,`crd_deleted`) VALUES (12,'4987654321234567','TESTE TESTE 2','123',3,0);



-- Product brands
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('1', 'Acer');
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('2', 'Asus');
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('3', 'Dell');
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('4', 'Hp');
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('5', 'Lenovo');
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('6', 'Positivo');
INSERT INTO `notecommerce_db`.`brands` (`brd_id`, `brd_name`) VALUES ('7', 'Samsung');



-- Products
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (1,'Notebook Lenovo Ideapad S145-15IWL Intel Core i5 - 8GB 1TB 15,6" Windows 10','/note-commerce/static/custom/general/img/products/default_laptop_01.jfif',2399.1,'O notebook Lenovo S145-15IWL Ideapad S145 é compacto e sofisticado. A tela HD de 15.6\" é antirreflexo e as bordas ultrafinas do notebook permitem uma tela infinita, para você ter um notebook com design muito mais elegante. O modelo vem equipado com placa de Vídeo integrada Intel UHD Graphics 620, que resulta em mais agilidade e performance para a edição de fotos e vídeos. Desempenho de ponta com processador Intel Core i5-8265U; memória RAM de 8GB; capacidade do HD de 1TB, além do sistema operacional Windows 10 home assegura um notebook de alta tecnologia. Alto falantes com certificação Dolby Áudio garantem som alto e definido. Conte com o WiFi AC ultrarrápido para mais velocidade de navegação, e também com conexões como 02 USB 3.1, 01 USB 2.0, 01 Porta combo para Headset/Smartphone e 01 HDMI. ',1,'Intel Core i5','Intel UHD Graphics 620',8,'15.6',1,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (3,'Notebook Essentials E30 Intel Core I3 4GB 1TB LED Full HD 15.6\'\' W10 - Samsung','/note-commerce/static/custom/general/img/products/default_laptop_02.jfif',1899.04,'Notebooks versáteis, perfeitos para executar tarefas do dia a dia, fazer trabalhos escolares, navegar na internet e tudo mais que você e sua família quiser ou precisar.\r\n\r\nVocê pode substituir a memória e a capacidade de armazenamento do seu notebook, de forma prática e rápida! Mais espaço para suas fotos, vídeos e documentos, e mais agilidade para executar as tarefas.\r\n\r\nCom a tela de altíssima qualidade, seus trabalhos são exibidos com excelente definição de imagem e podem ser apreciados nos mínimos detalhes.\r\n\r\nHá assuntos que exigem um pouco mais de privacidade . Com um simples comando, deixe a imagem da sua tela escurecida ou semitransparente e tenha toda a liberdade de trabalhar nos seus documentos e informações confidenciais.\r\n\r\nÉ muito fácil bloquear a ativação da webcam e do microfone do seu notebook Essentials. Você pode desligar esses recursos tocando em apenas uma tecla e eles só serão habilitados novamente quando você quiser.\r\n\r\nA Samsung fabrica a maioria dos componentes dos notebooks. Isso significa que sua família receberá um aparelho com cada pedacinho testado exaustivamente para garantir a credibilidade que é marca registrada dos produtos Samsung.\r\n\r\nNada de dúvidas sem respostas e problemas sem soluções. Com o S-Service, você conversa com o suporte técnico especializado Samsung pelo computador2 ou telefone, em tempo real, na hora que precisar3.',7,'Intel® Core™ i3 7020U','Intel® HD Graphics 620 Integrada',4,'15.6',1,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (4,'Notebook Gamer Acer Intel Core i5-8300H 8GB 1TB+128SSD NVIDIA GeForce GTX 105015,6\" Windows 10 AN515-52-54AM','/note-commerce/static/custom/general/img/products/default_laptop_03.png',3704.05,'Imagem meramente ilustrativa  \r\nTodas as informações divulgadas são de responsabilidade do fabricante/fornecedor  ',1,'Intel Core i5','NVIDIA® GeForce® GTX 1050 com 4 GB de memória dedicada GDDR5',8,'15.6',128,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (5,'Notebook Acer, Intel® Core™ i5 8265U, 8GB, 1TB +128SSD , NVIDIA® GeForce® MX130 com 2GB, Aspire 5, Prata - A515-52G-50NT ','/note-commerce/static/custom/general/img/products/default_laptop_04.png',3179,'Com Processador Intel® Core™ i5-8265U Quad Core 8ª Geração, GPU NVidia GeForce MX130 com 2 GB GDDR5 de memória dedicada, Teclado em português do Brasil padrão ABNT 2 e Bateria com duração de até 7 horas*.',1,'8ª geração do Processador Intel® Core™ i5 8265U','NVIDIA® GeForce® MX130 2GB GDDR5 VRAM dedicada',8,'15.6',1000,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (6,'Notebook Lenovo Ideapad S145 R5 8GB 1TB W10 15.6 Prata','/note-commerce/static/custom/general/img/products/default_laptop_05.jfif',2399,'Notebook Lenovo Ultrafino ideapad S145 Ryzen 5-3500U 8GB 1TB W10 15.6\" Dolby Audio Design Leve e Compacto 81V70004BR Prata',5,'AMD Quad Core','Integrada AMD Radeon™ RX Vega 8',9,'15.6',1,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (7,'Notebook Samsung Expert X30 8ª Intel Core I5 8GB 1TB LED HD 15,6\" Windows 10 - Branco','/note-commerce/static/custom/general/img/products/default_laptop_06.jfif',2232.49,'Tecnologia na velocidade das suas ideias.',7,'Intel® Core™ i5 8265U','Intel® UHD Graphics 620 Integrada',8,'15.6',1,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (8,'Notebook Asus Vivobook X512FJ-EJ227T 8ª Intel Core i7 8GB (Geforce MX230 com 2GB) 1TB Tela 15,6\" Windows10 - Cinza','/note-commerce/static/custom/general/img/products/default_laptop_07.jfif',3851.57,'Seja para trabalhar ou para se divertir, ASUS VivoBook 15 é o notebook ideal para se concentrar. Tela quase sem bordas, ergonômico e eficiente, compacto, fino e leve. ASUS VivoBook 15 tem muita tela, mas pouco corpo, perfeito para estar com você o tempo inteiro. O novo notebook ASUS VivoBook 15 tem a incrível tela NanoEdge de 15,6 polegadas, que ocupa 88% de toda a parte frontal, graças à moldura de apenas 5,7mm. Tela de 15 mas o corpo é de um notebook de 14 polegadas.',2,'Intel 8565U','M230 2Gbytes GDDR5',8,'15.6',1,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (9,'Notebook Dell Inspiron I15-3583-A2YP 8ª Intel Core I5 20GB (4GB + 16GB Optane) 1TB LED 15,6\" Windows 10','/note-commerce/static/custom/general/img/products/default_laptop_08.jfif',3423,'APROVEITE SEUS DIAS AO MÁXIMO COM O NOVO INSPIRON 15 3000 (3583)! EFICIÊNCIA E DESEMPENHO.',3,'Intel Core I5','Intel® UHD Graphics 620',4,'15',1000,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (10,'Notebook Positivo Motion I341TAI Intel Core i3 4GB 1TB HD 14\" Linux - Positivo','/note-commerce/static/custom/general/img/products/default_laptop_09.jfif',1599,'O Notebook Positivo Motion I341TAI Intel Core i3 Tela 14\" 4GB 1TB HD Linux - Cinza foi desenvolvido para quem busca um notebook de alta qualidade, com design elegante e detalhes que surpreendem.',6,'Intel Core i3','Integrada',4,'14',1,-1,'Linux',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (11,'Notebook Hp X360 15-Br160cl I7-8550u 1.8ghz - Mem 16gb - 1tb HD - Tela 15.6\" Fhd Ips Touch - Vga Radeon 530 2gb Windows 10','/note-commerce/static/custom/general/img/products/default_laptop_10.jfif',6729,'',4,'I7-8550u','AMD Radeon™ 530 Graphics (2 GB DDR3 dedicated)',16,'15',1000,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (12,'MSI GS75 (Laptop Gamer) i9-9880H tela 17` FHD RTX 2080 SSD 2Tb NVMe RAM 64Gb','/note-commerce/static/custom/general/img/products/default_laptop_11.png',42000,'',1,'Intel i9-9880H de 8 núcleos e 4.8GHz (modo turbo)','Nvidia RTX 2080 · 8Gb dedicada',32,'17',2000,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (13,'Notebook Positivo Stilo One XC3550 Intel Atom 2GB 32GB Tela LCD 14\" Windows 10 - Cinza Escuro','/note-commerce/static/custom/general/img/products/default_laptop_12.png',999,'',6,'Intel Atom Cherry Trail Z8300','Intel HD Graphics',2,'14',32,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (14,'Notebook Motion Q232A Intel Atom Quad Core 2GB 32GB SSD LCD 14\'\' Windows 10 Prata - Positivo','/note-commerce/static/custom/general/img/products/default_laptop_13.png',999,'Positivo Montion Q 232A',6,'Intel Atom Cherry Trail Z8350','Intel HD Graphics',2,'14',32,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (15,'Notebook Asus,IntelCore i7-9750H,16GB,1TB SSD, 15,6 , NVIDIA GeForce RTX2080 MAXQ 8GB,ROG Zephyrus -GX531GXR-AZ064T','/note-commerce/static/custom/general/img/products/default_laptop_14.jfif',23509,'Depois de redefinir a categoria de notebooks gamer ultrafinos, a ROG apresenta a nova geração do Zephyrus, com design ainda mais fino, com apenas 15,3 mm na parte mais fina, mesmo tendo a poderosa placa gráfica GeForce RTX 2080 Max-Q e o mais recente processador Intel Core i7. As molduras superfinas da Tela NanoEdge de 240Hz com com validação Pantone ajudam você a mergulhar nos jogos. Sem comprometer o desempenho das maratonas de jogos, o inovador Sistema Aerodinâmico Ativo ajuda a aumentar o fluxo de ar em 22%.\r\n\r\nNotebook gamer ganhou outro significado após o mundo conhecer o Zephyrus. Agora a ROG apresenta a nova geração, com design ainda mais fino, com 15,3~16,1 mm de espessura, trazendo o poder do processador gráfico GeForce RTX 2080 Max-Q e o mais recente processador Intel Core i7, graças ao incrível sistema AAS de resfriamento. Outro fator importante para as dimensões enxutas do Zephyrus S é são as molduras superfinas da Tela NanoEdge. ',2,'Intel Core i7','NVIDIA GeForce RTX2080 MAXQ',16,'15.6',1000,-1,'Windows',0);
INSERT INTO `notecommerce_db`.`products` (`prd_id`,`prd_title`,`prd_image_url`,`prd_price`,`prd_description`,`prd_brd_id`,`prd_processor`,`prd_graphics_card`,`prd_ram`,`prd_monitor`,`prd_hd`,`prd_ssd`,`prd_os`,`prd_deleted`) VALUES (16,'Notebook Gamer Alienware Area 51m-a30p Ci9 16gb 1tb+ssd 17.3 ','/note-commerce/static/custom/general/img/products/default_laptop_15.jfif',23499,'O Novo Alienware Area-51m é o notebook gamer mais poderoso e inovador. Ele apresenta o nosso novo design “Legend”, evolução em um visual único. Inovação e alta performance com materiais premium.Com a última geração de placas de vídeo NVIDIA série 20 e 9ª geração de processadores Intel® Core™ (até i9K) para jogos exigentes, os novos Alienware estão melhores do que nunca, proporcionando altíssimo desempenho para rodar games pesados, para multitarefas, além de contar com suportabilidade de memória até 64GB (vendido separadamente).\r\n',1,'Intel® Core™ i9-9900K (16MB Cache, 3.6 GHz até 5.0GHz com Turbo Boost)','NVIDIA® GeForce RTX® 2080 8GB GDDR6',16,'17.3',256,-1,'Windows',0);

-- Products stock
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('1', '1', '4');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('2', '3', '5');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('3', '4', '7');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('4', '5', '0');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('5', '6', '1');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('6', '7', '34');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('7', '8', '50');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('8', '9', '10');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('9', '10', '15');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('10', '11', '20');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('11', '12', '25');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('12', '13', '30');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('13', '14', '6');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('14', '15', '5');
INSERT INTO `notecommerce_db`.`stock` (`stk_id`, `stk_prd_id`, `stk_quantity`) VALUES ('15', '16', '4');

