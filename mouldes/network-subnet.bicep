/*
Create subnet for existing vnet
*/

@description('Enter thr subet name')
param subnetName string

@description('Enter existing Vnet name')
param vnetName string

@description('Define the name of delegations of subnet')
param myDelegations string

resource vnet 'Microsoft.Network/virtualNetworks@2024-01-01' existing = {
  name: vnetName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2024-01-01' = {
  
  name: subnetName
  parent:vnet
  properties:{
    addressPrefix: '10.0.1.0/24'
    delegations: [{
        name: myDelegations
        properties:{
          serviceName: 'Microsoft.ContainerInstance/containerGroups'
        }
    }]
  }
}
