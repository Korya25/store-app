import 'package:go_router/go_router.dart';
import 'package:store_app/core/resources/router/app_routes.dart';
import 'package:store_app/features/auth/presentation/pages/login_page.dart';
import 'package:store_app/features/auth/presentation/pages/sign_up_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        name: AppRoutes.login,
        path: AppRoutes.login,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        name: AppRoutes.signUp,
        path: AppRoutes.signUp,
        builder: (context, state) => SignUpPage(),
      ),
    ],
  );
}
