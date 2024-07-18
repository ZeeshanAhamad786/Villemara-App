import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:villemara_app/controller/api/auth_apis.dart';

import '../custom_button.dart';

class AuthController extends GetxController {

  late final BuildContext context;

  AuthController(this.context);

  RxBool isLoading = false.obs;

  //user REGISTERED API
  Future<void> userRegistered({
    required String firstName,
    required String lastName,
    required String email,
    required String confirmEmail,
    required String password,
    required String confirmPassword,
    required String companyHouseNo,

  }) async {
    try {
      isLoading.value = true;
      await AuthApis(context).userRegistrationApi(
          firstName: firstName,
          lastName: lastName,
          email: email,
          confirmEmail: confirmEmail,
          password: password,
          confirmPassword: confirmPassword,
          companyHouseNo: companyHouseNo);
    } catch (e) {
      log("signUp Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // User Login API
  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isLoading.value = true;
      await AuthApis(context).loginApi(
        email: email,
        password: password,
        context: context,
      );
    } catch (e) {
      log('Error during login: $e');
      if (context.mounted) {
        customScaffoldMessenger(context, 'Login failed. Please try again.');
      }
    } finally {
      isLoading.value = false;
    }
  }


  //create post controller
  Future<void> createPost({
    required String thoughts,
    required String media,
    required String location,
    required List<String> taggedUsers,
    required List<String> tags,
  }) async {
    try {
      isLoading.value = true;
      await AuthApis(context).createPostApi(
          thoughts: thoughts,
          media: media,
          location: location,
          taggedUsers: taggedUsers,
          tags: tags
          );
    } catch (e) {
      print("login Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Forgot Password API
  Future<void> forgotPassword(BuildContext context,String email) async {
    isLoading.value = true;
    try {
      await AuthApis(context).forgotPasswordApi(context, email);
    } catch (e) {
      log('Error during forgot password: $e');
      if (context.mounted) {
        customScaffoldMessenger(context, 'Forgot password failed. Please try again.');
      }
    }
    isLoading.value = false;
  }

  /// Create new password API
  Future<void> createNewPassword(BuildContext context, String newPassword,) async {
    isLoading.value = true;
    try {
      await AuthApis(context).createNewPasswordApi(newPassword, context);
    } catch (e) {
      log('Error during password update: $e');
      if (context.mounted) {
        customScaffoldMessenger(context, 'Password update failed. Please try again.');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
