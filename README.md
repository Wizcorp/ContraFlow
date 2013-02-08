
Name
======================

**Contra-flow**

> *Contra-flow*
>
> _One of the Four Dread Horsemen of Public Holidays. In spirit, if not in anthropomorphic personification, has a lot in common with Anthony Crowley's subtle re-engineering of the M25 London Orbital Motorway._
> 
> Discworld & Terry Pratchett Wiki [http://wiki.lspace.org/mediawiki/index.php/Contra-flow](http://wiki.lspace.org/mediawiki/index.php/Contra-flow)


Description
======================

ContraFlow is Ruby library, script and set of templates to create [Request Tracker](http://www.bestpractical.com/rt/) ticket templates from Google Docs spreadsheet. It is currently used to setup process for employee joining company or leaving. But it can be used as generic work-flow management system for RT.

Features
-----------

User facing interface of ContraFlow is Google Docs spreadsheet, where user (for example HR staff) can add or remove tasks as needed. 

Script (running from crontab or manually)

- Reads data from Google Docs spreadsheet using Google API.
- Parses ERB templates.
- Uploads parsed templates populated with data into the Request Tracker ticket template(s).

When parent RT ticket scrip is activated, RT creates one child ticket for each row in the Google Docs sheet. Created children ticket(s) have subject, body, owner, start and due dates as specified in the Google document. Content of a ticket is defined by ERB template file(s).

Usage
-----------

After editing Google Docs spreadsheet run script as :

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

License
===========

The MIT License

Copyright (C) 2012, 2013 Wizcorp, Inc. <info@wizcorp.jp>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furn    ished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substa    ntial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Author
======================

Original author: [Dmytro Kovalov](http://github.com/dmytro)

October, 2012



