// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxService {

  static String? _baseurl;
  static String? _email;
  static String? _apikey;

  static Future<void> initialize(String baseurl, email, apikey) async {
    _baseurl = baseurl;
    _email = email;
    _apikey = apikey;
  }

  // Define a function to get a token from the API
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
      //debugPrint('====> API Response: [${data}]');
      return data;
    } else {
      // If the request was not successful, throw an exception
      throw Exception('Failed to get token');
    }
  }

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
      'data': json.encode({
        'serviceType': action,
        'requestRef': requestRef,
        'data': payload,
      }),
    };
    try {
      http.Response response = await http.post(
          Uri.parse(_baseurl!),
          body: json.encode(body),
          headers: headers);
      //
      debugPrint('====> API MakeRequest Body: [${json.decode(response.body)}]');
      return json.decode(response.body);
    } catch (e) {
      return {
        'statusCode': 1,
        'statusText': 'No internet connection',
      };
    }
  }
}
