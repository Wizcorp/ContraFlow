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

Configure RT
======================

In Request Tracker you need to create Queues, Templates and Script in order for this workflow to function.

See {file:docs/RT_SETUP.md}

Google Docs Spreadsheet
=================================

See {file:docs/GOOGLE_SETUP.md}

ERB Templates
======================

See {file:docs/ERB.md}
