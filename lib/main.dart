import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:summerclass/app/routes/app_pages.dart';
import 'package:summerclass/app/routes/app_routes.dart';
import 'package:summerclass/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    GetMaterialApp(initialRoute: Routes.SPLASH, getPages: AppPages.routes),
  );
}
