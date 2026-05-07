import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/features/registration/registration_state.dart';

class RegistrationNotifier extends StateNotifier<RegistrationState> {
  RegistrationNotifier() : super(RegistrationState());

  Future<void> register(String email, String password) async {
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
