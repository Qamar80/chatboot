import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/our_button.dart';
import '../../widgets/our_textField.dart';
import '../../constants/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup')
        ,centerTitle: true,
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
                child: Form(
                  key: _formKey, // ✅ Form key for validation
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Email Field
                      ourTextField(
                        title: 'Email',
                        hint: 'Enter Email',
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!value.contains('@')) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),

                      // Password Field
                      ourTextField(
                        title: 'Password',
                        hint: 'Enter Password',
                        controller: passwordController,
                        isPass: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),

                      // Signup Button
                      ourButton(
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            controller.signup(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                          }
                        },
                        color: yellowColor,
                        textColor: textColor,
                        title: 'Signup',
                      ),

                      const SizedBox(height: 20),
                      const Text('OR'),
                      const SizedBox(height: 20),

                      // Google Sign Up / Sign-In (optional)
                      ElevatedButton.icon(
                        onPressed: () => controller.signInWithGoogle(),
                        icon: Image.asset(
                          'assets/images/google.png',
                          height: 24,
                          width: 24,
                        ),
                        label: const Text('Sign in with Google'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Login Link
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
      ),
    );
  }
}
