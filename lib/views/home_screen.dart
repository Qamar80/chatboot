import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: controller.logout, // ✅ correct function name
          ),
        ],
      ),
      body: Obx(() {
        final user = controller.firebaseUser.value; // ✅ reactive user
        return Center(
          child: Text(
            user != null
                ? 'Welcome, ${user.email ?? "Google User"}!'
                : 'No user logged in.',
            style: const TextStyle(fontSize: 18),
          ),
        );
      }),
    );
  }
}

