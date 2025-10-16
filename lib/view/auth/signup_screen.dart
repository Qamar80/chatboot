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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  final RxBool isPasswordHidden = true.obs;

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
                    // ✉️ Email Field
                    ourTextField(
                      title: 'Email',
                      hint: 'Enter Email',
                      controller: emailController,
                    ),
                    const SizedBox(height: 15),


                    Obx(() => TextField(
                      controller: passwordController,
                      obscureText: isPasswordHidden.value,
                      maxLength: 10, // ✅ Limit password to 10 characters
                      decoration: InputDecoration(
                        counterText:
                        '',
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
                    )),
                    const SizedBox(height: 25),

                    // 🔵 Signup Button
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
