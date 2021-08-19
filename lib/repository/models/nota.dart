import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Nota {
  String? id;
  String? titulo;
  String? nota;
  Nota({
    this.id,
    this.titulo,
    this.nota,
  });

  Nota.fromMap(DocumentSnapshot data) {
    id = data.id;
    titulo = data['titulo'];
    nota = data['nota'];
  }
}
