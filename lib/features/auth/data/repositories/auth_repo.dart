import 'package:store_app/core/constants/app_strings.dart';
import 'package:store_app/core/serivces/graphql/api_result.dart';
import 'package:store_app/features/auth/data/datasources/auth_data_source.dart';
import 'package:store_app/features/auth/data/models/login_request.dart';
import 'package:store_app/features/auth/data/models/login_response.dart';
import 'package:store_app/features/auth/data/models/user_role_response.dart';

class AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepo(this.authDataSource);

  // Login
  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await authDataSource.login(body: body);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(AppStrings.errorMessage);
    }
  }

  // User Role
  Future<UserRoleResponse> userRole(String token) async {
    final response = await authDataSource.userRole(token);
    return response;
  }
}
