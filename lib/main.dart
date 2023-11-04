import 'package:btp/bindings/initial_bindings.dart';
import 'package:btp/controllers/theme_controller.dart';
import 'package:btp/routes/app_routes.dart';
import 'package:btp/screens/data_uploader_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './firebase_options.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  InitialBindings().dependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().darkTheme,
      getPages: AppRoutes.routes(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
//   await Firebase.initializeApp();
//   runApp(GetMaterialApp(home: DataUploaderScreen()));
// }
