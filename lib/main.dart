import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstly/app.dart';
import 'package:firstly/app_module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
  //   auth
  // .authStateChanges()
  // .listen((User? user) {
  //   if (user == null) {
  //     if (kDebugMode) {
  //       print('User is currently signed out!');
  //     }
  //   } else {
  //     if (kDebugMode) {
  //       print('User is signed in!');
  //     }
  //   }
  // });
  runApp(ModularApp(module: AppModule(), child: const App()));
}

