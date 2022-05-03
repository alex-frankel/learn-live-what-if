// resource group: adotfrank-learn

param location string = resourceGroup().location

resource stg1 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: 'adotfrank${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    // first demo - simple property change
    // allowBlobPublicAccess: false
  }
}

// second demo -- result format
resource stg2 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: 'adotfrank2${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    // publicNetworkAccess: 'Disabled'
  }
}

// link to looping over an array result in powershell
// https://docs.microsoft.com/en-us/cli/azure/use-cli-effectively#scripts


