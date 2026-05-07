import 'package:flutter/material.dart';
import 'package:riverpod_demo/features/payment/states/payment_state.dart';

Widget summarySectionWidget(PaymentState state) {
  final ticket = 500;
  final fee = 40;
  final insurance = state.insuranceEnabled ? 10 : 0;

  final total = ticket + fee + insurance;

  return Card(
    margin: const EdgeInsets.all(12),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _row("Ticket Price", "৳ $ticket"),
          _row("Processing Fee", "৳ $fee"),
          _row("Insurance", "৳ $insurance"),
          const Divider(),
          _row("Total", "৳ $total", isBold: true),
        ],
      ),
    ),
  );
}

Widget _row(String title, String value, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}