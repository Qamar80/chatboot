import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class AuthController extends GetxController {
  var isLoading = false.obs;
  var user = {}.obs;
  var token = ''.obs;

  final String baseUrl = "http://localhost:3000";

  // ------------------- Signup -------------------
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      isLoading.value = true;
      var url = Uri.parse("$baseUrl/api/auth/register");
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        }),
      );

      var data = jsonDecode(response.body);
      if (data['success']) {
        user.value = data['user'];
        token.value = data['token'];
        await saveToken(data['token']);
        Get.snackbar("Success", data['message']);
      } else {
        Get.snackbar("Error", data['message']);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ------------------- Login -------------------
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var url = Uri.parse("$baseUrl/api/auth/login");
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      var data = jsonDecode(response.body);
      if (data['success']) {
        user.value = data['user'];
        token.value = data['token'];
        await saveToken(data['token']);
        Get.snackbar("Success", data['message']);
      } else {
        Get.snackbar("Error", data['message']);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ------------------- Save Token -------------------
  Future<void> saveToken(String tokenValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', tokenValue);
  }

  // ------------------- Get Saved Token -------------------
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // ------------------- Logout -------------------
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    user.value = {};
    token.value = '';
  }
}
