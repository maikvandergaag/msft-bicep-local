
import * as varItem from 'fixedvar.bicep'
import {azureNames} from 'types.bicep'


@export()
func getName(name string, env string) azureNames =>
  {
    storageAccount: '${varItem.storageabbreviation}${take(replace(name, '-',''), 18)}${env}'
    logAnalytics: '${varItem.loganalyticsabbreviation}-${name}-${env}'
    applicationInsights: '${varItem.applicationinsightsabbreviation}-${name}-${env}'
    managedIdentity: '${varItem.managedidentityabbreviation}-${name}-${env}'
    resourceGroup: '${varItem.resourcegroupabbreviation}-${name}-${env}'
  }
