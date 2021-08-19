import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_exemple/repository/database/firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:path/path.dart';

class UploadController {
  File? file;

  Rxn<UploadTask?> task = Rxn<UploadTask?>();

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    file = File(path);
  }

  Future uploadImage() async {
    if (file == null) return;
    final fileName = basename(file!.path);
    final destination = 'files/$fileName';
    task.value = FirebaseApi.uploadFile(destination, file!);
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
            final porcentagem = (progress * 100).toStringAsFixed(2);
            return Text('$porcentagem % ');
          } else {
            return Container();
          }
        },
      );
}
