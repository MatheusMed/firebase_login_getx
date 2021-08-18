import 'package:firebase_exemple/modules/login/login_controller.dart';
import 'package:firebase_exemple/modules/shared/widgets/form_widget/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResgisterPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: controller.formKeyRegister,
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
                      controller.register();
                    }
                  }
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text('Cadastrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
