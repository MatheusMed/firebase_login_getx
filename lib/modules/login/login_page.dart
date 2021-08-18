import 'package:firebase_exemple/modules/register/resgister_page.dart';
import 'package:firebase_exemple/modules/shared/widgets/form_widget/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: controller.formKeyLogin,
              child: Column(
                children: [
                  FormWidget(
                    label: 'Email',
                    controller: controller.emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe um Email';
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  FormWidget(
                    label: 'Senha',
                    controller: controller.senhaController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe uma senha';
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 55,
              child: OutlinedButton(
                onPressed: () {
                  if (controller.formKeyLogin.currentState!.validate()) {
                    if (controller.isLogin.value) {
                      controller.login();
                    }
                  }
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(() => ResgisterPage());
                  },
                  child: Text(
                    'Cadastrar-se',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
