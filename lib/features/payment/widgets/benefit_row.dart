import 'package:flutter/material.dart';

class BenefitRow extends StatelessWidget {
  final String title;
  final String amount;

  const BenefitRow(this.title, this.amount, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(amount),
        ],
      ),
    );
  }
}