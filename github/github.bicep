targetScope = 'local'

import { gitHubRepo, azureOidc } from '../utility/types.bicep'

extension github with {
  token: githubToken
}

@secure()
param githubToken string

@description('The Azure OIDC information to use for the GitHub Actions')
param azureInfo azureOidc

@description('The GitHub repository to create with all information')
param repo gitHubRepo 

resource repository 'Repository' = {
  owner: repo.owner
  name: repo.name
  description: repo.description
  visibility:  repo.visibility
}

resource collaborators 'Collaborator' = [
  for user in repo.collaborators: {
    owner: repo.organization
    repo: repo.name
    user: user
    permission: 'write'
  }
]

resource tenantIdSecret 'ActionsSecret' = {
  owner: repo.owner
  repo: repo.name
  name: 'AZURE_TENANT_ID'
  #disable-next-line use-secure-value-for-secure-inputs
  value: azureInfo.tenantId
}

resource subscriptionIdSecret 'ActionsSecret' = {
  owner: repo.owner
  repo: repo.name
  name: 'AZURE_SUBSCRIPTION_ID'
  #disable-next-line use-secure-value-for-secure-inputs
  value: azureInfo.subscriptionId
}

resource clientIdSecret 'ActionsSecret' = {
  owner: repo.owner
  repo: repo.name
  name: 'AZURE_CLIENT_ID'
  #disable-next-line use-secure-value-for-secure-inputs
  value: azureInfo.clientId
}

