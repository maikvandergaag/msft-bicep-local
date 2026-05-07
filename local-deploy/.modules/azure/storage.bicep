extension az

metadata info = {
  title: 'Storage Account Module'
  description: 'Module for setting up a Storage Account component'
  version: '1.0.0'
  author: '3fifty'
}

metadata description = '''
Module for creating a new Storage Account instance.
'''

@description('descriptive name for the storage account')
param name string

@description('location for the storage account')
param location string = resourceGroup().location

@allowed([
  'dev'
  'tst'
  'prd'
])
@description('environment for the storage account')
param env string = 'dev'

var storageName = toLower('st${take(replace(name, '-',''), 19)}${env}')

resource storage 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}

output storageId string = storage.id
output storageName string = storage.name
