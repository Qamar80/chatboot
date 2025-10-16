import 'dart:ui';

import 'package:flutter/material.dart';
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
    // Check current user immediately when controller initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkCurrentUser();
    });

    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onInit();
  }

  // Check if user is already logged in when app starts
  void _checkCurrentUser() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      firebaseUser.value = currentUser;
    }
  }

  // Navigate to Home or Login automatically
  _setInitialScreen(User? user) {
    if (user == null) {
      if (Get.currentRoute != '/login') {
        Get.offAllNamed('/login');
      }
    } else {
      if (Get.currentRoute != '/home') {
        Get.offAllNamed('/home');
      }
    }
  }

  // Signup with Email/Password
  Future<void> signup(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Signup successful');
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Login with Email/Password
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

  // Login with Google
  Future<void> signInWithGoogle() async {
    try {
      // Ensure previous Google session is signed out so picker shows
      await _googleSignIn.signOut();

      // Trigger the Google Sign-In flow (forces account selection)
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        Get.snackbar('Cancelled', 'Google sign-in cancelled');
        return;
      }

      // Obtain auth details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create credential and sign in with Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      Get.snackbar('Success', 'Logged in with Google');
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Get.offAllNamed('/login');
  }
}