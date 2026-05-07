extension microsoftGraphV1
targetScope = 'subscription'

param name string = 'default-ecs2026'

var groupName = 'sg-${name}'

// create security group and add user list as members
resource group 'Microsoft.Graph/groups@v1.0' = {
  displayName: groupName
  mailEnabled: false
  mailNickname: uniqueString(groupName)
  securityEnabled: true
  uniqueName: groupName
}

output groupName string = group.displayName
output groupId string = group.id
