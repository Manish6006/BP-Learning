/*
Create security group 
*/

@description('My NSG name for bicep template')
param myNSGname string

@description('Deployment location')
param location string

@description('Tags for the NSG')
param tags object = {
  Environment: 'Development'
  Project: 'MyProject'
}



resource myNSG 'Microsoft.Network/networkSecurityGroups@2024-01-01' = {
  name: myNSGname
  location: location
  tags:tags
  properties:{
  securityRules: [] // No rules defined
  }
}


output myNSGid string = myNSG.id
