import 'dart:typed_data';

import 'package:app_write_demo/app/data/models/image.dart';
import 'package:app_write_demo/app/data/models/session.dart';
import 'package:app_write_demo/app/data/models/user.dart';
import 'package:app_write_demo/app/data/providers/remote/data_provider.dart';
import 'package:get/get.dart';

class DataRepository {
  final _dataProvider = Get.find<DataProvider>();

  Future<UserModel?> accountCreate(
          {required String email,
          required String password,
          required String name}) =>
      _dataProvider.accountCreate(email: email, password: password, name: name);

  Future<SessionModel?> accountCreateSession(
          {required String email, required String password}) =>
      _dataProvider.accountCreateSession(email: email, password: password);

  Future<bool> saveImage(
          {required String userId,
          required Uint8List uint8list,
          required String name}) =>
      _dataProvider.saveImage(userId: userId, uint8list: uint8list, name: name);

  Future<List<Images>> getImages() => _dataProvider.getImages();

  void subscriptionFiles() => _dataProvider.subscriptionFiles();

  Stream<Images> subscriptionImages() =>
      _dataProvider.subscriptionImages();
}
