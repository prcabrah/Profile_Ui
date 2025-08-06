import 'package:get/get.dart';
import 'package:profile_ui/screen/register/controller/auth_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}