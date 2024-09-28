/*
Create a route table for existing vnet
*/

@description('Define route table name')
param routeTableName string

/*
@description('Enter the existing vnet name')
param vnetName string
*/

@description('Enter the location')
param location string = resourceGroup().location

@description('Tags for the NSG')
param tags object = {
  Environment: 'Development'
  Project: 'MyProject'
}

resource routetables 'Microsoft.Network/routeTables@2024-01-01' = {
  name:routeTableName
  location:location
  tags:tags
  
  properties:{
     disableBgpRoutePropagation: false
  }
}
