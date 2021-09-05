import 'package:app_write_demo/app/data/repositorys/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginLogic extends GetxController {
  final _authRepository = Get.find<AuthRepository>();
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
    final user = await _authRepository.accountCreate(
        email: txtEmail.text, password: txtPass.text, name: txtName.text);
    print('user $user');
    if (user != null) Get.offNamedUntil('/home', (route) => false);
  }

  void accountCreateSession() async {
    final session = await _authRepository.accountCreateSession(
        email: txtEmail.text, password: txtPass.text);
    print('session $session');
  }
}
