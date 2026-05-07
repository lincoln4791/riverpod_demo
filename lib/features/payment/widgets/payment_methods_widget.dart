import 'package:flutter/material.dart';
import 'package:riverpod_demo/features/payment/domain/enums/payment_method_enum.dart';

class PaymentMethodsWidget extends StatelessWidget {
  final PaymentMethodEnum selectedMethod;
  final ValueChanged<PaymentMethodEnum> onSelect;

  const PaymentMethodsWidget({
    super.key,
    required this.selectedMethod,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final methods = {
      PaymentMethodEnum.bkash: "bKash",
      PaymentMethodEnum.nagad: "Nagad",
      PaymentMethodEnum.ssl: "SSLCOMMERZ",
      PaymentMethodEnum.amex: "Amex",
      PaymentMethodEnum.visa: "Visa",
      PaymentMethodEnum.mastercard: "MasterCard",
    };

    return Card(
      margin: const EdgeInsets.all(12),
      child: Column(
        children: methods.entries.map((entry) {
          final selected = selectedMethod == entry.key;

          return GestureDetector(
            onTap: () => onSelect(entry.key),
            child: Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: selected ? Colors.green : Colors.transparent,
                ),
                color: const Color(0xffF4F4F4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry.value),
                  if (selected)
                    const Icon(Icons.check, color: Colors.green),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}