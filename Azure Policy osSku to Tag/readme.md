## Azure Policy : osSku properties to Tag for Azure ARC servers

This policy is doing the following : for Azure ARC machines that does not yet have an OS tag, add the osSku property value to a new OS tag.

This implies a remediation task with a managed identity to work properly.

## Try on Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#blade/Microsoft_Azure_Policy/CreatePolicyDefinitionBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fchboudry%2Fscripties%2Fmaster%2FAzure%20Policy%20osSku%20to%20Tag%2Fazurepolicy.json)
