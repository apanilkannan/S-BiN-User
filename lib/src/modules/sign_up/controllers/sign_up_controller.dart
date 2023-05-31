import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:s_bin/src/networking/firebase/auth_service.dart';
import 'package:s_bin/src/networking/firebase/database_service.dart';
import 'package:s_bin/src/routes/app_routes.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
  }

  // SIGN UP USER AND CREATING A COLLECTION IN FIREBASE FIRE STORE
  signUpUser() async {
    isLoading.value = true;
    final message = await AuthService().registration(
      email: emailController.text,
      password: passwordController.text,
    );
    if (message!.contains('Success')) {
      final result = await DatabaseService().addUser(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text
      );
      if (result!.contains('success')) {
        Get.offAllNamed(AppRoutes.login);
        isLoading.value = false;
      }
    }

  }
}
