// import 'package:firebase_exemple/modules/shared/widgets/form_widget/form_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'login_controller.dart';

// class LoginPage extends GetView<LoginController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Obx(() => Text(controller.titulo.value)),
//           actions: [
//             TextButton(
//               child: Obx(() => Text(controller.appBarButton.value)),
//               onPressed: controller.toogleRegistrar,
//               style: ButtonStyle(
//                 foregroundColor:
//                     MaterialStateProperty.all<Color>(Colors.white70),
//               ),
//             ),
//           ],
//         ),
//         body: Obx(
//           () => controller.isLoading.value
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Form(
//                         key: controller.formKey,
//                         child: Column(
//                           children: [
//                             FormWidget(
//                               label: 'Email',
//                               controller: controller.emailController,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'Informe um Email';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(height: 10),
//                             FormWidget(
//                               label: 'Senha',
//                               controller: controller.senhaController,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'Informe uma senha';
//                                 } else if (value.length < 6) {
//                                   return 'Sua senha tem que ter no minimo 6 caracteres';
//                                 }
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.95,
//                         height: 55,
//                         child: OutlinedButton(
//                           onPressed: () {
//                             if (controller.formKey.currentState!.validate()) {
//                               if (controller.isLogin.value) {
//                                 controller.login();
//                               } else {
//                                 controller.register();
//                               }
//                             }
//                           },
//                           style: OutlinedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                           ),
//                           child: Obx(
//                             () => Text(
//                               controller.botaoPrincipal.value,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//         ));
//   }
// }
