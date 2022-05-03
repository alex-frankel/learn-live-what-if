// https://docs.microsoft.com/en-us/learn/modules/arm-template-whatif/4-exercise-what-if?tabs=screenshpt&pivots=bicepcli

resource vnet 'Microsoft.Network/virtualNetworks@2018-10-01' = {
  name: 'vnet-001'
  location: resourceGroup().location
  tags: {
    'CostCenter': '12345'
    'Owner': 'Team A' // delete me
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16' // change me
      ]
    }
    enableVmProtection: false
    enableDdosProtection: false
    subnets: [
      // delete me
      {
        name: 'subnet001'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'subnet002'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

// use complete mode after validing the changes
