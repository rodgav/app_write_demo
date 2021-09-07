import 'dart:async';

import 'package:app_write_demo/app/data/models/image.dart';
import 'package:app_write_demo/app/data/repositorys/local/local_auth_repository.dart';
import 'package:app_write_demo/app/data/repositorys/remote/data_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  final _localAuthRepository = Get.find<LocalAuthRepository>();
  final _dataRepository = Get.find<DataRepository>();
  late StreamSubscription<Images> _imagesSubscription;
  RxList<Images> _images = <Images>[].obs;

  List<Images> get images => _images;

  @override
  void onReady() {
    //_dataRepository.subscriptionFiles();
    _getImages();
    super.onReady();
  }

  void _getImages() async {
    _images.addAll(await _dataRepository.getImages());
    _imagesSubscription = _dataRepository.subscriptionImages().listen((event) {
      _images.add(event);
    });
  }

  Future<void> filePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image, withData: true);
    if (result != null) {
      final bytes = result.files.single.bytes!;
      //final base64Image = base64Encode(bytes);
      final nameArchivo = result.files.single.name;
      final userId = _localAuthRepository.userId;
      if (userId != null) {
        await _dataRepository.saveImage(
            userId: userId, uint8list: bytes, name: nameArchivo);
      } else {
        Get.offNamedUntil('/login', (route) => false);
      }
    } else {
      _snackBar(Colors.red, 'No pudo cargar la imagen', 'Intentelo de nuevo');
    }
  }

  void _snackBar(Color color, String title, String body) {
    Get.snackbar(
      title,
      body,
      colorText: color,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOutBack,
      margin: EdgeInsets.all(15),
    );
  }

  @override
  void onClose() {
    _imagesSubscription.cancel();
    super.onClose();
  }
}
