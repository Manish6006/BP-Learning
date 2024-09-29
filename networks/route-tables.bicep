/*
Create a route table for existing vnet
*/
var parameters = loadJsonContent('../json/new-param.json')

@description('Define route table name')
var routeTableName =parameters.routeTableName

/*
@description('Enter the existing vnet name')
param vnetName string
*/

@description('Enter the location')
param location string = resourceGroup().location

var variables= loadJsonContent('../json/parameters.json')

resource routetables 'Microsoft.Network/routeTables@2024-01-01' = {
  name:routeTableName
  location:location
  tags:variables.tagsRoutes
  
  properties:{
     disableBgpRoutePropagation: false
  }
}
