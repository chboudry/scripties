#EXAMPLE 2 looping on parameter

# Initially I thought i would be able to pass the attribute subscription to the providers parameter directly but this is not supported as it expects a static map expression.
# Because of that, we still have to define manually O(2) modules
# 2 solutions :
#   1. We can either create 2 parameter list with one module parsing each 
#   2. we can create 2 modules parsing a single list and taking rg conditionally 
# benefit of first solution is you do not need to repeat the subscription in each object, because this is tied to the list.
# let's go for solution 1

locals {
    SUB1resourcegroups = [
        {
            name = "ex2dummy1"
            location = "westeurope"
        },
        {
            name = "ex2dummy2"
            location = "westeurope"
        }
    ]
    SUB2resourcegroups = [
        {
            name = "ex2dummy3"
            location = "westeurope"
        },
        {
            name = "ex2dummy4"
            location = "westeurope"
        }
    ]
}


module "dummysub1"{
    for_each = { for index, rg in local.SUB1resourcegroups : rg.name => rg }
    name = each.value.name
    location = each.value.location 
    providers = {
        azurerm = azurerm.sub1
    }
    source    = "./dummymodule"
}


module "dummysub2"{
    for_each = { for index, rg in local.SUB2resourcegroups :
        rg.name => rg
    }
    name = each.value.name
    location = each.value.location
    providers = {
                azurerm = azurerm.sub2
    }
    source    = "./dummymodule"
}