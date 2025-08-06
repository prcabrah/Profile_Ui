import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WelcomeController extends GetxController {
  final _storage = GetStorage();
  final isFirstTime = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Check if it's the first time the user is opening the app
    _checkFirstTime();
  }

  void _checkFirstTime() {
    isFirstTime.value = _storage.read('isFirstTime') ?? true;
    if (!isFirstTime.value) {
      Future.delayed((Duration(seconds: 1)), () {
        Get.offAllNamed('/welcome');
      });
      _storage.write('isFirstTime', false);}
  }

  void completedWelcome() {

    _storage.write('isFirstTime', false);
    Get.offAllNamed('/Login');
  }
}
