extension local

targetScope = 'local'

param name string

resource sayHelloWithPowerShell 'Script' = {
  type: 'powershell'
  script: replace(loadTextContent('./script.ps1'), '$INPUT_NAME', name)
}

output stdout string = sayHelloWithPowerShell.stdout
