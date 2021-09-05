import 'package:app_write_demo/app/data/repositorys/local/local_auth_repository.dart';
import 'package:app_write_demo/app/data/repositorys/remote/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginLogic extends GetxController {
  final _dataRepository = Get.find<DataRepository>();
  final _localAuthRepository = Get.find<LocalAuthRepository>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController txtName = TextEditingController();
  final FocusNode focusName = FocusNode();
  final TextEditingController txtEmail = TextEditingController();
  final FocusNode focusEmail = FocusNode();
  final TextEditingController txtPass = TextEditingController();
  final FocusNode focusPass = FocusNode();

  bool _loginRegister = true;

  bool get loginRegister => _loginRegister;

  String? isNotEmpty(String text, String type) {
    if (text.isNotEmpty) return null;
    return 'Ingrese$type';
  }

  void changeLoginRegister(bool value) {
    _loginRegister = value;
    update(['loginRegister']);
  }

  void accountCreate() async {
    final user = await _dataRepository.accountCreate(
        email: txtEmail.text, password: txtPass.text, name: txtName.text);
    if (user != null) {
      await _localAuthRepository.saveSession(user.id);
      Get.offNamedUntil('/home', (route) => false);
    }
  }

  void accountCreateSession() async {
    final session = await _dataRepository.accountCreateSession(
        email: txtEmail.text, password: txtPass.text);
    if (session != null) {
     await _localAuthRepository.saveSession(session.userId);
      Get.offNamedUntil('/home', (route) => false);
    }
  }
}
