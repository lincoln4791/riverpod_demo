import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/coupon_notifier.dart';
import '../states/coupon_state.dart';

final couponProvider =
StateNotifierProvider.autoDispose<CouponNotifier, CouponState>(
      (ref) => CouponNotifier(),
);