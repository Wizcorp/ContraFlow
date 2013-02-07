
Name
======================

**Contra-flow**

>>>> *Contra-flow*
>>>>
>>>> _One of the Four Dread Horsemen of Public Holidays. In spirit, if not in anthropomorphic personification, has a lot in common with Anthony Crowley's subtle re-engineering of the M25 London Orbital Motorway._
>>>> 
>>>>> Discworld & Terry Pratchett Wiki [http://wiki.lspace.org/mediawiki/index.php/Contra-flow](http://wiki.lspace.org/mediawiki/index.php/Contra-flow)


Description
======================

ContraFlow is Ruby libraries, script and set of templates to create [Request Tracker](http://www.bestpractical.com/rt/) template files from Google Docs spreadsheet. it is currently used to setup process for employee joining company or leaving. but it can be used as generic work-flow management system for RT.

Features
-----------

User facing interface of ContraFlow is Google Docs spreadsheet, where user (for example HR staff) can add or remove tasks as needed. 

Script (running from crontab or manually)

- Reads data from Google Docs spreadsheet using Google API.
- Parses ERB tempalates.
- Uploads parsed templates populated with data into the template into specified RT queue.
- When template is used to create workflow, each row in the Google Docs sheet creates one ticket in RT.

Usage
-----------

After editing GoogleDocs spreadsheet run script as :

    ./bin/contraflow
    
If user name and/or password are not configured in the system (see [Configuration](#Configuration) below) script will prompt for these.

Example output

````shell
$ ./bin/contraflow
Enter your Google user name and password:
Enter your username:  user@example.com
Enter your password:  *********
New Employee Task List
Leaving Employee Task List
````    

Script reads spreadsheet from Google Docs spreadsheet, formats template and uploads it into RT4 server's MySQL database. Names of templates imported to RT are printed out on STDOUT.

Installation 
======================

See {file:docs/INSTALL.md}

Configuration
======================

See {file:docs/CONFIG.md}

Requirements
======================

Ruby, MySQL library, for gems see Gemfile.

Install dependencies by `bundle install`.

Author
======================

Original author: Dmytro Kovalov

October, 2012



