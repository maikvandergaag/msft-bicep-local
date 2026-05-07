extension az

import { gitHubRepo } from '../../utility/types.bicep'
import { getName } from '../../utility/helper.bicep'

metadata info = {
  title: 'Managed Identity Module'
  version: '1.0.0'
  author: 'maikvandergaag'
}

metadata description = '''
Module for a managed identities
'''

@description('Specifies the name for the managed identity.')
param name string

@allowed([
  'demo'
  'dev'
  'tst'
  'prd'
])
@description('Environment for the managed identity.')
param env string = 'demo'

@description('GitHub repository for the managed identity federation.')
param repo gitHubRepo

resource identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2025-01-31-preview' = {
  name: getName(name, env).managedIdentity
  location: resourceGroup().location
}

resource federatedCredentials 'Microsoft.ManagedIdentity/userAssignedIdentities/federatedIdentityCredentials@2025-01-31-preview' = {
  name: 'github-${repo.name}'
  parent: identity
  properties: {
    audiences: [
      'api://AzureADTokenExchange'
    ]
    issuer: 'https://token.actions.githubusercontent.com'
    subject: 'repo:${repo.organization}/${repo.name}:ref:refs/heads/main'
  }
}

output miClientId string = identity.properties.clientId
output miPrincipalId string = identity.properties.principalId
output miTenantId string = identity.properties.tenantId
output miName string = identity.name
