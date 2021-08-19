import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDB {
  FirebaseDB._();
  static final FirebaseDB _instace = FirebaseDB._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static get() {
    return FirebaseDB._instace._firestore;
  }
}
