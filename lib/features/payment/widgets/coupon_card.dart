import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/features/payment/domain/uimodel/coupon_ui_model.dart';
import 'package:riverpod_demo/features/payment/providers/coupon_provider.dart';

class CouponCard extends ConsumerWidget {
  final CouponUiModel coupon;

  const CouponCard({super.key, required this.coupon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(couponProvider.notifier);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                coupon.image,
                height: 32,
                width: 80,
                fit: BoxFit.contain,
              ),

              /// USE BUTTON
              OutlinedButton.icon(
                onPressed: () {
                  notifier.applyCoupon(coupon.title);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green),
                  foregroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                ),
                icon: const Icon(Icons.add, size: 14),
                label: const Text(
                  "USE",
                  style: TextStyle(fontSize: 11),
                ),
              )
            ],
          ),

          const SizedBox(height: 10),

          /// TITLE
          Row(
            children: [
              const Icon(Icons.local_offer,
                  size: 14, color: Colors.orange),
              const SizedBox(width: 4),
              Text(
                coupon.title,
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          /// TERMS
          const Text(
            "Terms & Conditions",
            style: TextStyle(
              fontSize: 10,
              color: Colors.green,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}