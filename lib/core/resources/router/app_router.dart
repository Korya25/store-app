import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/di/injuction.dart';
import 'package:store_app/core/resources/router/app_routes.dart';
import 'package:store_app/core/serivces/shared_pref/pref_keys.dart';
import 'package:store_app/core/serivces/shared_pref/shared_pref.dart';
import 'package:store_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:store_app/features/auth/presentation/pages/login_page.dart';
import 'package:store_app/features/auth/presentation/pages/sign_up_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation:
        SharedPref.preferences.getString(PrefKeys.accessToken) != null
        ? (SharedPref.preferences.getString(PrefKeys.userRole) == 'admin'
              ? AppRoutes.admin
              : AppRoutes.customer)
        : AppRoutes.login,

    routes: [
      GoRoute(
        name: AppRoutes.login,
        path: AppRoutes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<AuthBloc>(),
          child: LoginPage(),
        ),
      ),
      GoRoute(
        name: AppRoutes.signUp,
        path: AppRoutes.signUp,
        builder: (context, state) => SignUpPage(),
      ),

      GoRoute(
        name: AppRoutes.admin,
        path: AppRoutes.admin,
        builder: (context, state) =>
            Scaffold(body: Center(child: Text('Admin Page'))),
      ),
      GoRoute(
        name: AppRoutes.customer,
        path: AppRoutes.customer,
        builder: (context, state) =>
            Scaffold(body: Center(child: Text('Customer Page'))),
      ),
    ],
  );
}
