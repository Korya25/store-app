import 'package:store_app/features/auth/data/models/login_request.dart';

class AuthQuaries {
  factory AuthQuaries() {
    return _instance;
  }

  const AuthQuaries._();

  static final AuthQuaries _instance = const AuthQuaries._();

  Map<String, dynamic> loginMapQuery({required LoginRequestBody body}) {
    return {
      "query": r'''  
          mutation Login($email: String!, $password: String!){
	        login(email: $email, password: $password) {
		      access_token
		      refresh_token
	        }
          }
       ''',

      "variables": {'email': body.email, 'password': body.password},
    };
  }
}
