import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Validations {


  static String handleSignUpScreenError({
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController emailController,
    required TextEditingController confirmEmailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required TextEditingController companyHouseNoController,
  }) {
    if (firstNameController.text.isEmpty) {
      return "First name must not be empty.".tr;
    } else if (lastNameController.text.isEmpty) {
      return "Last name must not be empty.".tr;
    } else if (emailController.text.isEmpty) {
      return "Email must not be empty.".tr;
    } else if (!isValidEmail.hasMatch(emailController.text)) {
      return "Please check your email.".tr;
    } else if (confirmEmailController.text.isEmpty) {
      return "Confirm email must not be empty.".tr;
    } else if (emailController.text != confirmEmailController.text) {
      return "Emails do not match.".tr;
    } else if (passwordController.text.isEmpty) {
      return "Password must not be empty.".tr;
    } else if (confirmPasswordController.text.isEmpty) {
      return "Confirm password must not be empty.".tr;
    } else if (passwordController.text.length < 8) {
      return "Password must be at least 8 characters in length.".tr;
    } else if (!isValidPassword.hasMatch(passwordController.text)) {
      return "Password should contain at least one uppercase, lowercase, one digit, and special character.".tr;
    } else if (passwordController.text != confirmPasswordController.text) {
      return "Passwords do not match.".tr;
    } else if (companyHouseNoController.text.isEmpty) {
      return "Company house number must not be empty.".tr;
    } else {
      return "" ;
    }
  }

  static String handleLoginScreenError({
    emailController,
    passwordController,
  }) {
    if (emailController.text.isEmpty) {
      return "Email not be empty.".tr;
    } else if (passwordController.text.isEmpty) {
      return "Password not be empty.".tr;
    } else if (!isValidEmail.hasMatch(emailController.text)) {
      return "Please check your email.".tr;
    } else if (passwordController.text.length < 8) {
      return "Password must be at least 8 characters in length.".tr;
    }
    else if (!isValidPassword.hasMatch(passwordController.text)) {
      return "Password should contain at least one upper case, lower case, one digit, Special character."
          .tr;
    }
    else {
      return '';
    }
  }

  // forgot password
  static String handleForgotPasswordScreenError({
    required TextEditingController emailController,
  }) {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      return "Email cannot be empty.".tr;
    } else if (!isValidEmail.hasMatch(email)) {
      return "Please check your email.".tr;
    }

    return '';
  }


  // Create new password
  static String handleCreatePasswordScreenError({
    required TextEditingController newPasswordController,
    required TextEditingController confirmPasswordController,
  }) {
    if (newPasswordController.text.isEmpty) {
      return "New password cannot be empty.".tr;
    }
    if (confirmPasswordController.text.isEmpty) {
      return "Confirm password cannot be empty.".tr;
    }
    if (newPasswordController.text.length < 8) {
      return "Password must be at least 8 characters in length.".tr;
    }
    if (!isValidPassword.hasMatch(newPasswordController.text)) {
      return "Password should contain at least one uppercase letter, one lowercase letter, one digit, and one special character.".tr;
    }
    if (newPasswordController.text != confirmPasswordController.text) {
      return "Passwords do not match.".tr;
    }
    return '';
  }
}
 final RegExp isValidEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
);

 final RegExp isValidPassword = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
);