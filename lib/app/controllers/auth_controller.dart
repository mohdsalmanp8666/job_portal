import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:job_portal/custom_print.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<UserCredential?> user = Rx<UserCredential?>(null);

  final _loading = false.obs;
  get loading => _loading.value;
  set loading(value) => _loading.value = value;

  final RxBool _isLoggedIn = false.obs;
  get isLoggedIn => _isLoggedIn.value;
  set isLoggedIn(value) => _isLoggedIn.value = value;

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    customLog("Logged in= $isLoggedIn");
  }

  Future<void> saveData(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', status);
  }

  signInWithGoogle() async {
    loading = true;
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      user.value = await _auth.signInWithCredential(credential);
      if (user.value != null) {
        customLog("Successfully signed In!");
        Fluttertoast.showToast(msg: "Welcome ${user.value?.user?.displayName}");
        saveData(true);
        Get.offAllNamed('/company_listing');
      }
    } catch (e) {
      customLog(e);
    }
    loading = false;
  }

  signOut() async {
    await _auth.signOut();
    saveData(false);
  }
}
