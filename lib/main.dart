import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/app/controllers/auth_controller.dart';
import 'package:job_portal/app/routes/app_pages.dart';
import 'package:job_portal/app/routes/app_routes.dart';
import 'package:job_portal/custom_print.dart';
import 'package:job_portal/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await authChecking();
  runApp(MainApp());
}

authChecking() async {
  final authService = Get.put(AuthController());
  await authService.checkLoginStatus();
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final authService = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    customLog(authService.isLoggedIn);
    return GetMaterialApp(
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialRoute:
          authService.isLoggedIn ? Routes.companyListing : Routes.login,
    );
  }
}
