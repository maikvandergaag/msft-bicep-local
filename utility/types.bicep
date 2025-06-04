@export()
type gitHubRepo = {
  owner: string
  name: string
  organization: string
  description: string
  visibility: 'Public' | 'Private'
  collaborators: string[]
}

@secure()
@export()
type azureOidc = {
  tenantId: string
  subscriptionId: string
  clientId: string
}

@export()
type azureNames = {
  storageAccount: string
  logAnalytics: string
  applicationInsights: string
  resourceGroup: string
  managedIdentity: string
}
