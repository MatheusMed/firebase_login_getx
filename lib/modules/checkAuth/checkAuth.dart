import 'package:firebase_exemple/modules/home/home_page.dart';
import 'package:firebase_exemple/modules/login/login_page.dart';
import 'package:firebase_exemple/modules/upload/upload_page.dart';

import 'package:firebase_exemple/shared/services/auth_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkauth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          AuthService.to.userIsAuthenticated.value ? UploadPage() : LoginPage(),
    );
  }
}
