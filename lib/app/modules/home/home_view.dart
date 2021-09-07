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
        appBar: AppBar(
          title: Text('App Write DEMO'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _.filePicker, child: Text('escoger producto')),
                SizedBox(
                  height: 10,
                ),
                Obx(() {
                  final images = _.images;
                  return Container(
                    height: 100,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (__, index) {
                        return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                color: Colors.grey[200]),
                            margin: EdgeInsets.only(right: 10),
                            child:Column(
                          children: [
                            Expanded(
                              child:  ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image.network(
                                    _.images[index].fileUrl,
                                    width: 100,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                          child: CircularProgressIndicator());
                                      // You can use LinearProgressIndicator or CircularProgressIndicator instead
                                    },
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Text('Error $error'),
                                  ),
                                ),
                              ),

                            Text(images[index].fileId)
                          ],
                        ));
                      },
                      itemCount: images.length,
                      separatorBuilder: (__, index) => Divider(),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
