
metadata info = {
  title: 'Local Deployment Main bicep file'
  description: 'Local deployment bicep file for creating specific resources'
  version: '1.0.0'
  author: '3fifty'
}

metadata description = '''
Module for creating specific resources by using bicep local.
'''

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


module storageAccount 'modules/azure/storage.bicep' = {
  params: {
    name: name
    location: location
    env: env
  }
}

output storageId string = storageAccount.outputs.storageId
output storageName string = storageAccount.outputs.storageName
