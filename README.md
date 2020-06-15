# Note Commerce
This is a Java EE application of a laptop e-commerce. It was made for the 
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
- Login and customer/admin account
- Basic product stock functionality (history, manual up and automatic down)

## Installing and Running
Requirements: Java 1.8+, [Eclipse IDE (JEE)](https://www.eclipse.org/downloads/packages/release/2019-12/r/eclipse-ide-enterprise-java-developers), [Apache Tomcat](https://tomcat.apache.org/download-80.cgi) and MySQL
1. Clone the project: `git clone https://github.com/thiago-bezerra/solstice-note-commerce.git`
2. Import the project into Eclipse ([guide](https://help.eclipse.org/2019-12/index.jsp?topic=%2Forg.eclipse.platform.doc.user%2Ftasks%2Ftasks-importproject.htm))
3. Fix your build path (if needed) to use your installed JRE:
   - Project Explorer -> Right click on project -> Build Path -> Configure Build Path -> JRE System Library -> Edit -> Alternative JRE
   - You may need to do the same with the Apache Tomcat library
4. Make sure your Apache Tomcat is ready to be used by Eclipse ([guide](https://crunchify.com/step-by-step-guide-to-setup-and-install-apache-tomcat-server-in-eclipse-development-environment-ide/)) and the __project root context is set to `note-commerce`__ ([guide](https://stackoverflow.com/a/8334309/11138267))
5. Run the scripts at `sql/` as root user to create the database, user and to fill table data
   - Recommended to use [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) to easily connect and paste/run the scripts
6. Run the project on your server
7. The project should be accessible through something like [localhost:8080/note-commerce/](http://localhost:8080/note-commerce/)

## Authors
[g-otn](https://github.com/g-otn) and [thiago-bezerra](https://github.com/thiago-bezerra).

## Acknowledgements
- Prof. Doctor Rodrigo Rocha Silva, for assigning us this project
- [ioxua](https://github.com/ioxua) and [marcelovbcfilho](https://gitlab.com/marcelovbcfilho), for giving us some tips and for the nice discussions about the project

## License
This project is licensed under [MIT](/LICENSE), and uses [AdminLTE 3](https://github.com/ColorlibHQ/AdminLTE/tree/v3.0.2), 
also licensed under MIT.
