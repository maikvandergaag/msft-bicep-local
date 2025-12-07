# Bicep Local

## Overview

This repository demonstrates local Bicep deployments and configuration for secure, offline, or air-gapped environments.

## Deployment

- No direct connection with the internet is required for deployments.
- Uses local and private Bicep extensibility features.

## Deployment

To deploy this setup with the bicep local deploy option use the following snippet.

```bash
bicep local-deploy .\main.bicepparam
```


## Bicep Configuration Example

Below is a sample `bicepconfig.json` with all available analyzer rules set to `error` for maximum code quality enforcement:

```json
{
  "experimentalFeaturesEnabled": {
    "localDeploy": true
  },
  "cloud": {
    "credentialPrecedence": [
      "AzureCLI"
    ],
    "currentProfile": "AzureCloud"
  },
  "extensions": {
    "http": "br:bicepextdemo.azurecr.io/extensions/http:0.1.1",
    "local": "br:bicepextdemo.azurecr.io/extensions/local:0.1.4",
    "github": "br:bicepextdemo.azurecr.io/extensions/github:0.1.7",
    "msGraph": "br:mcr.microsoft.com/bicep/extensions/microsoftgraph/v1.0:0.1.8-preview"
  },
  "implicitExtensions": [],
  "analyzers": {
    "core": {
      "enabled": true,
      "rules": {
        "no-unused-params": { "level": "error" },
        "no-hardcoded-env-urls": { "level": "error" },
        "no-unused-vars": { "level": "error" },
        "no-location": { "level": "error" },
        "secure-parameter-default": { "level": "error" },
        "use-stable-vm-image": { "level": "error" },
        "admin-username": { "level": "error" },
        "api-versions-should-be-recent": { "level": "error" },
        "disallowed-types": { "level": "error" },
        "no-debug-assert": { "level": "error" },
        "no-empty-outputs": { "level": "error" },
        "no-hardcoded-passwords": { "level": "error" },
        "no-unnecessary-dependson": { "level": "error" },
        "output-should-not-contain-secrets": { "level": "error" },
        "parameters-should-not-contain-secrets": { "level": "error" },
        "resource-name-limits": { "level": "error" },
        "secure-outputs": { "level": "error" },
        "simplify-expressions": { "level": "error" },
        "use-module-bodies": { "level": "error" }
      }
    }
  }
}
```

## Install Nightly Builds

**CLI Version**

```powershell
iex "& { $(irm https://aka.ms/bicep/nightly-cli.ps1) }"
```

**Visual Studio Code Extension**

```powershell
iex "& { $(irm https://aka.ms/bicep/nightly-vsix.ps1) }"
```

**Latest Build Bicep Local**

Follow this link and select the appropriate build:  
https://github.com/Azure/bicep/actions/workflows/build.yml?query=branch%3Amain+is%3Asuccess


## Tracing

Perform the following command to enable tracing

**cmd**
```
set BICEP_TRACING_ENABLED=true
```

**powershell**
```
$env:BICEP_TRACING_ENABLED=$true
```

---

## Notes

- For best practices on Azure Bicep code generation and deployment, refer to the [official documentation](https://learn.microsoft.com/azure/azure-resource-manager/bicep/).
- Ensure your environment meets the prerequisites for local deployments