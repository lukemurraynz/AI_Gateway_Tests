param backend string
param existingUrl string



// Use the parameters to update properties
resource updatedBackend 'Microsoft.ApiManagement/service/backends@2023-09-01-preview' = {
  name: backend
  properties: {
    url: existingUrl  // Use the parameter to keep the existing URL
    protocol: 'http'
    circuitBreaker: {
      rules: [
        {
          failureCondition: {
            count: 3 // Number of failures before tripping the circuit breaker
            errorReasons: [
              'Server errors' // Reasons for the failure
            ]
            interval: 'PT1H' // Time interval to count the failures
            statusCodeRanges: [
              {
               // Define the range of HTTP status codes that will be considered as failures for the circuit breaker
                min: 401 // Minimum status code to consider as a failure (e.g., Unauthorized)
                max: 401 // Maximum status code to consider as a failure (e.g., Unauthorized)
              }
            ]
          }
          name: 'myBreakerRule' // Name of the circuit breaker rule
          tripDuration: 'PT1H' // Duration for which the circuit breaker remains tripped
          acceptRetryAfter: true // Whether to accept retry after the trip duration
        }
      ]
    }
  }
}
