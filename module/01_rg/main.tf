resource "azurerm_resource_group" "rg"{
    for_each = {for key,value in var.rgs : key=>value if lower(value.location) == "central india"}
    name = each.value.name
    location = each.value.location
    lifecycle {
      prevent_destroy = false
       create_before_destroy = true
    }
}



resource "azurerm_resource_group" "rg1"{
for_each = {for key,value in var.rgs : key=>value if lower(value.location) != "central india"}
name = each.value.name
location = each.value.location
lifecycle {
  prevent_destroy = false
}
}