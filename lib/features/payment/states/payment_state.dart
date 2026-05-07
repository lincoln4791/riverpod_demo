

import 'package:riverpod_demo/features/payment/domain/enums/payment_method_enum.dart';

class PaymentState {
  final bool insuranceEnabled;
  final bool showBenefits;
  final bool termsAccepted;
  final PaymentMethodEnum selectedMethod;

  PaymentState({
    this.insuranceEnabled = false,
    this.showBenefits = false,
    this.termsAccepted = false,
    this.selectedMethod = PaymentMethodEnum.bkash,
  });

  PaymentState copyWith({
    bool? insuranceEnabled,
    bool? showBenefits,
    bool? termsAccepted,
    PaymentMethodEnum? selectedMethod,
  }) {
    return PaymentState(
      insuranceEnabled: insuranceEnabled ?? this.insuranceEnabled,
      showBenefits: showBenefits ?? this.showBenefits,
      termsAccepted: termsAccepted ?? this.termsAccepted,
      selectedMethod: selectedMethod ?? this.selectedMethod,
    );
  }
}