import 'package:chatboot/view/auth/signup_screen.dart';
import 'package:chatboot/view/chat/chat_screen.dart';
import 'package:chatboot/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_textFormField.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

   final AuthController controller = Get.find<AuthController>();




  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Center(
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text("Login to continue your journey", style: TextStyle(color: textLightColor)),
                  ),


                  const SizedBox(height: 40),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: "Enter your name", prefixIcon: Icons.person,),
                  const SizedBox(height: 20),

                  CustomTextFormField(
                      controller: passwordController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    isPasswordVisible: controller.isPasswordVisible,
                  ),
                  const SizedBox(height: 30),



                  Center(
                    child:   ourButton(
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
                  ),


                  const SizedBox(height: 15),
                  Center(
                    child: GestureDetector(
                      onTap: () => Get.to(() =>  SignupScreen()),
                      child: const Text(
                        "Don’t have an account? Register",
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Divider(thickness: 1.2),
                  const SizedBox(height: 10),
                  const Center(child: Text("Or Continue With")),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      _SocialButton(icon: Icons.apple, label: "Apple"),
                      _SocialButton(icon: Icons.g_mobiledata, label: "Google"),
                      _SocialButton(icon: Icons.facebook, label: "Facebook"),
                    ],
                  ),
                ],
              ),

          ),
        ),
      ),
    );
  }
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

























