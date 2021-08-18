import 'package:firebase_exemple/modules/shared/services/auth_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final formKeyLogin = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();

  var isLogin = true.obs;

  @override
  void onInit() {
    super.onInit();
    ever(isLogin, (_) {
      formKeyLogin.currentState!.reset();
      formKeyRegister.currentState!.reset();
    });
  }

  login() {
    AuthService.to.login(emailController.text, senhaController.text);
  }

  register() {
    AuthService.to.createUser(emailController.text, senhaController.text);
  }
}
