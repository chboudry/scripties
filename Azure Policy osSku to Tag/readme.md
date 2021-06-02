## Azure Policy : osSku properties to Tag for Azure ARC servers

This policy is doing the following : for Azure ARC machines that does not yet have an OS tag, add the osSku property value to a new OS tag.

This implies a remediation task with a managed identity to work properly.
