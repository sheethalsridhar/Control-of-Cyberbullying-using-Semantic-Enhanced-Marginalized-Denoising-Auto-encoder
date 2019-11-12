# Control-of-Cyberbullying-using-Semantic-Enhanced-Marginalized-Denoising-Auto-encoder(MySQL, Apache Server & Java) 
Created an Online Social Network that is safe from textual based cyberbullying by monitoring the activities of the user and blocking bullying posts from the social media using deep learning model smSDA. 

##################################################################################################################
Download the NetBeans 8.0.1 version and start the NetBeans IDE. 

Before we open and run the project, we must load the database for the project, Follow the below given steps to do the same:

1. Place the 'newcode(this entire repository)' folder in the Data(F:) drive. Inside the 'newcode' folder, Open 'db' file and copy the whole code into a notepad.
2. Open the NetBeans IDE and under the 'Services', expand the'Database' by clicking the '+' and then right click on 'MySQLServeratlocalhost:3306[root]' and select    'Create Datbase' option.
3. In the dialog box (Create My SQL Datbase) opened, enter the Database name (ex:SocialNetwork), check the 'grant full access to' box and click 'Ok'.
4. The datbase SocialNetwork has been created.

Now we have to connect to the database, load, clean and build it, Follow the below given steps to do the same:

1. Once the database is created, under the expansion of 'DataBase' we can see a 'jdbc' connecting our database(SocialNetwork).
2. Right click on the same and select the option 'Execute Command'.
3. This opens a tab in th editor for the jdbc, paste the previously copied code into this and choose the 'Run SQL' option.
4. It will load the database i.e all the tables, views etc.

The final step is to loading the project and running it, Follow the below given steps to do the same:

1. Click on the 'File' icon in the NetBeans IDE and select the 'open project' option. Select the 'newcode' under the Data(F:) drive.
2. Once the project loads, right click on the 'Social Network' and choose the 'Clean and Build' option.
3. Finally click on 'run project' to run the project. 
