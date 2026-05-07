import 'package:flutter/material.dart';
import 'package:riverpod_demo/features/payment/notifiers/payment_notifier.dart';
import 'package:riverpod_demo/features/payment/states/payment_state.dart';

import 'benefit_row.dart';

Widget insuranceWidget(PaymentState state, PaymentNotifier notifier) {
  return Card(
    margin: const EdgeInsets.all(12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: state.insuranceEnabled,
              onChanged: (_) => notifier.toggleInsurance(),
            ),
            const Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Add "),
                    TextSpan(
                      text: "৳10 ",
                      style: TextStyle(color: Colors.orange),
                    ),
                    TextSpan(text: "and secure my travel"),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: notifier.toggleBenefits,
              child: Text(
                state.showBenefits ? "Hide" : "Show Benefits",
              ),
            )
          ],
        ),

        /// Expandable Benefits
        if (state.showBenefits)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: const [
                BenefitRow("Accidental Death", "BDT 2,25,000"),
                BenefitRow("Hospitalization", "BDT 50,000"),
                BenefitRow("Natural Death", "BDT 50,000"),
                BenefitRow("Covid-19", "BDT 5,000"),
              ],
            ),
          ),
      ],
    ),
  );
}