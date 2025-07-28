import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:store_app/core/serivces/graphql/api_service.dart';
import 'package:store_app/core/serivces/graphql/graphql_quaries/auth/auth_quaries.dart';
import 'package:store_app/features/auth/data/models/login_request.dart';
import 'package:store_app/features/auth/data/models/login_response.dart';
import 'package:store_app/features/auth/data/models/user_role_response.dart';

class AuthDataSource {
  const AuthDataSource(this._graphql);

  final ApiService _graphql;

  // Login
  Future<LoginResponse> login({required LoginRequestBody body}) async {
    final response = await _graphql.login(
      AuthQuaries().loginMapQuery(body: body),
    );

    return response;
  }

  // User Role
  Future<UserRoleResponse> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.userRole();
    if (kDebugMode) {
      print('User Role Response: ${response.userRole}');
    }
    return response;
  }
}
