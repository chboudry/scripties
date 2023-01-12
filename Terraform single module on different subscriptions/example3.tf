#EXAMPLE 3 looping on parameter

# Initially I thought i would be able to pass the attribute subscription to the providers parameter directly but this is not supported as it expects a static map expression.
# Because of that, we still have to define manually O(2) modules
# 2 solutions :
#   1. We can either create 2 parameter list with one module parsing each 
#   2. we can create 2 modules parsing a single list and taking rg conditionally 
# benefit of first solution is you do not need to repeat the subscription in each object, because this is tied to the list.
# This is solution 2

locals {
    resourcegroups = [
        {
            name = "ex3dummy1"
            location = "westeurope"
            sub = "sub1" ## ---> less convenient to have to input that per resource
        },
        {
            name = "ex3dummy2"
            location = "westeurope"
            sub="sub2"
        }
    ]
}

# You still have 2 definitions
module "example3dummysub1"{
    for_each = { for index, rg in local.resourcegroups : rg.name => rg if rg.sub == "sub1"}
    name = each.value.name
    location = each.value.location 
    providers = {
        azurerm = azurerm.sub1
    }
    source    = "./dummymodule"
}


module "example3dummysub2"{
    for_each = { for index, rg in local.resourcegroups : rg.name => rg if rg.sub == "sub2"}
    name = each.value.name
    location = each.value.location
    providers = {
                azurerm = azurerm.sub2
    }
    source    = "./dummymodule"
}