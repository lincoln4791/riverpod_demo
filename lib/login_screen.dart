import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(controller: emailController),
            TextField(controller: passController),
      
            if (authState.isLoading)
              CircularProgressIndicator(),
      
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).login(
                      emailController.text,
                      passController.text,
                    );
              },
              child: Text("Login"),
            ),
      
            if (authState.user != null)
              Text("Welcome ${authState.user}"),
      
            if (authState.error != null)
              Text(authState.error!),
          ],
        ),
      ),
    );
  }
}