import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:socialapp/shared/network/endpoints.dart';

class DioHelper {
  static Dio dio = Dio(); // Initialize Dio object
  static const String baseUrl = baseUrl_;
  // static const String baseUrl = 'https://awmarket.onrender.com';
  // static const String baseUrl = 'https://awmarket-backup.onrender.com';
  // static const String baseUrl = 'https://www.algeriadigitalmarket.com/api';
  static CookieJar cookieJar = CookieJar(); // Create a CookieJar
  // Replace with your base URL

  static void init() {
    dio.options.baseUrl = baseUrl; // Make sure to specify the correct URL
    dio.options.receiveDataWhenStatusError = true;
    // dio.options.headers = {
    //   'Content-Type': 'application/json',
    // };
  }

  static Future<bool> checkConn() async {
    return await InternetConnectionChecker().hasConnection;
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? lang = 'en',
    String? token,
  }) async =>
      checkConn().then((value) async {
        if (value) {
          dio.interceptors.add(CookieManager(cookieJar));
          // dio.options.headers = {
          //   'lang': lang,
          //   'Content-Type': 'application/json',
          //   'authorization': token,
          // };
          return await dio.get(
            url,
            queryParameters: query,
          );
        } else {
          return Future.error('error');
        }
      });

  static Future<Response> postData({
    required String endpointPath, // Specify the endpoint path
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? lang = 'en',
    String? token,
    String? otpToken,
  }) async =>
      checkConn().then((value) async {
        if (value) {
          print(value);
          final Uri uri =
              Uri.parse('$baseUrl/$endpointPath'); // Construct the complete URL
          // dio.options.headers = {
          //   'lang': lang,
          //   'Content-Type': 'application/json',
          //   'authorization': token,
          //   'otpToken': otpToken,
          // };
          print('POST Request URL: $uri');

          try {
            dio.interceptors.add(CookieManager(cookieJar));

            return await dio.post(
              uri.toString(), // Use uri.toString() to convert Uri to a string
              queryParameters: query,
              data: data,
            );
          } catch (e) {
            print('POST Request Error: $e');
            rethrow; // Re-throw the exception for error handling at the caller level
          }
        } else {
          return Future.error('connection');
        }
      });

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
//<<<<<<< Abdelmoumen
  }) async {
    dio.interceptors.add(CookieManager(cookieJar));
    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postFormData({
    required String endpointPath, // Specify the endpoint path
    required FormData data,
    Map<String, dynamic>? query,
    String? lang = 'en',
    String? token,
  }) async =>
      checkConn().then((value) async {
        if (value) {
          print(value);
          final Uri uri =
              Uri.parse('$baseUrl/$endpointPath'); // Construct the complete URL
          // dio.options.headers = {
          //   'lang': lang,
          //   'Content-Type': 'application/json',
          //   'authorization': token,
          //   'otpToken': otpToken,
          // };
          print('POST FormData Request URL: $uri');
          print("Data fields${data.fields}");
          print("Data Files${data.files.toString()}");

          try {
            return await dio.post(
              uri.toString(), // Use uri.toString() to convert Uri to a string
              queryParameters: query,
              data: data,
            );
          } catch (e) {
            print('POST FormData Request Error: $e');
            rethrow;
// Replace with an appropriate response // Add this throw statement for error cases
          }
        } else {
          return Future.error('Check your internet connection');
        }
      });
}
