import 'package:chatboot/constants/colors.dart';
import 'package:chatboot/widgets/our_button.dart';
import 'package:chatboot/widgets/our_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  bool _obscurePassword = true; // For hiding/showing password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        backgroundColor: yellowColor,
      ),
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
                    const SizedBox(height: 10),

                    // Password Field with eye icon + limit
                    TextField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      maxLength: 10, // ✅ Limit to 10 characters
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        counterText: "", // hides character counter
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    ourButton(
                      onPress: () {
                        controller.login(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      },
                      color: yellowColor,
                      textColor: textColor,
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
