module envFromModule 'nested.bicep' = {
  name: 'container-app-environment'
}

resource testJob 'Microsoft.App/jobs@2024-02-02-preview' = {
  name: 'test-job'
  location: 'Canada Central'
  properties: {
    environmentId: envFromModule.outputs.id
    workloadProfileName: 'Consumption'
    configuration: {
      triggerType: 'Schedule'
      replicaTimeout: 1800
      replicaRetryLimit: 0
      scheduleTriggerConfig: {
        replicaCompletionCount: 1
        cronExpression: '*/5 * * * *'
        parallelism: 1
      }
    }
    template: {
      containers: [
        {
          image: 'ubuntu'
          name: 'job'
          command: [
            '/bin/bash'
          ]
          args: [
            '-c'
            'echo "Hello, World!"'
          ]
          resources: {
            cpu: 1
            memory: '2Gi'
          }
        }
      ]
    }
  }
}
