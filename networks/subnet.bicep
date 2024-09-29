/*
Create subnet for existing vnet
*/

var variables= loadJsonContent('../json/parameters.json')

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2024-01-01' = {
  
  name: variables.subnetName
  parent:vnet
  properties: {
    addressPrefix:variables.addressPrefixSubnet
    delegations: [
      {
        name: variables.subnetDelegations
        properties:{
          serviceName: 'Microsoft.ContainerInstance/containerGroups'
        }
      }
    ]
    networkSecurityGroup: {
      id: nsg.id
    }
    routeTable:{
      id:routeTable.id
    }
    applicationGatewayIPConfigurations: [{}]
    defaultOutboundAccess: false
    ipAllocations: [{}]
    natGateway: {}
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Disabled'
    serviceEndpointPolicies: [{}]
    serviceEndpoints: [{}]
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2024-01-01' existing = {
  name: variables.vnetName
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2024-01-01' existing = {
  name: variables.subnetName
}
resource routeTable 'Microsoft.Network/routeTables@2024-01-01' existing = {
  name: variables.vnetName
}
