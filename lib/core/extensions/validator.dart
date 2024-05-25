
import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/strings.dart';

extension Validator on String {
  String? noValidate() {
    return null;
  }

  String? validateEmpty(BuildContext context, {String? message}) {
    if (trim().isEmpty) {
      return message ?? AppStrings.fieldRequired;
    }
    return null;
  }

  String? validatePassword(BuildContext context, {String? message}) {
    if (trim().isEmpty) {
      return message ?? AppStrings.fieldRequired;
    } else if (length < 6) {
      return message ?? AppStrings.plzFillOutPassCorrectly;
    }
    return null;
  }

  String? validateEmail(BuildContext context, {String? message}) {
    if (trim().isEmpty) {
      return message ?? AppStrings.fieldRequired;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this)) {
      return message ?? AppStrings.plzFillOutEmailCorrectly;
    }
    return null;
  }

  String? validateEmailORNull(BuildContext context, {String? message}) {
    if (trim().isNotEmpty) {
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(this)) {
        return message ?? AppStrings.plzFillOutEmailCorrectly;
      }
    }
    return null;
  }

  String? validatePhone(BuildContext context, {String? message}) {
    if (trim().isEmpty) {
      return message ?? AppStrings.fieldRequired;
    } else if (!RegExp(
                r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
            .hasMatch(this) ||
        length < 9) {
      return message ?? AppStrings.plzFillOutPhoneCorrectly;
    }
    return null;
  }

  String? validatePasswordConfirm(BuildContext context,
      {required String pass, String? message}) {
    if (trim().isEmpty) {
      return message ?? AppStrings.fieldRequired;
    } else if (this != pass) {
      return message ?? AppStrings.confirmationPassShouldBeIdentical;
    }
    return null;
  }
}

extension ValidatorDrop<T> on T {
  String? validateDropDown(BuildContext context, {String? message}) {
    if (this == null) {
      return message ?? AppStrings.fieldRequired;
    }
    return null;
  }
}
