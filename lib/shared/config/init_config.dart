import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_exemple/modules/home/home_controller.dart';
import 'package:firebase_exemple/modules/login/login_controller.dart';
import 'package:firebase_exemple/modules/upload/upload_controller.dart';
import 'package:firebase_exemple/shared/services/auth_services/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

initConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('WidgetsFlutterBinding Iniciou');
  // firebase
  await Firebase.initializeApp();
  print('Firebase Iniciou');

  //getx
  Get.lazyPut<LoginController>(() => LoginController());
  Get.lazyPut<AuthService>(() => AuthService());
  Get.lazyPut<HomeController>(() => HomeController());
  Get.lazyPut<UploadController>(() => UploadController());
  print('Getx Lazyput Iniciou');
}
