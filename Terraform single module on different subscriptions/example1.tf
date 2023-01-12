#EXAMPLE 1, O(n) use of the module with static definition

module "dummyfirstcall"{
  source    = "./dummymodule"
  name = "ex1dummy1"
  location  = "westeurope"
  providers = {
    azurerm = azurerm.sub1
  }
}

module "dummysecondcall"{
  source    = "./dummymodule"
  name = "ex1dummy2"
  location  = "westeurope"
  providers = {
    azurerm = azurerm.sub2
  }
}