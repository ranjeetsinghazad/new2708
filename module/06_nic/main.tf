resource "azurerm_network_interface" "nic" {
    for_each = var.nics
    name = each.value.name
  location = each.value.location
  resource_group_name = each.value.rgname
  ip_configuration {
    name = each.value.nconfigname
    subnet_id = data.azurerm_subnet.datasubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = each.value.datapipname != null ? data.azurerm_public_ip.datapip[each.key].id: null
  
  }
}
data "azurerm_public_ip" "datapip" {
  for_each = {for key,value in var.nics : key=>value if value.datapipname != null}
  name = each.value.datapipname
  resource_group_name = each.value.rgname

}

data "azurerm_subnet" "datasubnet"{
    for_each = var.nics
    name = each.value.datasubnetname
    resource_group_name = each.value.rgname
    virtual_network_name = each.value.vnetname
}
  
