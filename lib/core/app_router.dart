import 'package:flutter/material.dart';
import 'package:riverpod_demo/features/payment/screens/payment_screen.dart';
import 'package:riverpod_demo/features/products/item_list_screen.dart';
import 'package:riverpod_demo/features/registration/registration_screen.dart';

import '../features/login/login_screen.dart';

class AppRouter {
  static Route login() {
    return MaterialPageRoute(
      builder: (_) =>  LoginScreen(),
    );
  }

  static Route register() {
    return MaterialPageRoute(
      builder: (_) =>  RegistrationScreen(),
    );
  }

  static Route itemList() {
    return MaterialPageRoute(
      builder: (_) =>  ItemListScreen(),
    );
  }

  static Route payment() {
    return MaterialPageRoute(
      builder: (_) =>  PaymentScreen(),
    );
  }
}