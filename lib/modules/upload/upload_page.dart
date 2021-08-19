import 'package:firebase_exemple/shared/widgets/button_custom/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import 'upload_controller.dart';

class UploadPage extends GetView<UploadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadPage'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonCustom(
              titulo: 'Select Image',
              icone: Icons.attach_file,
              onTap: controller.selectFile,
            ),
            SizedBox(height: 5),
            SizedBox(height: 30),
            ButtonCustom(
              titulo: 'Upload image',
              icone: Icons.cloud_upload,
              onTap: controller.uploadImage,
            ),
            SizedBox(height: 10),
            Obx(() => controller.task.value != null
                ? controller.buildUploadStatus(controller.task.value!)
                : Container())
          ],
        ),
      ),
    );
  }
}
