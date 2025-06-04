targetScope = 'local'

import { gitHubRepo } from './utility/types.bicep'

extension az
extension local

metadata info = {
  title: 'Local Deployment Main bicep file'
  description: 'Local deployment bicep file for creating specific resources'
  version: '1.0.0'
  author: '3fifty'
}

metadata description = '''
Main file for creating specific resources by using bicep local.
'''

@description('Descriptive name for the Azure resources')
param name string

@description('The GitHub user to retrieve the auth token for when having multiple tokens set')
param gitHubUser string = ''

@description('The information about the GitHub repository to create')
param repo gitHubRepo

param azureResourceGroup {
  name: string
  location: string
  subscriptionId: string
}

module gitToken '.modules/script/get-local-token.bicep' ={
  name: 'get-github-auth-token'
  params: {
    username: gitHubUser
  }
}

module github './github/github.bicep' = {
  name: 'deploy-github-repo'
  params: {
    githubToken:  gitToken.outputs.token
    repo: repo
    azureInfo: azure.outputs.oidcConfig
  }
}

module azure './azure/azure.bicep' = {
  scope: subscription(azureResourceGroup.subscriptionId)
  params: {
    name: name
    repo: repo
    azureResourceGroup: {
      name: azureResourceGroup.name
      location:azureResourceGroup.location
      subscriptionId: azureResourceGroup.subscriptionId
    }
  }
}
