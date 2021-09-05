import 'package:app_write_demo/app/data/providers/local/local_auth_provider.dart';
import 'package:app_write_demo/app/data/providers/remote/data_provider.dart';
import 'package:app_write_demo/app/data/repositorys/local/local_auth_repository.dart';
import 'package:app_write_demo/app/data/repositorys/remote/data_repository.dart';
import 'encrypt_helper.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.put<EncryptHelper>(EncryptHelper());
    Get.put<Client>(Client()
        .setEndpoint('http://192.168.1.33:8081/v1')
        .setProject('6133e83a7c13f')
        .setSelfSigned(status: true));

    Get.put<LocalAuthProvider>(LocalAuthProvider());
    Get.put<LocalAuthRepository>(LocalAuthRepository());
    Get.put<DataProvider>(DataProvider());
    Get.put<DataRepository>(DataRepository());
  }
}
