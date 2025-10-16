import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/our_button.dart';
import '../../widgets/our_textField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final controller = Get.find<AuthController>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RxBool isPasswordHidden = true.obs;
  final RxBool isConfirmPasswordHidden = true.obs;

  @override
  Widget build(BuildContext context) {
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
                    // 👤 Name Field
                    ourTextField(
                      title: 'Name',
                      hint: 'Enter Your Name',
                      controller: nameController,
                    ),
                    const SizedBox(height: 15),

                    // ✉️ Email Field
                    ourTextField(
                      title: 'Email',
                      hint: 'Enter Email',
                      controller: emailController,
                    ),
                    const SizedBox(height: 15),

                    // 🔒 Password Field
                    Obx(
                          () => TextField(
                        controller: passwordController,
                        obscureText: isPasswordHidden.value,
                        maxLength: 10, // ✅ Limit password to 10 characters
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Password',
                          hintText: 'Enter Password (max 10 chars)',
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              isPasswordHidden.value =
                              !isPasswordHidden.value;
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // 🔐 Confirm Password Field
                    Obx(
                          () => TextField(
                        controller: confirmPasswordController,
                        obscureText: isConfirmPasswordHidden.value,
                        maxLength: 10,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Confirm Password',
                          hintText: 'Re-enter Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              isConfirmPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              isConfirmPasswordHidden.value =
                              !isConfirmPasswordHidden.value;
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // 🔵 Signup Button
                    ourButton(
                      onPress: () {
                        if (passwordController.text.trim() !=
                            confirmPasswordController.text.trim()) {
                          Get.snackbar(
                            'Error',
                            'Passwords do not match',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.redAccent,
                            colorText: Colors.white,
                          );
                        } else {
                          controller.signup(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        }
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      title: 'Signup',
                    ),

                    const SizedBox(height: 25),
                    const Text('OR'),
                    const SizedBox(height: 25),

                    // 🔁 Redirect to Login
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
