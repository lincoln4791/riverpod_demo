import 'package:flutter/material.dart';

class TermsWidget extends StatelessWidget {
  final bool isAccepted;
  final ValueChanged<bool?> onChanged;
  final String text;

  const TermsWidget({
    super.key,
    required this.isAccepted,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Checkbox(
            value: isAccepted,
            onChanged: onChanged,
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}