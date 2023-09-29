// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kudaopenapi/src/common/api_response.dart';

class ApiService extends GetxService {
  static String? _baseurl;
  static String? _email;
  static String? _apikey;

  static Future<void> initialize(String baseurl, email, apikey) async {
    _baseurl = baseurl;
    _email = email;
    _apikey = apikey;
  }

  /// Define a function to get a token from the API
  Future<String> getToken() async {
    // Set the base URL for the API
    String baseUrl = _baseurl!;
    String email = _email!;
    String apikey = _apikey!;

    // Set the endpoint for the API call
    String endpoint = '/Account/GetToken';

    // Set the headers for the HTTP request
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cache-Control': 'no-cache',
    };

    // Set up the HTTP client
    http.Client client = http.Client();

    // Make the HTTP POST request to the API
    http.Response response = await client.post(
      Uri.parse(baseUrl + endpoint),
      headers: headers,
      body: json.encode({'email': email, 'apikey': apikey}),
    );

    // Check the status code of the response
    if (response.statusCode == 200) {
      // If the request was successful, parse the JSON response
      String data = json.decode(json.encode(response.body));
      // Return the token
      return data;
    } else {
      // If the request was not successful, throw an exception
      throw Exception('Failed to get token');
    }
  }

  ///Make a request with Token
  // Future<Map<String, dynamic>> makeRequest(
  //     String action, Map<String, dynamic> payload,
  //     [String? requestRef]) async {
  //   // Set the headers for the HTTP request
  //   Map<String, String> headers = {
  //     'Authorization': 'Bearer ${await getToken()}',
  //     'Content-Type': 'application/json',
  //   };

  //   // Set the request body
  //   Map<String, dynamic> body = {
  //     'servicetype': action,
  //     'requestref': requestRef,
  //     'data': payload,
  //   };

  //   try {
  //     http.Response response = await http.post(Uri.parse(_baseurl!),
  //         body: json.encode(body), headers: headers);
  //     return json.decode(response.body);
  //   } catch (e) {
  //     return {
  //       'statusCode': ApiResponse.getMessageForStatusCode(401),
  //       'statusText': 'No internet connection',
  //     };
  //   }
  // }

  Future<Map<String, dynamic>> makeRequest(
      String action, Map<String, dynamic> payload,
      [String? requestRef]) async {
    // Set the headers for the HTTP request
    Map<String, String> headers = {
      'Authorization': 'Bearer ${await getToken()}',
      'Content-Type': 'application/json',
    };

    // Set the request body
    Map<String, dynamic> body = {
      'servicetype': action,
      'requestref': requestRef,
      'data': payload,
    };

    try {
      http.Response response = await http.post(Uri.parse(_baseurl!),
          body: json.encode(body), headers: headers);

      // Handle different status codes here
      if (response.statusCode == 200) {
        // Request successful, parse and return the response body
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        // Authentication failure
        return {
          'statusCode': response.statusCode,
          'statusText': ApiResponse.getMessageForStatusCode(401),
        };
      } else if (response.statusCode == 404) {
        // Resource not found
        return {
          'statusCode': response.statusCode,
          'statusText': ApiResponse.getMessageForStatusCode(404),
        };
      }
      // Handle more status codes as needed

      // If the status code is not explicitly handled, return a generic error
      return {
        'statusCode': response.statusCode,
        'statusText': 'Error: ${response.reasonPhrase}',
      };
    } catch (e) {
      // If there's an exception (e.g., no internet connection), return an error
      return {
        'statusCode': ApiResponse.getMessageForStatusCode(503),
        'statusText': 'No internet connection',
      };
    }
  }
}
