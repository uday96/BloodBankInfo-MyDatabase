#**BloodBankInfo Database:**

A **Database Management System** for Blood Banks.

###**Specification**
In a given region there are several blood banks.
Each blood bank has a unique bloodBankID , name, phone number, year of est.
A blood bank is managed by staff and has joining date.
several staff members could be managing a blood blank, identified by a unique staffID.
Each staff member also has a name, gender, phone, title and one or more qualifications.
Donors donate blood to blood banks and the date of donation is recorded.
We keep track of following details regarding Donors : unique donorID , DOB, Age, name, gender, phone, National Medical Number, blood group.
Donors can be taking any medications. Each medication has a unique medID, name and description.
Donors can also have any medical conditions with some seriousness.
Each Medical condition has a unique condID, name and description.
A donor can donate blood to several blood banks and a blood bank can recieve dontaions from multiple donors.
Each of donor, blood bank and staff reside in an address.
An address has unique addID, region, city, state, country, zipcode.

###**Files**
> - **ProblemStatement.txt** :  Contains the problem statement
> - **DomainSpecification.txt** : 	Contains the specification of the BloodBankInfo Database
> - **Queries.py** : Displays few sample queries made on the BloodBankInfo Database
> - **Console.py** : A User Interactive Shell Program to access the BloodBankInfo Database
> - **bloodbankinfo.sql** : Database Dump File