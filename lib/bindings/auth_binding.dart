import 'package:get/get.dart';
import '../controllers/auth_controller.dart';


//In GetX MVVM, a Binding is used to connect your controller with the screen (view)
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
