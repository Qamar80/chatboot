import 'package:chatboot/widgets/our_button.dart';
import 'package:chatboot/widgets/our_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
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
                        controller: emailController),
                    const SizedBox(height: 10),
                    ourTextField(
                        title: 'Password',
                        hint: 'Enter Password',
                        controller: passwordController),
                    const SizedBox(height: 20),
                    ourButton(
                      onPress: () {
                        controller.login(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      title: 'Login',
                    ),
                    const SizedBox(height: 20),
                    const Text('OR'),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => controller.signInWithGoogle(),
                      icon: const Icon(Icons.login),
                      label: const Text('Sign in with Google'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Get.toNamed('/signup'),
                      child: const Text("Don't have an account? Signup"),
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
