# @title Create or edit ERB templates


Create or edit ERB templates
======================

[Up](CONFIG.md) 

ContraFlow can support multiple work-flows in RT, each work-flow having its own template for tickets generation. 

Generated RT template can have multiple tickets for the same work-flow. 

Every ticket in RT template is generated from ERB template, corresponds to single row in respective Goggle Docs worksheet. ERB templates are plain text files stored on a file-system in the project tree (see below).

  
Example
-----------

Templates are plain text files with both ERB markup and RT "tokens".

See more about [ERB markup](http://ruby-doc.org/stdlib-1.9.3/libdoc/erb/rdoc/ERB.html)

Below is an example of New employee mail ERB template:

- Included in `<% %>` are ERB markup elements, processed by Ruby scripts during generation of RT Templates

__Example:__ `@task` below is Ruby variable (Hash).
  
  ````
  <%= @task['Queue'] ? @task['Queue'] : 'Admin' %>
  ````
  
- Delimited by `{ }`'s are RT tokens and functions processed at the time of new tickets creation.


__Example:__   Variables below are Perl RT variables
  
  ````
  Requestor: { $Tickets{'TOP'}->OwnerObj->EmailAddress() }
  ````
  

### ERB template example

This is template with some complex markups removed for readability. 

````
===Create-Ticket: new-employee-<%= @id %>
Queue: <%= @task['Queue'] ? @task['Queue'] : 'Admin' %> 
Subject: <%= @task['Task'] %> for the new employee { $Tickets{'TOP'}->FirstCustomFieldValue('Employee name') }
Requestor: { $Tickets{'TOP'}->OwnerObj->EmailAddress() }
Parents: { $Tickets{'TOP'}->Id() }
Content: 


Dear <%= @task['Title'] %>,

Please be informed that new employee { $Tickets{'TOP'}->FirstCustomFieldValue('Employee name') } 
is starting at Company on { $Tickets{'TOP'}->FirstCustomFieldValue('Start date') }.

Please <%= @task['Task'] %> for him/her.

Additional information: <%= @task['Description'] ? @task['Description'] : 'None' %>

This ticket creation was triggered by parent ticket "{$Tickets{'TOP'}->Subject() }" 
http://rt.company.com/Ticket/Display.html?id={ $Tickets{'TOP'}->Id() }, 
requested by { $Tickets{'TOP'}->OwnerObj->EmailAddress() }.

Sincerely,
Company Request Tracker system.
````



 
 

    
     
