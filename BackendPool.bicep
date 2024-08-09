param backendnane string
param subscriptionID string
param resourceGroupName string
param APIManagementName string
param backend1 string
param backend2 string

// Use the parameters to update properties
resource updatedBackend 'Microsoft.ApiManagement/service/backends@2023-09-01-preview' = {
  name: '${APIManagementName}/${backendnane}'
  properties: {
    description: 'Load balancer for multiple backends'
    type: 'Pool'
    pool: {
      services: [
        // Define the backend pool configuration for an API Management service
        {
          // Define the first backend with a specific ID, priority, and weight
          id: '/subscriptions/${subscriptionID}/resourceGroups/${resourceGroupName}/providers/Microsoft.ApiManagement/service/${APIManagementName}/backends/${backend1}'
          priority: 1 // Higher priority backend
          weight: 1   // Weight of the backend
        }
        {
          // Define the second backend with a specific ID, priority, and weight
          id: '/subscriptions/${subscriptionID}/resourceGroups/${resourceGroupName}/providers/Microsoft.ApiManagement/service/${APIManagementName}/backends/${backend2}'
          priority: 1 // Lower priority backend
          weight: 1   // Weight of the backend
        }
      ]
   
    }
  
  }
}
