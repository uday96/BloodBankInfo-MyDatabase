--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE address (
    addid integer NOT NULL,
    region character varying(50),
    city character varying(50),
    state character varying(50),
    country character varying(50),
    landmark character varying(50),
    zipcode character varying(15)
);


ALTER TABLE address OWNER TO postgres;

--
-- Name: bloodbank; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bloodbank (
    bloodbankid integer NOT NULL,
    name text NOT NULL,
    estdate date,
    addid integer,
    phone character varying(20)
);


ALTER TABLE bloodbank OWNER TO postgres;

--
-- Name: blooddonations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blooddonations (
    did integer,
    bbid integer,
    donationdate date NOT NULL
);


ALTER TABLE blooddonations OWNER TO postgres;

--
-- Name: donor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE donor (
    donorid integer NOT NULL,
    dob date,
    age integer,
    name text NOT NULL,
    gender character(1),
    bloodgroup character varying(20),
    nmn integer NOT NULL,
    addid integer,
    phone character varying(20)
);


ALTER TABLE donor OWNER TO postgres;

--
-- Name: donormedcond; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE donormedcond (
    did integer,
    cid integer,
    seriousness character varying(50)
);


ALTER TABLE donormedcond OWNER TO postgres;

--
-- Name: donormedication; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE donormedication (
    did integer,
    mid integer
);


ALTER TABLE donormedication OWNER TO postgres;

--
-- Name: medicalcondition; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE medicalcondition (
    condid integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE medicalcondition OWNER TO postgres;

--
-- Name: medication; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE medication (
    medid integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE medication OWNER TO postgres;

--
-- Name: qualifications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE qualifications (
    sid integer,
    qualification character varying(50) NOT NULL
);


ALTER TABLE qualifications OWNER TO postgres;

--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE staff (
    staffid integer NOT NULL,
    title character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    gender character(1),
    joindate date,
    bbid integer,
    addid integer,
    phone character varying(20)
);


ALTER TABLE staff OWNER TO postgres;

--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY address (addid, region, city, state, country, landmark, zipcode) FROM stdin;
1   Sathyanagar Colony  Hyderabad   Andhra Pradesh  India   NMDC Building   500090
2   \N  Kolkata West Bengal India   \N  \N
3   Sion    Mumbai  Maharashtra India   OPD BUILDING    400022
4   Andheri Mumbai  Maharashtra India   MG HOSPITAL 400058
5   Vile Parle  Mumbai  Maharashtra India   Nanavati Hospital   400056
6   Vallabh Nagar   Mumbai  Maharashtra India   SPBT College    400018
7   Borges Marg Mumbai  Maharashtra India   Dr Ernest Borges Marg   400012
9   Bhawanipur  Kolkata West Bengal India   S P Mukherjee Road  700026
10  Rabindra Sarani Kolkata West Bengal India   227 Central 700007
11  Kankurgachi Kolkata West Bengal India   \N  700016
13  Kukkatpally Hyderabad   Andhra Pradesh  India   Forum Mall  500091
14  Himayath Nagar  Hyderabad   Andhra Pradesh  India   Anasuya Complex 500029
15  Tiruvottiyur    Chennai Tamil Nadu  India   Shanmugaprm 600019
12  T Nagar Chennai Tamil Nadu  India   South West Boag Road    600017
16  MEHDIPATNAM Hyderabad   Andhra Pradesh  India   NMDC Building   500048
17  Kukkatpally Hyderabad   Andhra Pradesh  India   Manjeera Cinepolis  500090
18  Himayath Nagar  Hyderabad   Andhra Pradesh  India   Liberty Circle  500029
19  Himayath Nagar  Hyderabad   Andhra Pradesh  India   Fever Hospital  500029
20  Gachibowli  Hyderabad   Andhra Pradesh  India   IIIT Hyderabad  500039
21  Park Street Kolkata West Bengal India   \N  700016
22  Bose Road   Kolkata West Bengal India   Sealdah 700020
23  Ganguly Street  Kolkata West Bengal India   Bowbazar    700012
24  MK Road Mumbai  Maharashtra India   \N  400020
25  MK Road Mumbai  Maharashtra India   Annexe Building 400020
26  Nariman Point   Mumbai  Maharashtra India   Ernest House    400021
8   Sector 32-D Chandigarh  Punjab  India   Govt Med College & Hptl 160030
27  Janjikar Street Mumbai  Maharashtra India   Crawford Market 400003
28  D.N.Road    Mumbai  Maharashtra India   Terminus View   400001
29  National Library Road   Mumbai  Maharashtra India   Bandra Station  400021
30   Dr.B.R.Ambedkar Marg   Mumbai  Maharashtra India   Asiad Bus Stand 400014
31  Andheri Kurla Road  Mumbai  Maharashtra India   Kumaria Presidency Hotel    400059
32  Dr.Almeida Road Mumbai  Maharashtra India   Prestige Garden 400021
33  Janjikar Street Mumbai  Maharashtra India   Crawford Market 400003
34  VASHI   Mumbai  Maharashtra India   Om Rachana Housing Society  400703
35  Chandavarkar Road   Mumbai  Maharashtra India   Gora Gandhi Apartment   400092
36  Tilak Road  Mumbai  Maharashtra India   New Happy Home CHS  400077
37  Zirakpur    Chandigarh  Punjab  India   Ambala Highway  160019
38  Madhya Marg Chandigarh  Punjab  India   Industrial Area Phase I 160002
39  Narendrapur Kolkata West Bengal India   Parganas    743106
40  Lord Sinha Road Kolkata West Bengal India   Shree Sikshayatan   700016
41  Sarat Bose Road Kolkata West Bengal India   St. John Diocessan School   700020
42  Moira Street    Kolkata West Bengal India   Hindi High  700017
43  Jogesh Mitter Road  Kolkata West Bengal India   Sir Romesh Mittar Building  700025
44  A.P.C Road  Kolkata West Bengal India   Kolkata Deaf and Dumb School    700009
45  Diamond Harbour Road    Kolkata West Bengal India   \N  700009
46  Elgin Road  Kolkata West Bengal India   Lala Lajpat Rai Sarani  700020
47  Anna Salai  Chennai Tamil Nadu  India   MHU Complex 600035
48  M.G Road    Chennai Tamil Nadu  India   Ampa Skywalk    600034
49  Kondapur    Hyderabad   Andhra Pradesh  India   Heart Cup Coffe 500024
50  Hi-tech City    Hyderabad   Andhra Pradesh  India   Cyber Towers    500019
51  Madhapur    Hyderabad   Andhra Pradesh  India   Paradise    500025
52  Mehdipatnam Hyderabad   Andhra Pradesh  India   Inox Building   500048
53  Mylapore    Chennai Tamil Nadu  India   Ramakrishna Math Road   600004
54  Kukkatpally Hyderabad   Andhra Pradesh  India   Hill County 500090
55  Jubilee Hills   Hyderabad   Andhra Pradesh  India   Film Nagar  500071
56  Juhu Scheme Mumbai  Maharashtra India   Prateeksha  400049
57  Andheri Mumbai  Maharashtra India   Silver Beach    400049
58  Gandhigram Road Mumbai  Maharashtra India   Hattes Bungalow 400049
59  Park Street Kolkatta    West Bengal India   \N  700049
60  Joka    Kolkatta    West Bengal India   Fort William    700021
61  Chepauk Chennai Tamil Nadu  India   Ezhilagam   600021
62  Nungambakkam    Chennai Tamil Nadu  India   Marina  600031
63  Himalaya Marg   Chandigarh  Punjab  India   Sector 35   160021
64  Udyog Path  Chandigarh  Punjab  India   \N  160029
\.


--
-- Data for Name: bloodbank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bloodbank (bloodbankid, name, estdate, addid, phone) FROM stdin;
1   Red Cross Blood 2000-10-24  1   +918995221781
2   Gove Blood Bank 2003-12-14  2   033-26780725
3   DDF Blood Bank  2001-06-19  3   022-24021771
4   Rotary DG Blood Bank    2005-01-20  4   022-26283557
5   Dr. Balabhai Nanavati Hospital  2009-07-05  5   022-26119920
6   Cooper Hospital 1999-11-22  6   022- 26207254
7   Tata Memorial Hospital  1992-10-24  7   022- 24177000
8   Blood Bank Service  1995-11-07  8   0172- 2665545
9   Peoples Blood Bank  1997-01-25  9   033- 24555164
10  Marwari Relief Society  2001-11-09  10  033- 22745675
11  Apollo Gleneagles Hospital  2005-06-13  11  033- 23203040
13  Seva Blood Bank 2003-11-02  13  040- 66660710
14  Rudhira Voluntary Blood Bank    2007-10-03  14  040- 23220222
15  Vendesava Blood Bank    2000-04-13  15  044- 25960226
12  Dhanvandri Blood Bank   1997-09-29  12  044-24310660
\.


--
-- Data for Name: blooddonations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blooddonations (did, bbid, donationdate) FROM stdin;
1   1   2007-10-24
1   13  2002-09-19
1   14  2004-05-16
2   1   2005-11-22
2   13  2006-01-11
2   14  2002-09-26
3   3   2009-01-12
3   4   2009-12-31
3   5   2008-09-26
3   6   2006-01-11
3   7   2007-09-21
4   3   2011-01-12
4   4   2010-12-30
4   5   2008-09-26
4   6   2010-01-11
4   7   2007-05-28
5   3   2007-01-22
5   4   2009-12-31
5   5   2006-09-28
5   6   2010-01-01
5   7   2007-05-18
6   1   2004-11-20
6   13  2002-11-29
6   14  2003-09-14
7   3   2006-01-12
7   4   2008-02-22
7   5   2006-08-20
7   6   2009-06-05
7   7   2007-09-15
8   3   2007-11-22
8   4   2006-12-31
8   5   2008-09-29
8   6   2010-01-01
8   7   2007-08-18
9   9   2007-01-21
9   10  2006-11-30
9   11  2008-08-19
10  9   2009-09-11
10  10  2008-10-20
10  11  2009-01-29
11  9   2009-01-29
11  10  2010-11-20
11  11  2008-09-29
12  12  2007-01-09
12  15  2007-12-31
13  12  2009-11-04
13  15  2006-12-21
14  8   2008-01-24
15  8   2009-11-19
\.


--
-- Data for Name: donor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY donor (donorid, dob, age, name, gender, bloodgroup, nmn, addid, phone) FROM stdin;
1   1996-10-24  20  Uday    M   B+ve    1001    54  9940469994
2   1996-11-22  20  Prem    M   O+ve    1102    55  8940469993
3   1995-01-12  21  Narayana    M   A+ve    1105    56  7000469911
4   1994-01-22  22  Ahmed   M   B-ve    2109    57  9900469910
5   1993-05-12  23  Aizaz   M   O-ve    2501    57  8900469911
6   1990-10-27  26  Yashu   M   B+ve    5001    54  9945465995
7   1991-05-12  25  Vamsi   M   O-ve    7501    56  7977469911
8   1994-11-12  22  Meera   F   A-ve    6109    58  8900469918
9   1994-10-22  22  Sam F   B+ve    1111    59  7900469918
10  1990-12-12  26  Nevin   M   O+ve    6100    59  8900469919
11  1991-10-29  25  Febin   M   O+ve    7109    60  9900469999
12  1990-11-11  26  Geetika F   B+ve    4109    61  8900469898
13  1989-08-28  27  Amatul  F   A+ve    3107    62  7991469890
14  1989-07-21  27  Thomas  M   B+ve    6107    63  9991469892
15  1991-09-29  25  Shruthi F   O+ve    9109    64  7132469892
\.


--
-- Data for Name: donormedcond; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY donormedcond (did, cid, seriousness) FROM stdin;
1   1   low
1   2   low
2   1   low
2   2   low
3   4   low
3   6   low
4   4   low
4   6   low
4   7   high
5   3   low
5   5   low
6   2   high
6   5   low
7   2   high
7   5   low
7   6   high
8   4   low
8   7   low
9   3   low
9   6   low
10  1   low
10  3   low
10  7   low
10  4   low
10  5   low
11  3   low
11  7   low
12  1   low
12  6   high
13  2   low
13  3   high
14  1   low
14  4   high
14  7   high
15  3   low
\.


--
-- Data for Name: donormedication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY donormedication (did, mid) FROM stdin;
1   1
1   4
2   2
2   5
3   8
3   13
4   9
4   12
4   14
4   15
5   6
5   11
6   5
6   11
7   5
7   11
7   12
7   13
8   9
8   14
9   6
9   12
10  3
10  6
10  14
10  9
10  11
11  7
11  15
12  2
12  12
13  5
13  7
14  2
14  8
14  9
14  14
14  15
15  6
\.


--
-- Data for Name: medicalcondition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medicalcondition (condid, name, description) FROM stdin;
1   Acne Rosacea    Acne due to stress and body heat.
2   Acute Asthma    Asthma attacks. Breathing Problems
3   Anxiety Anxiety
4   Back Pain   Back Pain
5   HyperTension    High Blood Pressure
6   Diabetes    Diabetes
7   Psoriasis   Skin abnormalities
\.


--
-- Data for Name: medication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medication (medid, name, description) FROM stdin;
1   Doryx oral  Treats Acne. Weekly dose.
2   BenzoDox 60 Treats Acne. Weekly dose.
3   Rosula topical  Treats Acne. Daily dose.
4   ProAir HFA inhalation   Treats Asthma. Monthly dose.
5   Xopenex inhalation  Treats Asthma. Monthly dose.
6   Xanax oral  Treats Anxiety. Weekly dose.
7   Tofranil oral   Treats Anxiety. Weekly dose.
8   Zostrix topical Treats Back Pain. Weekly dose.
9   Acetaminophen oral  Treats Back Pain. Monthly dose.
10  Diovan oral Treats High BP. Weekly dose.
11  Azor oral   Treats High BP. Daily dose.
12  hydrochlorothiazide oral    Treats Diabetes. Weekly dose.
13  chlorthalidone oral Treats Diabetes. Daily dose.
14  Kenalog injection   Treats Psoriasis. Weekly dose.
15  Depo-Medrol injection   Treats Psoriasis. Monthly dose.
\.


--
-- Data for Name: qualifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY qualifications (sid, qualification) FROM stdin;
1   MBBS
1   MS
2   MBBS
2   MD
7   MBBS
7   MS
10  MBBS
10  MD
13  MBBS
16  MBBS
19  MBBS
19  MS
21  MBBS
21  MS
23  MBBS
23  MS
23  MD
25  MBBS
25  MS
28  MBBS
30  MBBS
30  MD
33  MBBS
33  MS
33  MD
36  MBBS
39  MBBS
39  MS
41  MBBS
41  MD
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY staff (staffid, title, name, gender, joindate, bbid, addid, phone) FROM stdin;
1   Doctor  Rahul   M   2000-10-24  1   16  9940469991
2   Doctor  Rajesh  M   2000-10-24  1   17  9940439993
3   Nurse   Priya   F   2000-10-24  1   18  9966808091
4   Manager Anvesh  M   2000-10-24  1   19  9949402231
5   Trainee Anu F   2000-10-24  1   20  9949409231
6   Manager Anup    M   2003-12-14  2   21  9919307230
7   Doctor  Reshma  F   2003-12-14  2   22  8249409931
8   Nurse   Simran  F   2003-12-14  2   23  7249409900
9   Manager Rakesh  M   2001-06-19  3   24  9911117231
10  Doctor  Vikram  M   2001-06-19  3   25  8249009000
11  Trainee Akshay  M   2001-06-19  3   26  7249489511
12  Manager Rachit  M   2005-01-20  4   27  7935717230
13  Doctor  Rajat   M   2005-01-20  4   28  8247009024
14  Nurse   Sakshi  F   2005-01-20  4   29  9200089510
15  Manager Sai M   2009-07-05  5   30  9677184433
16  Doctor  Mahanth M   2009-07-05  5   31  9345609024
17  Nurse   Rohit   M   2009-07-05  5   32  8456789510
18  Manager Preetam M   1999-11-22  6   33  7000789510
19  Doctor  Rakul   F   1999-11-22  6   34  8456282111
20  Manager Sameera F   1992-10-24  7   35  9450082158
21  Doctor  Pavan   M   1992-10-24  7   36  7014292100
22  Manager Aravind M   1995-11-07  8   37  7344292199
23  Doctor  Jaspreet    F   1995-11-07  8   38  9111092100
24  Manager Anitha  F   1997-01-25  9   39  9111092100
25  Doctor  Swetha  F   1997-01-25  9   40  8254092108
26  Nurse   Shriya  F   1997-01-25  9   41  7111092122
27  Manager Hari    M   2001-11-09  10  42  9136092129
28  Doctor  Lohit   M   2001-11-09  10  43  8222092122
29  Manager Soham   M   2005-06-13  11  44  7164092120
30  Doctor  Sahil   M   2005-06-13  11  45  9164112120
31  Trainee Sehwag  M   2005-06-13  11  46  8999092120
35  Manager Saif    M   2003-11-02  13  49  9167092120
36  Doctor  Salman  M   2003-11-02  13  50  8167092121
37  Nurse   Preethi F   2003-11-02  13  51  7007092021
38  Manager Prakash M   2007-10-03  14  52  9123092026
39  Doctor  Sherin  F   2007-10-03  14  51  7123093420
40  Manager Selvam  M   2000-04-13  15  53  8100992025
41  Doctor  Ravindran   M   2000-04-13  15  53  7103292021
32  Manager Lekha   F   1997-09-29  12  47  9999092121
33  Doctor  Afroze  M   1997-09-29  12  48  7789092128
34  Nurse   Maleka  M   1997-09-29  12  48  8789092128
\.


--
-- Name: address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (addid);


--
-- Name: bloodbankinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bloodbank
    ADD CONSTRAINT bloodbankinfo_pkey PRIMARY KEY (bloodbankid);


--
-- Name: donor_nmn_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY donor
    ADD CONSTRAINT donor_nmn_key UNIQUE (nmn);


--
-- Name: donor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY donor
    ADD CONSTRAINT donor_pkey PRIMARY KEY (donorid);


--
-- Name: medicalcondition_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medicalcondition
    ADD CONSTRAINT medicalcondition_name_key UNIQUE (name);


--
-- Name: medicalcondition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medicalcondition
    ADD CONSTRAINT medicalcondition_pkey PRIMARY KEY (condid);


--
-- Name: medication_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medication
    ADD CONSTRAINT medication_name_key UNIQUE (name);


--
-- Name: medication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medication
    ADD CONSTRAINT medication_pkey PRIMARY KEY (medid);


--
-- Name: staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staffid);


--
-- Name: bloodbank_addid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bloodbank
    ADD CONSTRAINT bloodbank_addid_fkey FOREIGN KEY (addid) REFERENCES address(addid);


--
-- Name: blooddonations_bbid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blooddonations
    ADD CONSTRAINT blooddonations_bbid_fkey FOREIGN KEY (bbid) REFERENCES bloodbank(bloodbankid);


--
-- Name: blooddonations_did_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blooddonations
    ADD CONSTRAINT blooddonations_did_fkey FOREIGN KEY (did) REFERENCES donor(donorid);


--
-- Name: donor_addid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY donor
    ADD CONSTRAINT donor_addid_fkey FOREIGN KEY (addid) REFERENCES address(addid);


--
-- Name: donormedcond_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY donormedcond
    ADD CONSTRAINT donormedcond_cid_fkey FOREIGN KEY (cid) REFERENCES medicalcondition(condid);


--
-- Name: donormedcond_did_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY donormedcond
    ADD CONSTRAINT donormedcond_did_fkey FOREIGN KEY (did) REFERENCES donor(donorid);


--
-- Name: donormedication_did_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY donormedication
    ADD CONSTRAINT donormedication_did_fkey FOREIGN KEY (did) REFERENCES donor(donorid);


--
-- Name: donormedication_mid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY donormedication
    ADD CONSTRAINT donormedication_mid_fkey FOREIGN KEY (mid) REFERENCES medication(medid);


--
-- Name: qualifications_sid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY qualifications
    ADD CONSTRAINT qualifications_sid_fkey FOREIGN KEY (sid) REFERENCES staff(staffid);


--
-- Name: staff_addid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY staff
    ADD CONSTRAINT staff_addid_fkey FOREIGN KEY (addid) REFERENCES address(addid);


--
-- Name: staff_bbid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY staff
    ADD CONSTRAINT staff_bbid_fkey FOREIGN KEY (bbid) REFERENCES bloodbank(bloodbankid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--