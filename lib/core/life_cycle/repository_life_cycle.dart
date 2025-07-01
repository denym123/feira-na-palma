import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RepositoryLifeCycle {
  final db = FirebaseFirestore.instance;
}
