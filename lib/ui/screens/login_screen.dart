import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:job_portal/app/controllers/auth_controller.dart';
import 'package:job_portal/custom_print.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.height * 0.06,
                child: SignInButton(
                  Buttons.GoogleDark,
                  onPressed: () {
                    customLog("Google SignIn Button Pressed!");
                    authController.signInWithGoogle();
                  },
                ),
              ),
              const SizedBox(height: 50),
              Obx(() => authController.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
