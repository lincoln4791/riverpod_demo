import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/features/payment/domain/enums/payment_method_enum.dart';
import 'package:riverpod_demo/features/payment/states/payment_state.dart';

class PaymentNotifier extends StateNotifier<PaymentState> {
  PaymentNotifier() : super(PaymentState());

  void toggleInsurance() {
    state = state.copyWith(insuranceEnabled: !state.insuranceEnabled);
  }

  void toggleBenefits() {
    state = state.copyWith(showBenefits: !state.showBenefits);
  }

  void toggleTerms() {
    state = state.copyWith(termsAccepted: !state.termsAccepted);
  }

  void selectMethod(PaymentMethodEnum method) {
    state = state.copyWith(selectedMethod: method);
  }
}