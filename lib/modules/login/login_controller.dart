import 'package:firebase_exemple/shared/services/auth_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var titulo = 'Bem vindo!'.obs;
  var botaoPrincipal = 'Entrar'.obs;
  var appBarButton = 'Cadastre-se'.obs;
  var isLogin = true.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(isLogin, (visible) {
      titulo.value = visible != null ? 'Crie sua conta' : 'Bem vindo';
      botaoPrincipal.value = visible != null ? 'Registre-se' : 'Entrar';
      appBarButton.value = visible != null ? 'Login' : 'Cadastre-se';
      formKey.currentState!.reset();
    });
  }

  login() async {
    isLoading.value = true;
    await AuthService.to.login(emailController.text, senhaController.text);
    isLoading.value = false;
  }

  register() async {
    isLoading.value = true;
    await AuthService.to.createUser(emailController.text, senhaController.text);
    isLoading.value = false;
  }

  toogleRegistrar() {
    isLogin.value = !isLogin.value;
  }
}
