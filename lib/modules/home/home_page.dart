import 'package:firebase_exemple/repository/models/nota.dart';
import 'package:firebase_exemple/shared/services/auth_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
              title: '',
              content: Form(
                key: controller.formKeyFire,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: TextFormField(
                        controller: controller.titulo,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Titulo',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe o titulo corretamente!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: TextFormField(
                        controller: controller.nota,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nota',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informa sua Nota!';
                          } else if (value.length < 6) {
                            return 'Sua senha deve ter no mínimo 6 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.formKeyFire.currentState!.validate()) {
                            controller.criarNota();
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text('Adicionar Nota',
                                  style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Home Page'),
          actions: [
            PopupMenuButton(
                itemBuilder: (_) => [
                      PopupMenuItem(
                          child: ListTile(
                        title: Text('Fazer Logout'),
                        onTap: () {
                          AuthService.to.logout();
                          Get.back();
                        },
                      ))
                    ]),
          ],
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (BuildContext context, int i) {
                    return ListTile(
                      title: Text(controller.notas[i].titulo!),
                      onTap: () => Get.defaultDialog(
                        title: '',
                        content: Text(controller.notas[i].nota!),
                      ),
                    );
                  },
                  itemCount: controller.notas.length,
                ),
        ));
  }
}
