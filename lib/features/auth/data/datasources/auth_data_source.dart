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
}
