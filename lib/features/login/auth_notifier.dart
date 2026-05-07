import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/core/app_router.dart';
import 'package:riverpod_demo/features/login/login_screen.dart';

import 'auth_state.dart';


class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await Future.delayed(Duration(seconds: 2)); // simulate API

      if (email == "1" && password == "1") {
        state = state.copyWith(
          isLoading: false,
          user: email,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: "Invalid credentials",
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "Something went wrong",
      );
    }
  }


}