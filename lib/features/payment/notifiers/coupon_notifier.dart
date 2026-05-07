import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/coupon_state.dart';

class CouponNotifier extends StateNotifier<CouponState> {
  CouponNotifier() : super(CouponState());

  void applyCoupon(String code) {
    state = state.copyWith(appliedCode: code);
  }
}