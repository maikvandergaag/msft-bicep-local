using './main.bicep'


param gitHubUser = 'maikvandergaag'

param repo = {
  name: 'bicep-local-repo-ecs2026'
  collaborators:[]
  owner: 'maikvandergaag'
  organization: 'maikvandergaag'
   description: 'Repository created by Bicep'
   visibility: 'Public'
}

param azureResourceGroup = {
  name: 'sponsor-rg-bicep-local'
  location: 'westeurope'
  subscriptionId: 'a61be14b-136e-44e9-a88e-187fa0384d06'
}

param name = 'bicep-local'
