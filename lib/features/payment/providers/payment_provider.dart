import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/features/payment/notifiers/payment_notifier.dart';
import 'package:riverpod_demo/features/payment/states/payment_state.dart';

final paymentProvider =
StateNotifierProvider.autoDispose<PaymentNotifier, PaymentState>(
      (ref) => PaymentNotifier(),
);