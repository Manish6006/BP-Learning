/*
Create security group 
*/

@description('My NSG name for bicep template')
param myNSGname string

@description('Deployment location')
param location string


var variables= loadJsonContent('../json/parameters.json')


resource myNSG 'Microsoft.Network/networkSecurityGroups@2024-01-01' = {
  name: myNSGname
  location: location
  tags: variables.tags
  properties:{
  securityRules: variables.inboundRules // No rules defined
  }
}

output myNSGid string = myNSG.id
