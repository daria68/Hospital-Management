# Hospital-Management
A project developed using PL/SQL, built on a database which centralizes the medical history of all the patients from a hospital.

## Description of the database
The purpose of this database is to centralize and therefore facilitate the process of stay and treatment
of patients in a hospital, from the medical staff who care for them to the diagnoses
and prescribed treatments. There are wards in the hospital, each with several rooms. A
room has several patients. Each patient receives at least one diagnosis, and
the same diagnosis may correspond to several patients. A doctor knows at least one
diagnosis, and this diagnosis is treated with at least one drug. A medicine
it can treat several diagnoses and is part of a class that contains several
drugs.

## ERD
<img src="https://github.com/daria68/Hospital-Management/blob/main/ConceptualDiagram.png" >

## Conceptual diagram

<img src="https://github.com/daria68/Hospital-Management/blob/main/ConceptualDiagram.png" >


## Mandatory requirements based on the database:
- Define a stored subroutine that uses a collection type(varray, nested table, index-by table). Call the subroutine.
- Define a stored subroutine that uses a cursor type. Call the subroutine.
- Define a stored function that uses 3 of the defined tables. Treat all the exceptions that may arise. Call the subprogram so that all the cases treated are highlighted.
- Define a stored procedure that uses 5 of the defined tables. Treat all the exceptions that may arise. Call the subprogram so that all the cases treated are highlighted.
- Define a command-level DML trigger, a line-level DML trigger and a DDL trigger. Launch the triggers.
