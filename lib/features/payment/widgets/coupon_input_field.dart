import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/coupon_provider.dart';

class CouponInputField extends ConsumerStatefulWidget {
  const CouponInputField({super.key});

  @override
  ConsumerState<CouponInputField> createState() =>
      _CouponInputFieldState();
}

class _CouponInputFieldState
    extends ConsumerState<CouponInputField> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(couponProvider.notifier);

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xffF4F4F4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.confirmation_number,
              size: 18, color: Colors.blue),

          const SizedBox(width: 6),

          /// INPUT
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter Coupon Code",
                border: InputBorder.none,
              ),
            ),
          ),

          /// APPLY BUTTON
          ElevatedButton(
            onPressed: () {
              notifier.applyCoupon(controller.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff3070B6),
              padding: const EdgeInsets.symmetric(horizontal: 14),
            ),
            child: const Text(
              "APPLY",
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}