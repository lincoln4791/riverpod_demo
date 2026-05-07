import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/features/payment/widgets/coupon_section.dart';
import 'package:riverpod_demo/features/payment/widgets/insurance_widget.dart';
import 'package:riverpod_demo/features/payment/widgets/payment_methods_widget.dart';
import 'package:riverpod_demo/features/payment/providers/payment_provider.dart';
import 'package:riverpod_demo/features/payment/widgets/summary_section_widget.dart';
import 'package:riverpod_demo/features/payment/widgets/terms_widget.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentProvider);
    final notifier = ref.read(paymentProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xffF2F5F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              insuranceWidget(state, notifier),
              TermsWidget(isAccepted: state.termsAccepted, onChanged: (bool? value) {
                //state.termsAccepted=value;
                notifier.toggleTerms();
              }, text: 'I agree to Terms of Use, Privacy Policy and Cancellation Policy',),
              PaymentMethodsWidget(selectedMethod:state.selectedMethod,onSelect: (item){
                notifier.selectMethod(item);
              }),
              CouponSection(),
              summarySectionWidget(state),
            ],
          ),
        ),
      ),
    );
  }
}