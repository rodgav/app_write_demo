import 'package:app_write_demo/app/data/providers/local/local_auth_provider.dart';
import 'package:get/get.dart';

class LocalAuthRepository {
  final _localAuthProvider = Get.find<LocalAuthProvider>();

  String? get userId => _localAuthProvider.userId;

  Future<void> saveSession(String userId) =>
      _localAuthProvider.saveSession(userId);

  Future<void> eraseSession() => _localAuthProvider.eraseSession();
}
