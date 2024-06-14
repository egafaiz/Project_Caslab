part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SIGNUP = _Paths.SIGNUP;
  static const LOGIN = _Paths.LOGIN;
  static const RESET_PASSWORD = _Paths.RESET_PASSWORD;
  static const PASSWORD_CHANGED = _Paths.PASSWORD_CHANGED;
  static const LOGIN_SUCCESS = _Paths.LOGIN_SUCCESS;
  static const SIGNUP_OTP = _Paths.SIGNUP_OTP;
  static const SIGNUP_SUCCESS = _Paths.SIGNUP_SUCCESS;
  static const EMAIL_OTP = _Paths.EMAIL_OTP;
  static const LOGIN_OTP = _Paths.LOGIN_OTP;
  static const HOMEPAGE_1 = _Paths.HOMEPAGE_1;
  static const TRANSACTION = _Paths.TRANSACTION;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SIGNUP = '/signup';
  static const LOGIN = '/login';
  static const RESET_PASSWORD = '/reset-password';
  static const PASSWORD_CHANGED = '/password-changed';
  static const LOGIN_SUCCESS = '/login-success';
  static const SIGNUP_OTP = '/signup-otp';
  static const SIGNUP_SUCCESS = '/signup-success';
  static const EMAIL_OTP = '/email-otp';
  static const LOGIN_OTP = '/login-otp';
  static const HOMEPAGE_1 = '/homepage-1';
  static const TRANSACTION = '/transaction';
}
