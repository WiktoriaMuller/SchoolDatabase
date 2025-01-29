# School Database - SQL Scripts

## Overview
This repository contains SQL scripts for managing a school database named Szkola. The scripts include table creation, data insertion, updates, deletions, queries, and views to facilitate the organization of students, teachers, classes, lessons, and subjects.

## Database structure

The database consists of the following tables:
* **Klasa** - Stores information about school classes.
* **Uczen** - Contains student records with personal and class-related data.
* **Nauczyciel** - Stores teacher information, including specialization and contact details.
* **Przedmiot** - Represents school subjects with related requirements and scope.
* **Lekcja** - Manages lesson schedules and links them to classes, teachers, and subjects.
* **NauczycielKlasa** - Establishes relationships between teachers and classes.

## SQL operations

The scripts include:
1. Database creation (`CREATE DATABASE`).
2. Table creation (`CREATE TABLE`).
3. Data insertion (`INSERT INTO`).
4. Data modification (`UPDATE`) and data deletion (`DELETE`).
5. Queries (`SELECT`).
6. Views (`CREATE VIEW`).

## Usage

1. Ensure you have a SQL Server database named Szkola.
2. Run the table creation script.
3. Insert sample data to populate the tables.
4. Execute update, delete, or select queries as needed.
5. Utilize views for reporting and analysis.
