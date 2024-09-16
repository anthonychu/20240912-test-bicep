// output id string = '/subscriptions/30501c6c-81f6-41ac-a388-d29cf43a020d/resourceGroups/20240909-test-bicep/providers/Microsoft.App/managedEnvironments/env-v5q2k4wr4x2x4'

resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2024-02-02-preview' existing = {
  name: 'env-v5q2k4wr4x2x4'
}

output id string = containerAppEnvironment.id
