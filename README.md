
# CMSC461 Wonderland Elections Database Project

This project is a database application that the country Wonderland will use to manage their elections. The database will keep track of the Folks of Wonderland and their information, the Elections_Staff who work for the Elections Department, the various Places of Wonderland and their information, the Residences, the Voting_Centers, the Operating_Periods of the Voting_Centers, the shifts of the staff, the Voting_Registrations, all of the Ballots, and all of the Polls. The project also consists of a .ipynb to be run in Anaconda Jupyter Notebook to provide a user interface to the folks and elections staff of Wonderland. It will allow them to insert, modify, delete, and search for information from the database based on certain constraints.

This submission contains the files:
------------------------------------
* **report.pdf**: A written report explaining Phases B, C, and D of the project. It includes detailed information of my project development, including my E-R diagram, the relational schema, and explanation of how I created each phase and my thought process.
* **dropAll.sql**: Drops all tables, triggers, indices, and functions in reverse order of creation.
* **createAll.sql**: Creates the schema of the relational database. Includes tables, primary keys, foreign keys, various constraints, triggers, and indices.
* **loadAll.sql**: Populates the database with sample data for each relation.
* **queryAll.sql**: Contains SQL Select statements for all of the queries/reports defined in Part B of the Functional Requirements. Scripting variables are pre-declared and documented for queries that require user input.
* **transaction.sql**: SQL Transaction to ensure ACID properties for Functional Requirement A.4, voter casting a ballot. Prevents double-voting and protects the integrity of all Ballots.
* **Wonderland_Elections_Application.ipynb**: A Jupyter Notebook file that provides a user interface to run Parts A and B of the Functional Requirements. Includes instructions to setting up the configuration environment and connection to the database.
* **README.md**: This document, which details the project and instructions for running the sql code.

Prerequisites
--------------
* **MySQL Server:** Version 8.0 or higher
* **Database Environment:** MySQL Workbench
* **Application Environment:** Anaconda Jupyter Notebook

**Database Name:**
The submitted scripts all use a schema named: `wonderland_elections_project` via `USE` command. If needed, one can edit the `USE` statement to have a different name at the top of `createAll.sql`, `dropAll.sql`, and `loadAll.sql`. Also would have to edit name in the Jupyter Notebook file to match new name.

How To Run MySQL Database
--------------------------
1.  Open MySQL Workbench and connect to your server.
2.  Create a new database schema named `wonderland_elections_project` (or a name of your choice)
* `CREATE DATABASE IF NOT EXISTS wonderland_elections_project`
3.  Open and execute the scripts in this **exact order**:
    * 1.  `dropAll.sql`  (Clears the database;  makes sure the database is empty before creation of tables, triggers, indices, and functions)
    * 2.  `createAll.sql` (Creates all of the relations using `CREATE TABLE IF NOT EXISTS` statements; includes keys, constraints, triggers, and indices)
    * 3.  `loadAll.sql` (Loads all of the sample data; includes data for each relation)

You are now able to view the database in the left sidebar of MySQL Workbench under `Schemas`. You can view the relations under the `Tables` drop-down.
You can view the data using `SELECT * FROM <table_name>;`

How To Run User Interface in Anaconda Jupyter Notebook
-------------------------------------------------------
1.  Make sure that `Wonderland_Elections_Application.ipynb` is in the file folder as the SQL files
2. Make sure to run `createAll.sql` and `loadAll.sql` **BEFORE** running `Wonderland_Elections_Application.ipynb`
3. Make sure to read the **`USER INTERFACE GUIDE`** featured at the top of the notebook for configuration and connection instructions, such as downloading the correct libraries and connecting to the database.
4. Run the cells sequentially.
(**NOTE:** The Jupyter Notebook file contains detailed instructions on how to run the interfaces, contained in the **`USER INTERFACE GUIDE`** and a seperate instruction guide for each query of Part A and Part B.)


Notes
-----
* **Triggers:** Data integrity is enforced through triggers (e.x., `check_voting_center_insert` checks if the Place has already been inserted in Residence before inserting into Voting_Center relation; maintains disjoint relationship).
* **Auto-Increment:** Some primary keys (e.x.,`place_id`, `ballot_id`) are auto-incremented.
* **Validation:** Voting_Registration is validated or invalidated automatically by a trigger.
* **Transaction:** Part A: Activity A.4 uses an isolation level of SERIALIZEABLE to prevent double-voting and ensure Ballot data integrity.
* **Indices:** Indices have been made on the `Place` and `Voting_Registration` relations to optimize certain queries in Part B. Indices are featured in `createAll.sql`.
* **Functions:** The function `display_closest_voting_center_from_folk()` is created in `queryAll.sql` in section B.9.