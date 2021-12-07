#Requires -Modules az.resources

#0. Syntax to evaluate 
param ($Action)
if ($Action -eq $null) {
	$Action = read-host -Prompt "Please enter ONE Action (ex : Microsoft.Authorization/*/Delete) " 
}

#1. We constitute the list of actions that includes this syntax.
$EvaluatedActions = @("*")
$spi = $Action.split("/")
$IsActionSpecific = $Action.SubString($Action.length-1, 1) -ne "*"
for ($i= 0; $i -lt $spi.count-1; $i++){
	$PermToAdd = $spi[0..$i] -join "/"
	$PermToAdd += "/*"
	$EvaluatedActions += $PermToAdd
}
if ($IsActionSpecific){
	$EvaluatedActions += $spi[0..$spi.count] -join "/"
}

#2. We look for any role that contains one the actions contains in the Actions list
$Roles = Get-AzRoleDefinition
$Result = @()

foreach ($Role in $Roles){
	$toAdd=$false
	foreach ($EvaluatedAction in $EvaluatedActions){
		if ($Role.Actions -contains $EvaluatedAction){
			$toAdd=$true
			break
		}
	}
	if ($toAdd){
		#2b. We make sure there is no NotActions opposing Actions for the action we look for 
		foreach ($EvaluatedAction in $EvaluatedActions){
			if ($Role.NotActions -contains $EvaluatedAction){
				$toAdd=$false
				break
			}
		}
	}
	if ($toAdd){
		$result+=$Role.Name	
	}
}

$Result
