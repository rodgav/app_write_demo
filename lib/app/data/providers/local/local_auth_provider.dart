import 'package:app_write_demo/utils/encrypt_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalAuthProvider {
  final EncryptHelper _encryptHelper = Get.find<EncryptHelper>();
  final _getStorage = GetStorage();

  String? get userId =>
      _encryptHelper.decrypt(_getStorage.read('userId') ?? '');

  Future<void> saveSession(String userId) async {
    print('saveSession userId $userId');
    try {
      await _getStorage.write('userId', _encryptHelper.encrypt(userId));
    } catch (e) {
      debugPrint('Ocurrio un error al guardar $e');
    }
  }

  Future<void> eraseSession() async {
    await _getStorage.erase();
  }
}
