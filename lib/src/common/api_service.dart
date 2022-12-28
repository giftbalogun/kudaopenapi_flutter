
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxService {
  static const String noInternetMessage = 'Connection to API server failed due to internet connection';

  // Define a function to get a token from the API
  Future<String> getToken() async {
    // Set the base URL for the API
    String baseUrl = 'https://kuda-openapi.kuda.com/v2';
		String email = 'blgnbalogun53@gmail.com';
		String apikey = '#';

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
    http.Response response = await client.post(Uri.parse(baseUrl + endpoint), headers: headers, body: json.encode({'email': email, 'apikey': apikey}),);

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

 Future<Response> makeRequest(String action, Map<String, dynamic> payload, [String? requestRef])  async {
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
		// Map<String, dynamic> body = {
		// 	'serviceType': action,
		// 	'requestRef': requestRef,
		// 	'data': payload,
		// };
    try {
			http.Response response = await http.post(
				Uri.parse('https://kuda-openapi.kuda.com/v2/'),
				body: json.encode(body),
				headers: headers);
				// debugPrint('====> API MakeRequest statusCode: [${response.statusCode}]');
				debugPrint('====> API MakeRequest Body: [${json.decode(response.body)['data']}]');
				return json.decode(response.body);
		  } catch (e) {
      	return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }
}