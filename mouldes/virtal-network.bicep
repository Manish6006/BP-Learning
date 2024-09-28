/*
Creating the virtual networking using bicep template
*/

@description('Define vnet name')
param vnetName string 

@description('Define the location')
param location string

@description('Define tags')
param tags object = {
  Environment: 'Development'
  Project: 'MyProject'
  Team: 'BP-knights-riders'
}

resource vnet 'Microsoft.Network/virtualNetworks@2024-01-01' = {
  name: vnetName
   tags:tags
   location: location
   properties:{
    ipAllocations:[]
    subnets:[]
    enableDdosProtection:false
    enableVmProtection: false
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16' // Ensure this is specified
      ]
    }
  }
}
