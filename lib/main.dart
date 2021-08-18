import 'package:firebase_exemple/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/checkAuth/checkAuth.dart';

import 'modules/shared/config/init_config.dart';

void main() async {
  await initConfig();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Checkauth(),
    );
  }
}
