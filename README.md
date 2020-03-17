# Note Commerce
This is an Java EE application of a laptop e-commerce. It was made for the 
fictional company "LapTop Computadores" by the fictional software company "Solstice".

## Overview
- Shop
  - Basic product listing and local filtering
  - Session-based shopping cart feature
  - Checkout and simulated payement
  - Customer account and registration
  - Simulated tracking orders, refunds and custom products exchanges
- Admin CMS
  - Dashboard
  - Product managment
  - Control options for simulated features

## Installing and Running
Requirements: Java 1.8+, [Eclipse IDE (JEE)](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2019-12/R/eclipse-jee-2019-12-R-linux-gtk-x86_64.tar.gz), [Apache Tomcat](https://tomcat.apache.org/download-80.cgi) and MySQL
1. Clone the project: `git clone https://github.com/thiago-bezerra/solstice-note-commerce.git`
2. Run the scripts at `sql/` as root user to create the database, user and to fill table data
   - Recommended to use [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) to easily connect and paste/run the scripts
3. Fix your build path (Eclipse IDE) to use your installed JRE:
   - Right click on project -> Build Path -> Configure Build Path -> JRE System Library -> Edit -> Alternative JRE
   - You may need to do the same with the Apache Tomcat library

## Authors
[g-otn](https://github.com/g-otn) and [thiago-bezerra](https://github.com/thiago-bezerra).

## License
This project is licensed under [MIT](/LICENSE), and uses [AdminLTE 3](https://github.com/ColorlibHQ/AdminLTE/tree/v3.0.2), 
also licensed under MIT.
