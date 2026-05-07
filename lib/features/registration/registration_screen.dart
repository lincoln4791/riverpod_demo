import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/features/registration/registration_provider.dart';

import '../../core/app_router.dart';

class RegistrationScreen extends ConsumerWidget {
  RegistrationScreen({super.key});
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regState = ref.watch(registrationProvider);

    ref.listen(registrationProvider, (previous, next) {
      if (next.user!=null) {
        Navigator.pushReplacement(
          context,
          AppRouter.login(),
        );
      }

/*      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!)),
        );
      }*/
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(controller: emailController,),
            TextField(controller: passController),
            
            if (regState.isLoading)
              CircularProgressIndicator(),
            
            ElevatedButton(
              onPressed: () {
                ref.read(registrationProvider.notifier).register(
                  emailController.text,
                  passController.text,
                );
              },
              child: Text("Register"),
            ),
            
            if (regState.user != null)
              Text("Welcome ${regState.user}"),
            
            if (regState.error != null)
              Text(regState.error!),
          ],
        ),
      ),
    );
  }
}
