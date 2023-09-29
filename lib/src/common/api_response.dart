class ApiResponse {
  static String getMessageForStatusCode(int statusCode) {
    switch (statusCode) {
      case 200:
        return 'Success. Everything worked as intended.';
      case 201:
        return 'Success. A new resource was created.';
      case 202:
        return 'Accepted. Request accepted and queued for execution.';
      case 204:
        return 'Successful. No Content, typically used when deleting requests.';
      case 400:
        return 'An Exception occurred.';
      case 401:
        return 'Authentication failure.';
      case 403:
        return 'Forbidden.';
      case 404:
        return 'Resource not found.';
      case 405:
        return 'Method Not Allowed.';
      case 409:
        return 'Conflict.';
      case 412:
        return 'Precondition Failed.';
      case 413:
        return 'Request Entity Too Large.';
      case 500:
        return 'Internal Server Error.';
      case 501:
        return 'Not Implemented.';
      case 503:
        return 'Service Unavailable.';
      default:
        return 'Unknown status code: $statusCode';
    }
  }
}
