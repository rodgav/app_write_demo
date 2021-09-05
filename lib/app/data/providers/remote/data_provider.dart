import 'dart:typed_data';

import 'package:app_write_demo/app/data/models/file.dart';
import 'package:app_write_demo/app/data/models/session.dart';
import 'package:app_write_demo/app/data/models/user.dart';
import 'package:app_write_demo/app/data/models/image.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart' as ge;

class DataProvider extends ge.GetxController {
  final _client = ge.Get.find<Client>();

  Future<UserModel?> accountCreate(
      {required String email,
      required String password,
      required String name}) async {
    try {
      Account account = Account(_client);
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
      Account account = Account(_client);
      final response =
          await account.createSession(email: email, password: password);
      print('response ${response.data}');
      return SessionModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<FileModel?> _saveFile(
      {required Uint8List uint8list, required String name}) async {
    try {
      Storage storage = Storage(_client);
      final response = await storage.createFile(
          file: MultipartFile.fromBytes('file', uint8list, filename: name),
          read: ['*']);
      //print('response ${response.data}');
      return FileModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<bool> saveImage(
      {required String userId,
      required Uint8List uint8list,
      required String name}) async {
    try {
      Database database = Database(_client);
      final fileModel = await _saveFile(uint8list: uint8list, name: name);
      if (fileModel != null) {
        final fileUrl =
            'http://192.168.1.33:8081/v1/storage/files/${fileModel.id}/view?project=6133e83a7c13f';
        await database.createDocument(collectionId: '6134fa8fe44b5', data: {
          'userId': userId,
          'fileId': fileModel.id,
          'fileUrl': fileUrl
        }, read: [
          '*'
        ], write: [
          '*'
        ]);
        return true;
        //print('response ${response.data}');
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<Images>> getImages() async {
    final database = Database(_client);
    final response =
        await database.listDocuments(collectionId: '6134fa8fe44b5');
    final imageModel = ImageModel.fromJson(response.data);
    return imageModel.documents;

    print('response ${response.data}');
  }

  Stream<Images> subscriptionImages() {
    final realtime = Realtime(_client);
    final subscription =
        realtime.subscribe(['collections.6134fa8fe44b5.documents']);
    return subscription.stream.map((event) {
      final image = Images.fromJson(event.payload);
      return image;
    });
  }

  void subscriptionFiles() {
    final realtime = Realtime(_client);
    final subscription = realtime.subscribe(['files']);

    subscription.stream.listen((response) {
      print('subscriptionFiles ${response.payload}');
    });
  }
}
