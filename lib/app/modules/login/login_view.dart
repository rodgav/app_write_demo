import 'package:app_write_demo/app/modules/login/widgets_login/login.dart';
import 'package:app_write_demo/app/modules/login/widgets_login/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginLogic>(builder: (_) {
      return GestureDetector(
          child: Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GetBuilder<LoginLogic>(
                                  id: 'loginRegister',
                                  builder: (_) =>
                                      _.loginRegister ? Login() : Register()),
                              SizedBox(height: 20),
                              Wrap(
                                  alignment: WrapAlignment.spaceAround,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  runAlignment: WrapAlignment.spaceAround,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    TextButton(
                                        onPressed: () =>
                                            _.changeLoginRegister(true),
                                        child: Text('Iniciar Sesión')),
                                    Text('ó'),
                                    TextButton(
                                        onPressed: () =>
                                            _.changeLoginRegister(false),
                                        child: Text('Registrarse')),
                                  ])
                            ]))),
              )),
          onTap: () => FocusScope.of(context).unfocus());
    });
  }
}
