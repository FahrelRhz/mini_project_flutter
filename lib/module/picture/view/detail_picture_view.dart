import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core.dart';

// ignore: use_key_in_widget_constructors
class DetailPictureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DetailPictureController controller =
        Get.put(DetailPictureController());

    return Scaffold(
      appBar: AppBar(title: Text("Detail Photo")),
      body: Obx(
        () {
          if (controller.pictureDetail.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.pictureDetail['download_url']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Taken By: ${controller.pictureDetail['author']}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}