import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_exemple/repository/database/firebase_firestone/firebase_firestore.dart';

import 'package:firebase_exemple/repository/models/nota.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final titulo = TextEditingController();
  final nota = TextEditingController();
  final formKeyFire = GlobalKey<FormState>();

  late CollectionReference collectionReference;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  var isLoading = false.obs;

  RxList<Nota> notas = RxList<Nota>([]);

  Future<String> criarNota({Nota? notas}) async {
    FirebaseFirestore db = await FirebaseDB.get();
    var docRef = await db.collection('notas').add({
      'titulo': titulo.text,
      'nota': nota.text,
    });
    titulo.clear();
    nota.clear();
    Get.back();
    var result = docRef.id;
    return result;
  }

  @override
  void onInit() {
    collectionReference = firebaseFirestore.collection('notas');
    notas.bindStream(pegarNotas());

    super.onInit();
  }

  Stream<List<Nota>> pegarNotas() {
    return collectionReference.snapshots().map(
          (doc) => doc.docs.map((item) => Nota.fromMap(item)).toList(),
        );
  }
}
