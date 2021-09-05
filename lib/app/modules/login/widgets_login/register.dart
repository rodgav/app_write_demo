import 'package:app_write_demo/app/global_widgets/txtFormField.dart';
import 'package:app_write_demo/app/modules/login/login_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<LoginLogic>(builder: (_) {
      return Form(
          key: _.formKey,
          child: Column(
            children: [
              Text(
                'Registro',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              TxtFormFieldWid(
                  onSubmitted: (value) {
                    _.focusName.unfocus();
                    FocusScope.of(context).requestFocus(_.focusEmail);
                  },
                  validator: (text) =>
                      _.isNotEmpty(text!, ' un ${'name'.tr}'),
                  width: size.width,
                  hintText: 'name'.tr,
                  textEditingController: _.txtName,
                  textInputType: TextInputType.text,
                  focusNode: _.focusName,
                  showIcon: false,
                  enabled: true),
              SizedBox(height: 10),
              TxtFormFieldWid(
                  onSubmitted: (value) {
                    _.focusEmail.unfocus();
                    FocusScope.of(context).requestFocus(_.focusPass);
                  },
                  validator: (text) =>
                      _.isNotEmpty(text!, ' un ${'email'.tr}'),
                  width: size.width,
                  hintText: 'email'.tr,
                  textEditingController: _.txtEmail,
                  textInputType: TextInputType.text,
                  focusNode: _.focusEmail,
                  showIcon: false,
                  enabled: true),
              SizedBox(height: 10),
              TxtFormFieldWid(
                  onSubmitted: (value) {
                    _.focusPass.unfocus();
                  },
                  validator: (text) =>
                      _.isNotEmpty(text!, ' un ${'password'.tr}'),
                  width: size.width,
                  hintText: 'password'.tr,
                  textEditingController: _.txtPass,
                  textInputType: TextInputType.text,
                  focusNode: _.focusPass,
                  showIcon: false,
                  enabled: true),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: _.accountCreate, child: Text('Registrarse')),
            ],
          ));
    });
  }
}
