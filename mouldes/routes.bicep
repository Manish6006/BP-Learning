/*
Create the routes for existing route tables
*/

@description('Enter the route name')
param routeName string

@description('Enter the route tables name ')
param routeTableName string



resource routeTables 'Microsoft.Network/routeTables@2024-01-01' existing = {
  name: routeTableName
}

resource routes 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: routeName
  parent: routeTables
  properties:{
     nextHopType:'VirtualNetworkGateway'
     addressPrefix: '10.2.0.0/16'
    }
}
