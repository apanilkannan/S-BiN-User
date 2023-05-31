import 'package:flutter/material.dart';
import 'package:s_bin/gen/colors.gen.dart';

class AppTags {
  static const String appName = 'S-Bin';

  // LOGIN SCREEN

  static const String emailHint = 'Enter Email';
  static const String passHint = 'Enter Password';
  static const String login = 'Login';
  static const String doNtHaveAccount = 'Don\'t have an account? ';

  // SIGN UP SCREEN

  static const String nameHint = 'Enter Name';
  static const String phoneHint = 'Enter Phone Number';
  static const String name = 'Name';
  static const String email = 'Email';
  static const String phone = 'Phone';
  static const String password = 'Password';
  static const String signUp = 'Sign Up';
  static const String loading = 'Loading...';

  static const font16weight500 = TextStyle(
    color: ColorName.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const font20weight500 = TextStyle(
    color: ColorName.white,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const font20weight500black = TextStyle(
    color: ColorName.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const font18weight500 = TextStyle(
    color: ColorName.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}
