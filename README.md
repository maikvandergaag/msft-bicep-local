# msft-bicep-local

# Deployment

- No direct connection with internet


# Bicep Config Minimal

```json
{
    "experimentalFeaturesEnabled": {
      "extensibility": true,
      "localDeploy": true
    },
    "cloud": {
      "credentialPrecedence": [
        "AzureCLI"
      ],
      "currentProfile": "AzureCloud"
    }
  }
```

## Install Nightly Builds

**CLI Version**

```
iex "& { $(irm https://aka.ms/bicep/nightly-cli.ps1) } 
```

**Visual Studio Code Extension**

```
iex "& { $(irm https://aka.ms/bicep/nightly-vsix.ps1) }" 
```

**Latest Build Bicep Local**

Follow this link and select the appropriate build. https://github.com/Azure/bicep/actions/workflows/build.yml?query=branch%3Amain+is%3Asuccess