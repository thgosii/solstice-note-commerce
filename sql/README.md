# Note Commerce SQL Scripts
This folder contains MySQL scripts to ready the database. To avoid manual setup or need to edit the scripts, it's 
recommended to run them from the MySQL Workbench as root user.

- **`create-objects.sql`**: This file creates the database, the user used by the Java application, all the tables and constraints
  - If you desire to change the user credentials or the database name, you must change it in the source code too at 
  `src/br/com/solstice/notecommerce/dao/connections/MySQLConnection.java`
- **`populate-tables.sql`**: This file inserts data on all tables for development. 
It creates an testing admin and customer account, some brands, products and so on.
  - Admin test account: email: `admin@admin.com`, password: `admin`
  - Customer test account: email: `client@client.com`, password: `client`
