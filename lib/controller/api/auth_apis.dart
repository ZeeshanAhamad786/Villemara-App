import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:villemara_app/controller/api/base_url.dart';
import 'package:villemara_app/controller/custom_button.dart';
import 'package:villemara_app/view/screens/authentication_screens/create%20_new%20_password.dart';
import 'package:villemara_app/view/screens/authentication_screens/login_screen.dart';
import 'package:villemara_app/view/screens/bottom_navigation_bar.dart';


class AuthApis {
  final BuildContext context;
  AuthApis(this.context);

  //signUpApi
  Future<void> userRegistrationApi(
      {required String firstName,
      required String lastName,
      required String email,
      required String confirmEmail,
      required String password,
      required String confirmPassword,
      required String companyHouseNo}) async {
    String apiName = "user Registration";
    final url =
        Uri.parse("$baseUrl$userRegistrationEP");
    final headers = {
      "Content-Type": "application/json",
    };
    final body = jsonEncode({
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "confirmEmail": confirmEmail,
      "password": password,
      "confirmPassword": confirmPassword,
      "companyHouseNo": companyHouseNo,
    });
    http.Response response = await post(url, headers: headers, body: body);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 201) {
      Get.offAll(() => LoginScreen());
      log("Api Success:$apiName\n${response.body}");
      customScaffoldMessenger(context, 'Successfully userRegistered');
      Get.offAll(() => LoginScreen());
    } else if (response.statusCode == 400) {
      customScaffoldMessenger(context, 'Email is already registered');
    }
    if (context.mounted) {
      log("Api Failed:$apiName\n${response.body}");
      final errors = jsonDecode(response.body)["errors"] as List<dynamic>;
      log("Error: $errors");
      final errorMsg = errors.map((error) => error["msg"]).join(", ");
      customScaffoldMessenger(context, errorMsg);
      return;
    }
  }


  //loginApi
  Future<void> loginApi(
      {
        required String email,
        required String password,
        required BuildContext context,
       }) async {
    String apiName = "login";
    final url =
    Uri.parse("$baseUrl$loginEP");
    final headers = {
      "Content-Type": "application/json",
    };
    final body = jsonEncode({
      "email": email,
      "password": password,
    });
    http.Response response = await post(url, headers: headers, body: body);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Get.offAll(() =>  const BottomNavigationScreen());
      log("Api Success:$apiName\n${response.body}");
      customScaffoldMessenger(context, 'Successfully Login');
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("token", responseBody["token"]);
      log('token :${responseBody["token"]}');
    } else if (response.statusCode == 401) {
      customScaffoldMessenger(context, 'Invalid password');
    }else if (response.statusCode == 404) {
      customScaffoldMessenger(context, 'User not found');
    }
    if (context.mounted) {
      log("Api Failed:$apiName\n${response.body}");
      final errors = jsonDecode(response.body)["errors"] as List<dynamic>;
      log("Error: $errors");
      final errorMsg = errors.map((error) => error["msg"]).join(", ");
      customScaffoldMessenger(context, errorMsg);
      return;
    }
  }

//create post Api
  Future<void> createPostApi({
    required String thoughts,
    required String media,
    required String location,
    required List<String> taggedUsers,
    required List<String> tags,
  }) async {
    String apiName = "create Post";
    final url = Uri.parse("$baseUrl$postCreateEP");
    final headers = {
      "Content-Type": "application/json",
    };
    final body = jsonEncode({
      "thoughts": thoughts,
      "media": media,
      "location": location,
      "taggedUsers": taggedUsers,
      "tags": tags,
    });
    log("$body");

    try {
      http.Response response = await http.post(url, headers: headers, body: body);
      log("API Response: ${response.body}");
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 201) {
        Get.offAll(() => const BottomNavigationScreen());
        log("Api Success: $apiName\n${response.body}");
        customScaffoldMessenger(context, 'Successfully Created Post');
      } else {
        log("Api Failed: $apiName\n${response.body}");
        final errors = responseBody["errors"] as List<dynamic>?;
        if (errors != null) {
          final errorMsg = errors.map((error) => error["msg"]).join(", ");
          customScaffoldMessenger(context, errorMsg);
        } else {
          customScaffoldMessenger(context, responseBody["message"] ?? "An error occurred");
        }
      }
    } catch (e) {
      log("Exception: $e");
      customScaffoldMessenger(context, "An unexpected error occurred");
    }
  }

//forgot password
  Future<void> forgotPasswordApi(BuildContext context, String email) async {
    final url = Uri.parse("$baseUrl$forgotPasswordEP");

    try {
      final response = await post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
        }),
      );

      log('API request details: $email');

      if (response.statusCode == 500) { // Assuming 200 is the success status code for your API
        log("API Success: Email Verification successfully!");
        customScaffoldMessenger(context, 'Email Verification successfully! Create New Password');
        Get.off(() => const CreateNewPassword());
      } else if (response.statusCode == 404) {
        log("API Failed: User not found");
        log(response.body);

        customScaffoldMessenger(context, 'User not found');
      } else {
        String errorMessage = 'Failed to verify email';
        log("API Failed with status code ${response.statusCode}");
        log(response.body);

        try {
          errorMessage = jsonDecode(response.body)['message'] ?? 'Failed to verify email';
        } catch (e) {
          errorMessage = 'Failed to verify email';
        }
        customScaffoldMessenger(context, errorMessage);
      }
    } catch (error) {
      log("Exception occurred: $error");
      customScaffoldMessenger(context, 'An error occurred. Please try again.');
    }
  }





  //create new password
  Future<void> createNewPasswordApi(String newPassword, BuildContext context) async {
    final url = Uri.parse("$baseUrl$createNewPasswordEP");

    try {
      final response = await post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'newPassword': newPassword,
          'confirmPassword': newPassword, // confirmPassword should match newPassword
        }),
      );

      log('API request details: $newPassword');

      if (response.statusCode == 200) {
        log("API Success: Password updated successfully");
        if (context.mounted) {
          customScaffoldMessenger(context, 'Password updated successfully');
          Get.off(() => LoginScreen());
        }
      } else {
        log("API Failed: Password update failed");
        log(response.body);
        if (context.mounted) {
          String errorMessage;
          try {
            errorMessage = jsonDecode(response.body)['errors'] ?? 'Password must be at least 6 characters long';
          } catch (e) {
            errorMessage = 'Password update failed';
          }
          customScaffoldMessenger(context, errorMessage);
        }
      }
    } catch (error) {
      print("Exception occurred: $error");
      if (context.mounted) {
        customScaffoldMessenger(context, 'An error occurred. Please try again.');
      }
    }
  }
}
