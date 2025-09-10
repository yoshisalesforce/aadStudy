public with sharing class ContinuationController {
    // Unique label corresponding to the continuation
    public String requestLabel;
    // Result of callout
    public Integer result {get;set;}
    // Callout endpoint as a named credential URL
    // or, as shown here, as the long-running service URL
    private static final String LONG_RUNNING_SERVICE_URL =
        'https://jsonplaceholder.typicode.com/todos/1';

   // Action method
    public Object startRequest() {
      // Create continuation with a timeout
      Continuation con = new Continuation(120);
      // Set callback method
      con.continuationMethod='processResponse';

      // Create callout request
      HttpRequest req = new HttpRequest();
      req.setMethod('GET');
      req.setEndpoint(LONG_RUNNING_SERVICE_URL);

      // Add callout request to continuation
      this.requestLabel = con.addHttpRequest(req);

      // Return the continuation
      return con;
    }

    // Callback method
    public Object processResponse() {
      // Get the response by using the unique label
      HttpResponse response = Continuation.getResponse(this.requestLabel);
      // Set the result variable that is displayed on the Visualforce page
      Map<String, Object> jsonResult = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
      Integer userId = (Integer) jsonResult.get('userId');
      this.result = userId;

      // Return null to re-render the original Visualforce page
      return null;
    }
}