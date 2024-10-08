# Dynamic Login and Role Assignment in SQL

## Overview
This repository contains SQL scripts to automate the creation of users, assign them to roles, and manage database permissions dynamically. The provided scripts perform the following tasks:

Creation of the PaymentEntry role and assignment of specific permissions to manage invoices and invoice line items.
Dynamic creation of login accounts and users with unique credentials and default database assignments.
Assignment of newly created users to the PaymentEntry role.

## Scripts

### 1. PaymentEntry Role Creation
This script creates the PaymentEntry role, which has:

- UPDATE permissions on the Invoices table.
- UPDATE and INSERT permissions on the InvoiceLineItems table.
- SELECT permission for all tables in the dbo schema. It also adds the PaymentEntry role to the built-in db_datareader role to allow read access across the database.

### 2. Creating a New Login and User
This script creates a new login and user:

- Creates a login for a user named AAaron with the password 'AAar99999'.
- Sets the default database to AP.
- Assigns the user to the PaymentEntry role.

### 3. Dynamic User Creation with Cursor
This script dynamically creates multiple login IDs from a table:

- Iterates over the NewLogins table using a cursor to fetch login names.
- For each login, it checks if the login already exists.
- If the login does not exist, it creates the login with a temporary password, assigns the default database, creates a corresponding user, and adds the user to the PaymentEntry role.
