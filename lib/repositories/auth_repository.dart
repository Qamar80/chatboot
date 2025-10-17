

import 'package:chatboot/data/models/api_user_model.dart';

import '../data/network/api_client.dart';


class AuthRepository {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  Future<ApiUserModel> login(String email, String password) async {
    final response = await apiClient.post('/api/auth/login', {
      'email': email,
      'password': password,
    });
    return ApiUserModel.fromJson(response['data']);
  }

  Future<ApiUserModel> register(String name,String email, String password) async {
    final response = await apiClient.post('/api/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });
    return ApiUserModel.fromJson(response['data']);
  }
}
