import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Reactive Firebase User
  var firebaseUser = Rxn<User>();

  @override
  void onInit() {
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onInit();
  }

  // 🔹 Navigate to Home or Login automatically
  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('/home');
    }
  }

  // 🔹 Signup with Email/Password
  Future<void> signup(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Signup successful');
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // 🔹 Login with Email/Password
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Login successful');
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

// Google Sign-In
  Future<void> signInWithGoogle() async {
    try {
      print(" Starting Google Sign-In...");
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print(" Google Sign-In canceled by user");
        return;
      }

      print(" Google user selected: ${googleUser.email}");

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      print(" Got Google Auth Tokens");

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print("🧩 Signing in to Firebase with Google credential...");
      await _auth.signInWithCredential(credential);

      print("🎉 Google Sign-In successful!");
      Get.snackbar('Success', 'Signed in with Google');
      Get.offAllNamed('/home');
    } catch (e, stack) {
      print("❌ Google Sign-In Error: $e");
      print("🧾 Stack Trace: $stack");
      Get.snackbar('Google Sign-In Error', e.toString());
    }
  }


  // 🔹 Logout
  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Get.offAllNamed('/login');
  }
}
