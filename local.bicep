targetScope = 'local'

metadata info = {
  title: 'Local Deployment incapsulation bicep file'
  description: 'Local deployment bicep file for creating resources with the local deployment method'
  version: '1.0.0'
  author: 'Maik van der Gaag'
}

metadata description = '''
File to use for local deployment methods.
'''

@description('Subscription ID for the deployment')
param subscriptionId string

@description('Resource Group Name for the deployment')
param rgName string

@description('descriptive name for the resources')
param name string

@description('location for the resources')
param location string

@allowed([
  'dev'
  'tst'
  'prd'
])
@description('environment of the resources')
param env string = 'dev'

// this will create an actual deployment on Azure
module resources 'main.bicep' = {
  params: {
    name: name
    location: location
    env: env
  }
  scope: resourceGroup(subscriptionId, rgName)
}

module http 'http/http.bicep' = {
  params: {
    coords: {
      lattitude: '47.6363726'
      longitude: '-122.1357068'
    }
  }
}

module localscript 'script/script.bicep' = {
  params: {
    name: name
  }
}

output scriptOutput string = localscript.outputs.stdout
output httpOutput array = http.outputs.forecast

