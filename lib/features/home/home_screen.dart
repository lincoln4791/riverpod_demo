import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/core/app_router.dart';


class HomeScreen extends ConsumerWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, AppRouter.login());
            }, child: Text("Login")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, AppRouter.register());
            }, child: Text("Registration")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, AppRouter.itemList());
            }, child: Text("Item List")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, AppRouter.payment());
            }, child: Text("Payment"))

          ],
        ),
      ),
    );
  }
}