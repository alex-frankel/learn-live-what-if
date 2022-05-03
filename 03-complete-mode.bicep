param location string = resourceGroup().location

resource stg1 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: 'adotfrank${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_GRS'
  }
  tags: {
    owner: 'Team B'
  }
}

resource cosmosDbAccount 'Microsoft.DocumentDB/databaseAccounts@2021-10-15' = {
  name: 'name'
  location: location
  kind: 'GlobalDocumentDB'
  properties: {
    consistencyPolicy: {
      defaultConsistencyLevel: 'Eventual'
      maxStalenessPrefix: 1
      maxIntervalInSeconds: 5
    }
    locations: [
      {
        locationName: location
        failoverPriority: 0
      }
    ]
    databaseAccountOfferType: 'Standard'
    enableAutomaticFailover: true
    capabilities: [
      {
        name: 'EnableTable'
      }
    ]
  }
}

// resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
//   name: 'name'
//   location: location
// }

// resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
//   parent: sqlServer
//   name: 'name'
//   location: location
//   properties: {
//     collation: 'collation'
//     edition: 'Basic'
//     maxSizeBytes: 'maxSizeBytes'
//     requestedServiceObjectiveName: 'Basic'
//   }
// }

