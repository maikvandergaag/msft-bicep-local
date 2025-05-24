targetScope = 'local'

@secure()
param githubToken string

param owner string
param repoName string

extension github with {
  token: githubToken
}

resource repo 'Repository' = {
  owner: owner
  name: repoName
  description: 'Test bicep repository'
  visibility: 'Public'
}
