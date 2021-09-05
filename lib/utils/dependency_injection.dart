import 'package:app_write_demo/app/data/providers/auth_provider.dart';
import 'package:app_write_demo/app/data/providers/data_provider.dart';
import 'package:app_write_demo/app/data/repositorys/auth_repository.dart';
import 'package:app_write_demo/app/data/repositorys/data_repository.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.put<Client>(Client()
        .setEndpoint('http://192.168.1.33:8081/v1')
        .setProject('6133e83a7c13f')
        .setSelfSigned(status: true));

    Get.put<AuthProvider>(AuthProvider());
    Get.put<AuthRepository>(AuthRepository());
    Get.put<DataProvider>(DataProvider());
    Get.put<DataRepository>(DataRepository());
  }
}
