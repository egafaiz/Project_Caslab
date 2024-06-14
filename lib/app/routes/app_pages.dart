import 'package:get/get.dart';

import '../modules/email_otp/bindings/email_otp_binding.dart';
import '../modules/email_otp/views/email_otp_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homepage_1/bindings/homepage_1_binding.dart';
import '../modules/homepage_1/views/homepage_1_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_otp/bindings/login_otp_binding.dart';
import '../modules/login_otp/views/login_otp_view.dart';
import '../modules/login_success/bindings/login_success_binding.dart';
import '../modules/login_success/views/login_success_view.dart';
import '../modules/password_changed/bindings/password_changed_binding.dart';
import '../modules/password_changed/views/password_changed_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/signup_otp/bindings/signup_otp_binding.dart';
import '../modules/signup_otp/views/signup_otp_view.dart';
import '../modules/signup_success/bindings/signup_success_binding.dart';
import '../modules/signup_success/views/signup_success_view.dart';
import '../modules/transaction/bindings/transaction_binding.dart';
import '../modules/transaction/views/transaction_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_CHANGED,
      page: () => PasswordChangedView(),
      binding: PasswordChangedBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SUCCESS,
      page: () => const LoginSuccessView(),
      binding: LoginSuccessBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_OTP,
      page: () => const SignupOtpView(),
      binding: SignupOtpBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_SUCCESS,
      page: () => const SignupSuccessView(),
      binding: SignupSuccessBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL_OTP,
      page: () => const EmailOtpView(),
      binding: EmailOtpBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_OTP,
      page: () => const LoginOtpView(),
      binding: LoginOtpBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE_1,
      page: () => const Homepage1View(),
      binding: Homepage1Binding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => const TransactionView(),
      binding: TransactionBinding(),
    ),
  ];
}
