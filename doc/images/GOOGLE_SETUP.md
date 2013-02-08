# @title Setting Google Docs spreadsheet

Google Docs Setup
======================

[Up](CONFIG.md)


Example spreadsheets
----------------------

- Example working spreadsheet is shared with [Read Only permissions on Google doc](https://docs.google.com/spreadsheet/ccc?key=0Ap32LA9s6OPXdFZVVldyS0Y4QnpMUzhjRXB3UmtLZFE&usp=sharing). 
- Copy of the same spreadsheat is included in the project:
  - {file:docs/examples/EmployeeWorkflowChecklist.ods} in ODS format or
  - 2 sheets is CVS format
      - {file:docs/examples/EmployeeWorkflowChecklist-NewEmployeeTaskList.csv} 
      - {file:docs/examples/EmployeeWorkflowChecklist-LeavingEmployeeTaskList.csv} 

Simply copy or upload one of the examples to your Google Doc account and modify it to your needs.


Instructions below are also included into spreadsheet, so that they are visible to the user of the spreadsheet.

Usage instructions for new/parting employee worksheet. 
--------------------------------------------



DO NOT change worksheet titles, column names in the worksheets and spreadsheet key (in URL).

Worksheet names must *exactly* correspond to the name of template in RT - this name is used in the script and also is the file name of ERB template.
Titles of the columns in each worksheet are  used in ERB template, so do not change these too.


This spreadsheet contains list of tasks for new employee joining Wizcorp and similarly for employee leaving. 
Worksheets are used as source for creating templates of tickets in RT4 system. Each row of the worksheet creates one ticket in corresponding RT queue (defined by 'Queue' column value, see below).

Script will download worksheet(s) and create templates which are then uploaded to corresponding template in RT4. 


### Google doc sharing


This document should be explicitly shared with user rt_template@company.com in order to be accessible by script. If it is not, please click on Share bottom in the top right corner and add 'Can Edit' permission to the user.


### Field descriptions

<style type="text/css">
table, td,th { border-color: #CCC; border-style: solid; }
table { border-width: 0 0 1px 1px; border-spacing: 0; border-collapse: collapse; }
td, th { margin: 0; padding: 4px; border-width: 1px 1px 0 0; }
</style>

<table>
<tr><th> Task <td> appears on the subject of mail and in the body.
<tr><th> Description <td> long description of task, in the body of mail (OPTIONAL)
<tr><th> Owner   <td> RT's login name of owner. Can be empty, in this case will not have anybody assigned or use rotation script for that queue.
<tr><th> Title   <td> Title of the team or a person mail addressed to i.e. 'Hardware Support', 'System Administration'. It appears in the mail body, as 'Dear Hardware Support'
<tr><th> Queue <td> (OPTIONAL). If empty is set to Admin. This is name of the RT4 queue where new ticket is to be created. 
  Attention: this queue MUST exist in RT4. 
  EVEN BIGGER WARNING: Never set this queue to 'New employee' or similar queue name for parting employee. It will cause an endless loop it tickets creation!
<tr><th> Note <td> Description. Not used in script.
<tr><th> Starts<td>start time of a ticket. It is calculated from Start date of new employee (or leave date) by adding number of days to it. If number is negative, subtract instead.
<tr><th> Due<td>due date of a ticket. Same calculation logic as for 'Starts' field
</table>

### Script information


See {file:README.md} file



### Example template


```
===Create-Ticket: new-employee-13

Queue: Hardware
Subject: Setup Hardware for the new employee { $Tickets{'TOP'}->FirstCustomFieldValue('Employee name') }
Owner: rtuser1
Requestor: { $Tickets{'TOP'}->OwnerObj->EmailAddress() }
Parents: { $Tickets{'TOP'}->Id() }
Content:

Dear Hardware Support,

Please be informed that new employee { $Tickets{'TOP'}->FirstCustomFieldValue('Employee name') } is starting at the company on { $Tickets{'TOP'}->FirstCustomFieldValue('Start date') },

Please Setup Hardware for him/her.

[...]

```
