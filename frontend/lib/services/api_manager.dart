import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/**
 * Classe generica per la gestione delle api
 * 
 */

class ApiManager {
  final String baseUrl;
  final String? accessToken;

  ApiManager({required this.baseUrl, this.accessToken});

  Map<String, String> getHeaders() {
    final headers = <String, String>{
      'accept': 'application/json',
    };

    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    return headers;
  }
//FETCH
  Future<T?> get<T>(String endpoint, T Function(dynamic json) fromJson) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: getHeaders(),
      );

      if (response.statusCode == 200) {
        final dynamic json = jsonDecode(response.body);
        if (json != null) {
          return fromJson(json);
        }
      }
      debugPrint(response.statusCode.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
//POST
  Future<bool> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          ...getHeaders(),
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        debugPrint(response.statusCode.toString());
        return true;
      }
      debugPrint(response.statusCode.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
//PUT
  Future<bool> put(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          ...getHeaders(),
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        return true;
      }
      debugPrint(response.statusCode.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
//DELETE
  Future<bool> delete(String endpoint) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$endpoint'),
        headers: getHeaders(),
      );

      if (response.statusCode == 204) {
        debugPrint(response.statusCode.toString());
        return true;
      }
      debugPrint(response.statusCode.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
