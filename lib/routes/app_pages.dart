import 'package:get/get.dart';

import '../views/home_screen.dart';
import '../views/login_screen.dart';
import '../views/signup_screen.dart';


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
