import 'package:chatboot/controllers/auth_controller.dart';
import 'package:chatboot/view/auth/login_screen.dart';
import 'package:chatboot/view/chat/chat_screen.dart';
import 'package:chatboot/view/on_boarding/on_boarding_Screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize AuthController
  Get.put(AuthController());

  // Check first launch and current user
  final prefs = await SharedPreferences.getInstance();
  final bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  final user = Get.find<AuthController>().firebaseUser.value;

  Widget initialScreen;

  if (user != null) {
    // Already logged in
    initialScreen = const ChatScreen();
  } else if (isFirstLaunch) {
    // First install → Onboarding
    initialScreen = const OnboardingScreen();
  } else {
    // Not first install, not logged in → Login
    initialScreen = LoginScreen();
  }

  runApp(MyApp(initialScreen: initialScreen));
}

class MyApp extends StatelessWidget {
  final Widget initialScreen;
  const MyApp({super.key, required this.initialScreen});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatBoot',
      home: initialScreen,
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/chat', page: () => const ChatScreen()),
        GetPage(name: '/onboarding', page: () => const OnboardingScreen()),
      ],
    );
  }
}
