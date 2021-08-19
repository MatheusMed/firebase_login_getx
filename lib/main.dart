import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/checkAuth/checkAuth.dart';

import 'shared/config/init_config.dart';

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
