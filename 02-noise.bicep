param location string = resourceGroup().location

// show what this resource looks like in Azure
resource redis 'Microsoft.Cache/redis@2021-06-01' = {
  name: 'adotfrank-redis'
  location: location
  properties: {
    sku: {
      capacity: 1
      family: 'C'
      name: 'Standard'
    }
  }
}
