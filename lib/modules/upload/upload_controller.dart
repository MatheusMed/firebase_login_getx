import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_exemple/repository/database/firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class UploadController extends GetxController {
  Rxn<File?> file = Rxn<File?>();

  RxString? valor = 'Nenhuma Imagem'.obs;

  Rxn<UploadTask?> task = Rxn<UploadTask?>();

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    file.value = File(path);
  }

  Future uploadImage() async {
    if (file.value == null) return;
    final fileName = basename(file.value!.path);
    final destination = 'files/$fileName';
    task.value = FirebaseApi.uploadFile(destination, file.value!);
    if (task.value == null) return;
    final snapshot = await task.value!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-link $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task, {BuildContext? context}) =>
      StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data;
            final progress = snap!.bytesTransferred / snap.totalBytes;
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.orange[100],
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffa726)),
                minHeight: 7,
              ),
            );
          } else {
            return Container();
          }
        },
      );
}
