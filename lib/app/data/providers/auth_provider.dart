import 'package:app_write_demo/app/data/models/session.dart';
import 'package:app_write_demo/app/data/models/user.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class AuthProvider {
  final _cliente = Get.find<Client>();

  Future<UserModel?> accountCreate(
      {required String email,
      required String password,
      required String name}) async {
    try {
      Account account = Account(_cliente);
      final response =
          await account.create(email: email, password: password, name: name);
      print('response ${response.data}');
      return UserModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<SessionModel?> accountCreateSession(
      {required String email, required String password}) async {
    try {
      Account account = Account(_cliente);
      final response =
          await account.createSession(email: email, password: password);      print('response ${response.data}');
      return SessionModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
