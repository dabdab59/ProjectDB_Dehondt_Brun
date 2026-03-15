Ricardo Prompt used :
Act as the president of a fencing club called "The Iron Mask". You have been running this club for 10 years and know all its administrative and sporting rules, but you know nothing about databases or information systems.

INSTRUCTIONS:
First, list the business rules of your club as a bullet list.
Second, based on these rules, provide a raw data dictionary with the following columns grouped in a table: meaning of the data, type, size in number of characters or digits. There must be between 25 and 35 data items.

CONTEXT:
My club has members of all ages (from children to veterans). We follow the regulations of the French Fencing Federation. We teach all three weapons (Foil, Epee, Sabre). We have a board of directors (President, Secretary, Treasurer) and several Masters of Arms (instructors). We own a lot of equipment (masks, jackets, weapons) that we rent out. We have training schedules based on age and weapons.

ADDITIONAL CONSTRAINTS:
Be precise but do not use technical database jargon. The information must reflect how a club works. Ensure the data dictionary has between 25 and 35 items.

REFERENCE:
Use the structure and categories found on the official French Fencing Federation website (https://www.ffescrime.fr/) for inspiration on license types, age categories, and weapon disciplines.

DESIRED OUTPUT:
Format the output in Markdown.
1. A bulleted list titled "Business Rules".
2. A table titled "Raw Data Dictionary" with the columns: Meaning of the data, Type, Size.

OBJECTIVE:
Provide me with a complete but understandable set of requirements so that a computer science student can later design a database for my club.

---------------------------------------------------------------------------------------------------------------------------------------------------------

Business Rules for the Ironmask :
-Members must provide a medical certificate or for minors a health questionnaire completed by legal guardians to register
-Each member is classified into an age category (M9, M13, Senior, Veteran)
-The club teaches three weapons: Foil, Epee, Sabre
-A member can train in one or more weapons
-All members must obtain a license from the French Fencing Federation through the club
-Club members can have different roles: President, Secretary, Treasurer, Master of Arms, or Fencer
-A Master of Arms can supervise several members
-Members can participate in official competitions upon selection by their instructor
-The club owns equipment that it rents to members in exchange for a deposit
-Training sessions are organized by weapon, level, and age category

-----------------------------------------------------------------------------------------------------------------------------------------------------
Data dictionnary obtained from the Ricardo Prompt :

Meaning of the data	                    Type	Size
FFE License Number	                    Text	15
Member's Last Name	                    Text	50
Member's First Name	                    Text	50
Date of Birth	                          Date	10
Age Category	                          Text	10
Full Postal Address	                    Text	150
Email Address	                          Text	80
Phone Number	                          Text	15
Legal Guardian's Name	                  Text	100
Medical Certificate Date               	Date	10
Main Weapon Practiced	                  Text	15
Role / Function at the club	            Text	30
Level / Ranking	                        Text	30
Club Membership Date	                  Date	10
Type of FFE License	                    Text	20
Referent Master of Arms ID	            Text	15
Training Session Day	                  Text	10
Class Start Time	                      Time	5
Class End Time	                        Time	5
Room Used	                              Text	30
Weapon Taught during the class	        Text	15
Equipment Inventory Number	            Text	10
Equipment Type	                        Text	30
Equipment Purchase Date	                Date	10
Equipment Condition	                    Text	15
Date of Next Competition	              Date	10
Competition Result	                    Text	20

----------------------------------------------------------------------------------------------------------------------------------------------------------

This is our LDM:

Masters_of_arms = (Referent_Master_of_Arms.id VARCHAR(50), DiplomaNumber INT, Speciality VARCHAR(50));
Disciplines = (Main_Weapon_Practiced VARCHAR(50), Is_Olympic LOGICAL);
Competitions = (Competition.id INT, Level_RegionalInternational... VARCHAR(50), Location VARCHAR(50), Date_ DATE, Starting_Time TIME);
Session = (Session.id INT, Day_OfWeek VARCHAR(50), Start_Time TIME, End_Time TIME, Room VARCHAR(50));
Rules = (Rules.id INT, Match_Duration INT, Target_Area VARCHAR(50), Number_Of_Points_For_Victory INT);
Categories = (Categorie_Name VARCHAR(50), Categorie_Code VARCHAR(50), Age_Limit INT, Weapon_Type VARCHAR(50), #Rules.id);
Members = (FFE_License_Number.id VARCHAR(50), Member_s_Last_Name VARCHAR(50), Member_s_First_Name VARCHAR(50), Date_of_Birth DATE, Medical_Certificate_Date DATE, Is_Referee LOGICAL, #Categorie_Name);
Equipment = (Equipment.id INT, Is_Electric LOGICAL, Brand VARCHAR(50), Size VARCHAR(50), #FFE_License_Number.id);
Roles = (Club_council_role.id INT, #FFE_License_Number.id);
Participate = (#FFE_License_Number.id, #Session.id);
Leads = (#Referent_Master_of_Arms.id, #Session.id);
Teach = (#Referent_Master_of_Arms.id, #Main_Weapon_Practiced);
Learn = (#FFE_License_Number.id, #Main_Weapon_Practiced);
Have = (#FFE_License_Number.id, #Referent_Master_of_Arms.id);
Compete = (#FFE_License_Number.id, #Competition.id);
Belongs_To = (#Categorie_Name, #Competition.id);

-----------------------------------------------------------------------------------------------------------------------------------------------------------

Scenario :

For the Usage Scenario, we thought it would be a good idea to put ourselves in the shoes of the president of the Ironmask since, as the president, we would have to manage all the data from the MCD. After all, the president oversees how the whole club operates, whether on the financial perspective or on any other perspective actually.
Thus we thought of the following queries :
-Track member registrations and fees
-Monitor training attendance
-Manage equipment inventory
-Analyze competition results
-Generate financial reports




