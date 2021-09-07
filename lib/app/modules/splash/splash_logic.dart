import 'package:app_write_demo/app/data/repositorys/local/local_auth_repository.dart';
import 'package:get/get.dart';

class SplashLogic extends GetxController {
  final _localAuthRepository = Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    _init();
    super.onReady();
  }

  Future<void> _init() async {
    final userId = _localAuthRepository.userId;
    print('userId $userId');
    await Future.delayed(const Duration(seconds: 3), () async {
      if (userId != null) {
        Get.offNamedUntil('/home', (route) => false);
      } else {
        Get.offNamedUntil('/login', (route) => false);
      }
    });
  }
}
