targetScope = 'subscription'

import { azureOidc, gitHubRepo } from '../utility/types.bicep'
import { ownerRoleDefinition } from '../utility/fixedvar.bicep'

extension az

@description('Descriptive name for the azure resources')
param name string

@allowed([
  'demo'
  'dev'
  'tst'
  'prd'
])
@description('Environment for the azure resources')
param env string = 'demo'


param repo gitHubRepo

param azureResourceGroup {
  name: string
  location: string
  subscriptionId: string
}

module identity '../.modules/azure/mi.bicep' = {
  name: 'deploy-identity-name'
  params: {
    name: name
    env: env
    repo: repo
  }
  scope: resourceGroup
}

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: azureResourceGroup.name
  location: azureResourceGroup.location
}

module ownerRoleAssignment '../.modules/azure/rbac.bicep' = {
  scope: resourceGroup
  params: {
    principalId: identity.outputs.miPrincipalId
    roleDefinitionId: ownerRoleDefinition
  }
}

output oidcConfig azureOidc = {
  tenantId: subscription().tenantId
  subscriptionId: subscription().subscriptionId
  clientId: identity.outputs.miClientId
}
