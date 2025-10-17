import 'package:chatboot/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_textFormField.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final AuthController controller = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>(); // <-- move out of build
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey, // <-- wrap all fields inside Form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    "Welcome to Liftora",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Enter details below to continue building your best self.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textLightColor),
                  ),
                ),
                const SizedBox(height: 40),

                // Name
                CustomTextFormField(
                  controller: nameController,
                  hintText: "Enter your name",
                  prefixIcon: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Name is required';
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Email
                CustomTextFormField(
                  controller: emailController,
                  hintText: "Enter your email",
                  prefixIcon: Icons.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Email cannot be empty";
                    if (!value.contains("@")) return "Enter a valid email";
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Password
                CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  isPasswordVisible: controller.isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Password cannot be empty";
                    if (value.length < 6) return "Password must be at least 6 characters";
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Confirm Password
                CustomTextFormField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                  isPasswordVisible: controller.isConfirmPasswordHidden,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Please confirm password";
                    if (value != passwordController.text) return "Passwords do not match";
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                Center(
                  child: ourButton(
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        controller.signup(
                          nameController.text.trim(),
                          emailController.text.trim(),
                          passwordController.text.trim()
                        );
                      }
                    },
                    color: yellowColor,
                    textColor: textColor,
                    title: 'Signup',
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: GestureDetector(
                    onTap: () => Get.to(() => LoginScreen()),
                    child: const Text(
                      "Already have an account? Login",
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 1.2),
                const SizedBox(height: 5),
                const Center(child: Text("Or Continue With")),
                const SizedBox(height: 20),
                _socialRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        _SocialButton(icon: Icons.apple, label: "Apple"),
        _SocialButton(icon: Icons.g_mobiledata, label: "Google"),
        _SocialButton(icon: Icons.facebook, label: "Facebook"),
      ],
    );
  }
}


  Widget _socialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        _SocialButton(icon: Icons.apple, label: "Apple"),
        _SocialButton(icon: Icons.g_mobiledata, label: "Google"),
        _SocialButton(icon: Icons.facebook, label: "Facebook"),
      ],
    );
  }


class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _SocialButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: whiteColor,
          child: Icon(icon, color: textDarkColor, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: textDarkColor)),
      ],
    );
  }
}




