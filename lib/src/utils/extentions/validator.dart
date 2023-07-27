import 'package:get/get.dart';

String? validateEmail(String? text) {
  if (text == null || text.isEmpty) {
    return 'Email is required';
  } else if (!GetUtils.isEmail(text)) {
    return 'Invalid email address ';
  }
  return null;
}

String? validatePassword(String? text) {
  if (text == null || text.isEmpty) {
    return 'Password is required';
  } else if (!RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(text)) {
    return 'Invalid password';
  }
  return null;
}
