using 'github.bicep'

// Use the following to set the token:
// export GITHUB_TOKEN=$(gh auth token)
param githubToken = readEnvironmentVariable('GITHUB_TOKEN')

param owner = 'maikvandergaag'
param repoName = 'local-deploy-bicep-test'
param collaboratorName = 'maikvandergaag'
