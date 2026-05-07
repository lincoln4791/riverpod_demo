import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/features/registration/registration_notifier.dart';
import 'package:riverpod_demo/features/registration/registration_state.dart';

final registrationProvider =
StateNotifierProvider<RegistrationNotifier, RegistrationState>((ref) {
  return RegistrationNotifier();
});
