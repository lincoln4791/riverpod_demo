class CouponState {
  final String appliedCode;

  CouponState({this.appliedCode = ""});

  CouponState copyWith({String? appliedCode}) {
    return CouponState(
      appliedCode: appliedCode ?? this.appliedCode,
    );
  }
}