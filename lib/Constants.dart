
import 'dart:ui';

class AppConstant{
  static const Color Primarycolor= Color(0xfff5f9fa);
  static const Color whiteColor =Color(0xffFFFFFF);
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(this);
    /* RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);*/
  }
}
extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)").hasMatch(this);
  }
}