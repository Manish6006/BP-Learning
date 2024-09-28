/*
this is example of creating resource groups
*/

@description('Name of resource-group')
param rgName string

@description('Enter your location')
param mylocation string

//param subscriptions string
targetScope='subscription'

resource myRG 'Microsoft.Resources/resourceGroups@2024-07-01' = {
  name: rgName
  location: mylocation
}
