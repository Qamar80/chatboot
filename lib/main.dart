

import 'package:chatboot/view/auth/Intro_screen.dart';
import 'package:chatboot/view/auth/login_screen.dart';
import 'package:chatboot/view/auth/signup_screen.dart';
import 'package:chatboot/view/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart' show GetMaterialApp;
import 'package:get/get_navigation/src/routes/get_route.dart' show GetPage;
import 'controllers/auth_controller.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController()); //  Initialize controller


  //Get.put(AuthController());
  runApp(const MyApp());




}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    home: IntroScreen(),
    /*  title: 'ChatBoot',
      initialRoute: '/login',
      getPages: [
       *//* GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
        GetPage(name: '/home', page: () => const ChatScreen()),*//*
        GetPage(name: '/into', page: () => const IntroScreen()),
      ],*/

    );
  }
}
