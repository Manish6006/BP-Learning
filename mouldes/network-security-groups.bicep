/*
Create security group 
*/

@description('My NSG name for bicep template')
param myNSGname string

@description('Deployment location')
param location string

resource myNSG 'Microsoft.Network/networkSecurityGroups@2024-01-01' = {
  name: myNSGname
  location: location
}
