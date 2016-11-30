#Console User Interface for BloodBankInfo Database
import psycopg2
import sys
import pprint

commands_dic = {'1':'SPECIFICATION','2':'LIST','3':'INSERT','4':'DELETE','5':'MODIFY','6':'DISPLAY','7':'QUERY','8':'CREATE','9':'DROP','10':'HELP','11':'EXIT'}
commands_list = ['SPECIFICATION','LIST','INSERT','DELETE','MODIFY','DISPLAY','QUERY','CREATE','DROP','HELP','EXIT']

def printIndex():
	print "Choose one of the options to procced.\n"
	print "1. SPECIFICATION of the database"
	print "2. LIST all Tables"
	print "3. INSERT a row to a table"
	print "4. DELETE a row to a table"
	print "5. MODIFY a row of a table"
	print "6. DISPLAY the contents of a table"
	print "7. QUERY the contents of a table"
	print "8. CREATE a new table"
	print "9. DROP an existing table"
	print "10. HELP"
	print "11. EXIT"
	
	resp = raw_input("Your response: ")
	print "--------------------------------------------------\n"
	try:
		if(resp.upper() in commands_list):
			resp = commands_list.index(resp.upper())+1
			eventhandler(resp)
			return
		val = commands_dic[resp]
	except Exception as e:
		print "\nSorry! Invalid request. Please choose again.\n"
		print "--------------------------------------------------\n"
		HELP()
	
	eventhandler(int(resp))
	return

def eventhandler(response):
	options = {1:SPECIFICATION,2:LIST,3:INSERT,4:DELETE,5:MODIFY,6:DISPLAY,7:QUERY,8:CREATE,9:DROP,10:HELP,11:EXIT}
	options[response]()

def SPECIFICATION():
	print ""
	fo = open("DomainSpecification.txt", "r")
	sp = fo.read()
	print sp
	fo.close()
	print ""
	print "--------------------------------------------------\n"
	printIndex()

def EXIT():
	print ""
	resp_exit = raw_input("Are you sure [Y/N] ?	")
	exit_options = ['Y','YES']
	if(resp_exit.upper() in exit_options):
		sys.exit()
	print ""
	print "--------------------------------------------------\n"
	printIndex()

def HELP():
	print ""
	print "Enter the serial number or the word in CAPS to choose that command."
	print ""
	print "--------------------------------------------------\n"
	printIndex()

def LIST():
	print "\nListing all existing relations:\n"
	conn = psycopg2.connect(database="bloodbankinfo", user="postgres", password="9999", host="127.0.0.1", port="5432")
	cur = conn.cursor()
	cur.execute("select relname from pg_class where relkind='r' and relname !~ '^(pg_|sql_)';")
	vals = cur.fetchall()
	for i in range(len(vals)):
		print str(i+1)+". "+vals[i][0]
	conn.close()
	print ""
	print "--------------------------------------------------\n"
	printIndex()

def INSERT():
	print ""
	table_name = raw_input("Enter Table Name: ")
	attrs = raw_input("Enter Attribute Names: ").split()
	values = raw_input("Enter Values: ").split()
	conn = psycopg2.connect(database="bloodbankinfo", user="postgres", password="9999", host="127.0.0.1", port="5432")
	cur = conn.cursor()
	cmd = "INSERT INTO "+table_name+" ( "
	for attr in attrs:
		cmd = cmd + attr + ", "
	cmd = cmd[:len(cmd)-2] + " ) VALUES ( "
	for val in values:
		try:
			float(val)
			cmd = cmd +val+", "
		except Exception as e:
			cmd = cmd + "'"+val+"' , "	
	cmd = cmd[:len(cmd)-2] + " )"
	#print "===\n"+cmd+"\n==="
	try:
		cur.execute(cmd)
	except Exception as e:
		print "ERROR: "+str(e.message)
		sys.exit()
	conn.commit()
	conn.close()
	print "\nInserted successfully!!\n"
	print "--------------------------------------------------\n"
	printIndex()
	return

def DELETE():
	print ""
	table_name = raw_input("Enter Table Name: ")
	attrs = raw_input("Enter Attribute Names: ").split()
	values = raw_input("Enter Values: ").split()
	conn = psycopg2.connect(database="bloodbankinfo", user="postgres", password="9999", host="127.0.0.1", port="5432")
	cur = conn.cursor()
	cmd = "DELETE FROM "+table_name+" WHERE "
	for attr,val in zip(attrs,values):
		cmd = cmd + attr + "="
		try:
			float(val)
			cmd = cmd +val+" AND "
		except Exception as e:
			cmd = cmd + "'"+val+"' AND "	
	cmd = cmd[:len(cmd)-4] + ";"
	#print "\n===\n"+cmd+"\n===\n"
	try:
		cur.execute(cmd)
	except Exception as e:
		print "ERROR: "+str(e.message)
		sys.exit()
	conn.commit()
	conn.close()
	print "\nDeleted successfully!!\n"
	print "--------------------------------------------------\n"
	printIndex()
	return

def MODIFY():
	print ""
	table_name = raw_input("Enter Table Name: ")
	update_attrs = raw_input("Enter Attributes to be Updated: ").split()
	update_values = raw_input("Enter Values to be Updated: ").split()
	query_attrs = raw_input("Enter Attributes to be Queried: ").split()
	query_values = raw_input("Enter Values to be Queried: ").split()
	conn = psycopg2.connect(database="bloodbankinfo", user="postgres", password="9999", host="127.0.0.1", port="5432")
	cur = conn.cursor()
	cmd = "UPDATE "+table_name+" SET "
	for attr,val in zip(update_attrs,update_values):
		cmd = cmd + attr + "="
		try:
			float(val)
			cmd = cmd +val+" , "
		except Exception as e:
			cmd = cmd + "'"+val+"' , "	
	cmd = cmd[:len(cmd)-2] + " WHERE "
	for attr,val in zip(query_attrs,query_values):
		cmd = cmd + attr + "="
		try:
			float(val)
			cmd = cmd +val+" AND "
		except Exception as e:
			cmd = cmd + "'"+val+"' AND "
	cmd = cmd[:len(cmd)-4] + " ;"
	#print "\n===\n"+cmd+"\n===\n"
	try:
		cur.execute(cmd)
	except Exception as e:
		print "ERROR: "+str(e.message)
		sys.exit()
	conn.commit()
	conn.close()
	print "\nUpdated successfully!!\n"
	print "--------------------------------------------------\n"
	printIndex()
	return

def DISPLAY():
	print "\nDisplaying all the contents of: \n"
	table_name = raw_input("Enter Table Name: ")
	conn = psycopg2.connect(database="bloodbankinfo", user="postgres", password="9999", host="127.0.0.1", port="5432")
	cur = conn.cursor()
	cmd = "SELECT * FROM "+table_name+" ;"
	#print "\n===\n"+cmd+"\n===\n"
	try:
		cur.execute(cmd)
	except Exception as e:
		print "ERROR: "+str(e.message)
		sys.exit()
	vals = cur.fetchall()
	print ""
	pprint.pprint(vals)
	conn.close()
	print ""
	print "--------------------------------------------------\n"
	printIndex()
	return

def QUERY():
	query = raw_input("\nEnter the SQL Query: \n") 
	conn = psycopg2.connect(database="bloodbankinfo", user="postgres", password="9999", host="127.0.0.1", port="5432")
	cur = conn.cursor()
	try:
		cur.execute(query)
	except Exception as e:
		print "ERROR: "+str(e.message)
		sys.exit()
	vals = cur.fetchall()
	print ""
	pprint.pprint(vals)
	conn.close()
	print ""
	print "--------------------------------------------------\n"
	printIndex()
	return

def CREATE():
	print ""
	table_name = raw_input("Enter Table Name: ")
	n_attr = int(raw_input("Enter number of attributes: "))
	attributes = []
	for inp in range(n_attr):
		inp_resp = raw_input("Enter attribute name and constraints: \n")
		attributes.append(inp_resp)
		print ""
	conn = psycopg2.connect(database="bloodbankinfo", user="postgres", password="9999", host="127.0.0.1", port="5432")
	cur = conn.cursor()
	cmd = "CREATE TABLE "+table_name+" ( "
	for attr in attributes:
		cmd = cmd + attr + ", "
	cmd = cmd[:len(cmd)-2] + " );"
	#print "\n===\n"+cmd+"\n===\n"
	try:
		cur.execute(cmd)
	except Exception as e:
		print "ERROR: "+str(e.message)
		sys.exit()
	conn.commit()
	conn.close()
	print "\nCreated Table Successfully!!\n"
	print "--------------------------------------------------\n"
	printIndex()
	return

def DROP():
	print ""
	table_name = raw_input("Enter Table Name: ")
	conn = psycopg2.connect(database="bloodbankinfo", user="postgres", password="9999", host="127.0.0.1", port="5432")
	cur = conn.cursor()
	cmd = "DROP TABLE IF EXISTS "+table_name
	#print "\n===\n"+cmd+"\n===\n"
	try:
		cur.execute(cmd)
	except Exception as e:
		print "\nERROR: "+str(e.message)
		sys.exit()
	conn.commit()
	conn.close()
	print "\nDeleted Table Successfully!\n"
	print "--------------------------------------------------\n"
	printIndex()
	return	

print "Welcome to BloodBankInfo Interface!!\n"
print "--------------------------------------------------\n"
printIndex()
