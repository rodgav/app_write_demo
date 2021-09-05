import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _.filePicker, child: Text('esscoger archivo')),
            Expanded(
              child: Obx(() {
                final images = _.images;
                return ListView.separated(
                  itemBuilder: (__, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text(index.toString()),
                      ),
                      title: Text(images[index].fileUrl)),
                  itemCount: images.length,
                  separatorBuilder: (__, index) => Divider(),
                );
              }),
            ),
          ],
        ),
      );
    });
  }
}
