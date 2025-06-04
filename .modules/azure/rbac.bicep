extension az

metadata info = {
  title: 'RBAC Module'
  version: '1.0.0'
  author: 'maikvandergaag'
}

metadata description = '''
Module for Role Based Access Control
'''
@description('Principal ID of the service principal to assign the role to.')
param principalId string

@description('Role definition ID to assign to the service principal.')
param roleDefinitionId string

resource roleDefinition 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
  scope: tenant()
  name: roleDefinitionId
}

resource ownerRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(principalId, roleDefinition.id, resourceGroup().id)
  properties: {
    principalId: principalId
    roleDefinitionId: roleDefinition.id
    principalType: 'ServicePrincipal'
  }
}
