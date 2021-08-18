import 'package:firebase_exemple/modules/shared/services/auth_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Text('Parabens Voce esta logado'),
      ),
    );
  }
}
