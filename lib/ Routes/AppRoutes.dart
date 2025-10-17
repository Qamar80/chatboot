import 'package:chatboot/view/auth/Intro_screen.dart';
import 'package:chatboot/view/auth/login_screen.dart';
import 'package:chatboot/view/chat/chat_screen.dart';
import 'package:chatboot/view/on_boarding/on_boarding_Screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'RoutesName.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
        name: RoutesName.introScreen,
        page: () => IntroScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(
        name: RoutesName.loginView,
        page: () => LoginScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(
        name: RoutesName.chatScreen,
        page: () => ChatScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(
        name: RoutesName.onBoarding,
        page: () => OnboardingScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
  ];
}