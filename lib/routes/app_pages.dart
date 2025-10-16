import 'package:get/get.dart';

import '../view/auth/login_screen.dart';
import '../view/auth/signup_screen.dart';
import '../view/chat/home_screen.dart';




class AppRoutes {
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () =>  LoginScreen()),
    GetPage(name: AppRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
  ];
}
