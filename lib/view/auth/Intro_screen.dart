import 'package:chatboot/view/auth/signup_screen.dart';
import 'package:chatboot/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import 'login_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(  // ✅ allows scrolling when screen is small
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.05),

                // App logo or icon
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: const Icon(Icons.self_improvement, size: 60, color: yellowColor),
                ),

                const SizedBox(height: 35),

                // App name
                const Text(
                  "LIFTORA",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: textDarkColor,
                    letterSpacing: 1.5,
                  ),
                ),

                const SizedBox(height: 10),

                // Tagline
                const Text(
                  "Lift Your Limits, Live Your Best",
                  style: TextStyle(
                    color: textLightColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 40),

                // Short description
                const Text(
                  "Join thousands who’ve built meaningful daily routines and improved their habits with Liftora.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textDarkColor,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 60),


                ourButton(
                    onPress: (){
                      Get.to(() =>  SignupScreen());
                    },
                    color: yellowColor,
                    textColor: textColor,
                    title: "Signup"),

                const SizedBox(height: 20),

                ourButton(
                    onPress: (){
                      Get.to(() =>  LoginScreen());
                    },
                    color: yellowColor,
                    textColor: textColor,
                    title: " Log in "),



                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
