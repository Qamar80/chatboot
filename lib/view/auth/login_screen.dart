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
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle: true,
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
                  key: _formKey, // ✅ Add form key
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
                      const SizedBox(height: 10),

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

                      const SizedBox(height: 20),

                      // ✅ Login Button with validation check
                      ourButton(
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            controller.login(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                          }
                        },
                        color: yellowColor,
                        textColor: textColor,
                        title: 'Login',
                      ),

                      const SizedBox(height: 20),
                      const Text('OR'),
                      const SizedBox(height: 20),

                      // Google Sign In
                      ElevatedButton.icon(
                        onPressed: () => controller.signInWithGoogle(),
                        icon: Image.asset(
                          'assets/images/google.png', // ✅ your google logo
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

                      const SizedBox(height: 20),

                      // Signup Text
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
      ),
    );
  }
}
