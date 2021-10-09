///
/// This file contains commonly used methods to send request to severs,
/// hence it is required in most cases to attach headers etc we can setup
/// globally here
///
/// Author: Muhammad Rehan
/// email: mrmuhammadrehan65@gmail.com
///
/// This code is subjected to an assment, you might want to
/// copy this code and modify as your own need, you are free to
/// use this code as your own.
///

import 'dart:io';
import 'package:http/http.dart' as http;

class HttpController {
  static post({required String url, dynamic body}) async {
    return await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Charset": 'utf-8',
        // HttpHeaders.authorizationHeader: 'Bearer ' + Memory.token,
      },
      body: body,
    );
  }

  static put({required String url, dynamic body}) async {
    return await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        // HttpHeaders.authorizationHeader: 'Bearer ' + Memory.token,
      },
      body: body,
    );
  }

  static get({required String url}) async {
    return await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        // HttpHeaders.authorizationHeader: 'Bearer ' + Memory.token,
      },
    );
  }

  static delete({required String url}) async {
    return await http.delete(Uri.parse(url), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      // HttpHeaders.authorizationHeader: 'Bearer ' + Memory.token
    });
  }
}
