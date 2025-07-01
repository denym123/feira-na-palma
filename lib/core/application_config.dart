import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ApplicationConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initFirebase();
  }

  Future<void> _initFirebase() async {
    await Firebase.initializeApp();
  }
}
