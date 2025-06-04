using './main.bicep'


param gitHubUser = 'maikvandergaag'

param repo = {
  name: 'bicep-local-repo'
  collaborators:[]
  owner: 'maikvandergaag'
  organization: 'maikvandergaag'
   description: 'Repository created by Bicep'
   visibility: 'Public'
}

param azureResourceGroup = {
  name: 'sponsor-rg-bicep-local'
  location: 'westeurope'
  subscriptionId: 'f124b668-7e3d-4b53-ba80-09c364def1f3'
}

param name = 'bicep-local'
