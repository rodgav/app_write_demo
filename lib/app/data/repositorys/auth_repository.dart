import 'package:app_write_demo/app/data/models/session.dart';
import 'package:app_write_demo/app/data/models/user.dart';
import 'package:app_write_demo/app/data/providers/auth_provider.dart';
import 'package:get/get.dart';

class AuthRepository {
  final _authProvider = Get.find<AuthProvider>();

  Future<UserModel?> accountCreate(
          {required String email,
          required String password,
          required String name}) =>
      _authProvider.accountCreate(email: email, password: password, name: name);

  Future<SessionModel?> accountCreateSession(
          {required String email, required String password}) =>
      _authProvider.accountCreateSession(email: email, password: password);
}
