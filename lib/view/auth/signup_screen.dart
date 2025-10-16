import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets/our_button.dart';
import '../../widgets/our_textField.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - kToolbarHeight,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ourTextField(
                      title: 'Email',
                      hint: 'Enter Email',
                      controller: emailController,
                    ),
                    const SizedBox(height: 15),

                    ourTextField(
                      title: 'Password',
                      hint: 'Enter Password',
                      controller: passwordController,

                    ),

                    const SizedBox(height: 25),

                    ourButton(
                      onPress: () {
                        controller.signup(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      title: 'Signup',
                    ),

                    const SizedBox(height: 25),

                    const Text('OR'),

                    const SizedBox(height: 25),



                    const SizedBox(height: 25),

                    TextButton(
                      onPressed: () => Get.toNamed('/login'),
                      child: const Text("Already have an account? Login"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
