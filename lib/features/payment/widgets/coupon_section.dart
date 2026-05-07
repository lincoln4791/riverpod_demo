import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/features/payment/widgets/coupon_card.dart';
import 'package:riverpod_demo/features/payment/widgets/coupon_input_field.dart';

import '../domain/uimodel/coupon_ui_model.dart';

class CouponSection extends ConsumerWidget {
  const CouponSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coupons = [
      CouponUiModel(
        image: "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
        title: "4-27-2026",
      ),
      CouponUiModel(
        image: "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
        title: "min order",
      ),
      CouponUiModel(
        image: "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
        title: "Coupon apply per user",
      ),
    ];

    return Column(
      children: [
        ...coupons.map((c) => CouponCard(coupon: c)).toList(),
        const SizedBox(height: 12),
        const CouponInputField(),
      ],
    );
  }
}