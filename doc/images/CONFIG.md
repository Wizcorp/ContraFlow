# @title Configure Contra Flow


**Configure Contra Flow**

Configuration file
======================

All system configuration is done in `./lib/contraflow/config.rb` file. Constants `GOOGLE` and `RT_CONFIG`  responsible for user name and passwords for Google doc and RT correspondingly. 

**Example configuration file:**

````ruby
GOOGLE = { 
  :document => 'RT Workflow Checklist',
  :sheets => [
              'New Employee Task List',
              'Leaving Employee Task List'
             ]
}
RT_CONFIG = { 
  :db => {
    :host => "rt.example.com",
    :database => 'rt',
    :username => 'template_update',
    :password => '<SECRET>'
  },
  # PATH to erd directory relative to the BASE directory of the
  # package
  :erb => "erb"
                                     
}
````

Naming
===========

- Name of the Google Docs spreadsheet is defined in `./lib/contraflow/config.rb` file:

  ````ruby
  GOOGLE = { 
      :document => 'RT Workflow Checklist',
  ...
  ````
  
  This name is used in the script to look-up spreadsheet by the API, so it must correspond to actual spreadsheet name.
  
- Worksheet names, defined in the same file and listed as:

  ````ruby
  GOOGLE = { 
      :sheets => [
          'New Employee Task List',
          'Leaving Employee Task List'
      ]
  ````
  
  These names are also used to look up worksheets in the doc and must match.
  
- ERB templates are located in `./lib/erb` directory and must correspond to the names of worksheet (case sensitive, including spaces) with adding `.erb` extension at the end. I.e. for the example above, following files exist:

  ````
  $ tree lib/erb                                
  lib/erb
  ├── Leaving\ Employee\ Task\ List.erb
  └── New\ Employee\ Task\ List.erb
  ````
  
- RT Templates must be named exactly like Google Docs worksheet, for the given example, 2 templates need to exist in  RT each one in its corresponding queue:

    ````
    Leaving Employee Task List
    New Employee Task List
    ```

Permissions
======================

MySQL
-----------



MySQL user must have grants to update column `Content` in table `Templates`. 

```
use rt;
grant select(id, Name, Content), update(Content) on rt.Templates to 'template_update'@'%' identified by '<SECRET>>';
flush privileges;
```

Google Docs
-------------

For Google doc share your document with user and set permission to read-write. 

> TODO: write permission should not be required, but current Ruby API to Google Docs is not able to read spreadsheet with RO permission only.


Configuration
===========


RT
-----------


In Request Tracker you need to create Queues, Templates and Script in order for this workflow to function.

See {file:docs/RT_SETUP.md}

Google Docs Spreadsheet
----------------------

See {file:docs/GOOGLE_SETUP.md}

ERB Templates
----------------------

See {file:docs/ERB.md}
