targetScope = 'local'

metadata info = {
  title: 'Get GitHub Auth Token'
  version: '1.0.0'
  author: 'maikvandergaag'
}

metadata description = '''
Module for getting the GitHub auth token using the GitHub CLI.
'''

extension local

param username string  = ''

resource getAuthToken 'Script' = {
  type: 'powershell'
  script: username == '' ? 'gh auth token' : 'gh auth token -u ${username}'
}

output token string = trim(getAuthToken.stdout)
