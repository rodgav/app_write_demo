import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashLogic>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text(
            'app write demo',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      );
    });
  }
}
