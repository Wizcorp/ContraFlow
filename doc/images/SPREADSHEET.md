
Usage instructions for new/parting employee worksheet.
===================================================================


DO NOT change worksheet titles, column names in the worksheets and spreadsheet key (in URL).

Worksheet names must *exactly* correspond to the name of template in RT - this name is used in the script and also is the file name of ERB template.
Titles of the columns in each worksheet are  used in ERB template, so do not change these too.


This spreadsheet contains list of tasks for new employee joining Wizcorp and similarly for employee leaving. 
Worksheets are used as source for creating templates of tickets in RT4 system. Each row of the worksheet creates one ticket in corresponding RT queue (defined by 'Queue' column value, see below).

Script will download worksheet(s) and create templates which are then uploaded to corresponding template in RT4. 


Google doc sharing
----------------------

This document should be explicitly shared with user rt_template@company.com in order to be accessible by script. If it is not, please click on Share bottom in the top right corner and add 'Can Edit' permission to the user.


Field descriptions
----------------------


* Task — appears on the subject of mail and in the body.
* Description — long description of task, in the body of mail (optional)
* Owner   —  RT's login name of owner. Can be empty, in this case will not have anybody assigned or use rotation script for that queue.
* Title   — Title of the team or a person mail addressed to i.e. 'Hardware Support', 'System Administration'. It appears in the mail body, as 'Dear Hardware Support'
* Queue — optional. If empty is set to Admin. This is name of the RT4 queue where new ticket is to be created. 
  Attention: this queue MUST exist in RT4. 
  EVEN BIGGER WARNING: Never set this queue to 'New employee' or similar queue name for parting employee. It will cause an endless loop it tickets creation!
* Note — description. Not used in script.
* Starts - start time of a ticket. It is calculated from Start date of new employee (or leave date) by adding number of days to it. If number is negative, subtract instead.
* Due - due date of a ticket. Same calculation logic as for 'Starts' field

Script information
----------------------

See {file:README.md} file



Example template
----------------------

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
