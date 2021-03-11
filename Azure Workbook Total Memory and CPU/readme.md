## Azure Workbook : Total Memory and CPU

This workbook will display the total memomy and CPU accross all your subscriptions.

There are no parameter to manually fill in.

it is based on 3 queries : 
  - 1 query to resource graph explorer to get the number of VM per hardwareprofile
  - 1 query to resource manager to get the CPU and RAM per hardwareprofile
  - 1 query to do merge the results and summarize

