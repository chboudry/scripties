## Azure Storage Log ingestion

This script is based on the [script made by Vanessa Bruwer][vanessascript] that was already a fork on this one [here][originalscript].

It shows how to use  Azure Storage Powershell to collect the logs from a specific storage account and write the contents into a custom table in Log Analytics using the HTTP data ingestion API.

Vanessa modified this in order to be used in an Azure Automation runbook, to enumerate all the storage accounts in a subscription, and then step through each of them to collect the logs. It will also only collect the logs from the previous hour.

I added Storage Account V2 support.

To use this script, you will need:
* An Azure Automation account
* Classic diagnostics enabled on your storage accounts

To implement:
* Import the Az.Storage module into your Automation account
* Create variables in Azure Automation for your Logs workspace ID and Key
* Create a new runbook with the script

All data will be written into the AzureStorage_CL custom log.

[vanessascript]:https://github.com/vanessabruwer/scripties/tree/master/Azure%20Storage%20Logs%20Ingestion
[originalscript]:https://github.com/Azure/azure-docs-powershell-samples/tree/master/storage/post-storage-logs-to-log-analytics
