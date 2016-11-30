import psycopg2

conn = psycopg2.connect(database="bloodbankinfo", user="postgres", password="9999", host="127.0.0.1", port="5432")

print "Opened database successfully\n\n"

cur = conn.cursor()

#Query1
print "Querying the names of all female staff who are doctors and the name of the bloodbank in which they work:\n"
cur.execute("SELECT BB.NAME AS BLOODBANKNAME,ST.NAME AS STAFFNAME FROM BLOODBANK AS BB ,STAFF AS ST WHERE BB.BLOODBANKID = ST.BBID AND ST.TITLE = 'Doctor' AND ST.GENDER = 'F'")
vals = cur.fetchall()
for val in vals:
	print "Bloodbank Name:	"+val[0]
	print "Staff Name:	"+val[1]
print "\n"

#Query2
print "Querying the details of all O+ve blood group blood donations in West Bengal:\n"
cur.execute("SELECT BD.DONATIONDATE AS DONATIONDATE, BB.NAME AS BLOODBANKNAME, D.NAME AS DONORNAME FROM BLOODDONATIONS AS BD, BLOODBANK AS BB, DONOR AS D, ADDRESS AS AD WHERE BD.BBID = BB.BLOODBANKID AND BD.DID = D.DONORID AND AD.ADDID = BB.ADDID AND AD.STATE = 'West Bengal' AND D.BLOODGROUP = 'O+ve'")
vals = cur.fetchall()
for val in vals:
	print "Donation Date:	"+str(val[0])
	print "Bloodbank Name:	"+val[1]
	print "Donor Name:	"+val[2]
print "\n"

#Query3
print "Querying the details of Donor with atleast 5 blood donations:\n"
cur.execute("SELECT D.NAME AS DONORNAME, D.BLOODGROUP AS BG FROM DONOR AS D,BLOODDONATIONS AS BD WHERE BD.DID = D.DONORID GROUP BY D.DONORID HAVING COUNT(*)>=5")
vals = cur.fetchall()
for val in vals:
	print "Donor Name:	"+val[0]
	print "Blood Group:	"+val[1]
print "\n"

#Query4
print "Querying the details of Donors with atleast two high seriousness medical conditions:\n"
cur.execute("SELECT DON.DNAME AS DONORNAME, MEDC.NAME AS MEDCONDNAME FROM (SELECT D.DONORID AS DID, D.NAME AS DNAME FROM DONOR AS D, MEDICALCONDITION AS MC, DONORMEDCOND AS DMC WHERE DMC.SERIOUSNESS = 'high' AND D.DONORID = DMC.DID AND MC.CONDID = DMC.CID GROUP BY D.DONORID HAVING COUNT(D.NAME)>=2) AS DON, MEDICALCONDITION AS MEDC, DONORMEDCOND AS DMEDC WHERE DMEDC.SERIOUSNESS = 'high' AND DON.DID = DMEDC.DID AND MEDC.CONDID = DMEDC.CID")
vals = cur.fetchall()
for val in vals:
	print "Donor Name:	"+val[0]
	print "Medical Condition:	"+val[1]
print "\n"

#Query5
print "Querying details of Blood Bank with only Female Staff and established in or after 2000:\n"
cur.execute("SELECT BB.NAME, BB.PHONE, BB.ESTDATE FROM BLOODBANK AS BB WHERE 'F'= ALL (SELECT ST.GENDER FROM STAFF AS ST WHERE BB.BLOODBANKID = ST.BBID) AND BB.ESTDATE >= '2000-01-01'")
vals = cur.fetchall()
for val in vals:
	print "BloodBank Name:	"+val[0]
	print "Phone:	"+val[1]
	print "Date of Establishment:	"+str(val[2])
print "\n"

print "\nOperations executed successfully";

conn.close()


#(SELECT BB.NAME AS NAME, BB.PHONE AS PH FROM BLOODBANK AS BB WHERE BB.ADDID IN (SELECT A.ADDID AS AD FROM ADDRESS AS A WHERE A.CITY = 'HYDERABAD' AND A.ADDID<=15) ) UNION (SELECT BB.NAME AS NAME, BB.PHONE AS PH FROM BLOODBANK AS BB WHERE BB.ESTDATE > '2000-01-01');