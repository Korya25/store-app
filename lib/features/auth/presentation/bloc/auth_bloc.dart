import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/core/serivces/graphql/api_result.dart';
import 'package:store_app/core/serivces/shared_pref/pref_keys.dart';
import 'package:store_app/core/serivces/shared_pref/shared_pref.dart';
import 'package:store_app/features/auth/data/models/login_request.dart';
import 'package:store_app/features/auth/data/repositories/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepo) : super(_Initial()) {
    on<LoginEvent>(_login);
  }
  AuthRepo authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthState.loading());

    final resualt = await authRepo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    await resualt.when(
      // Save the access token to shared preferences
      success: (loginData) async {
        final accessToken = loginData.data.login.accessToken ?? '';
        await SharedPref.preferences.setString(
          PrefKeys.accessToken,
          accessToken,
        );

        // User Role
        final user = await authRepo.userRole(accessToken);

        // user ID
        await SharedPref.preferences.setInt(PrefKeys.userId, user.userId ?? 0);
        await SharedPref.preferences.setString(
          PrefKeys.userRole,
          user.userRole ?? '',
        );
        emit(AuthState.success(userRole: user.userRole ?? ''));
      },
      failure: (error) {
        emit(AuthState.erorr(error: error));
      },
    );
  }
}
