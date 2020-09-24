import 'package:flutter/widgets.dart';
import 'Pages/edit_user_detail.dart';
import 'Pages/registration_page.dart';
import 'Pages/registration_success.dart';
import 'Pages/sign_in_page.dart';
import 'Pages/user_page.dart';
import 'Pages/welcome_page.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomePage.routeName: (context) => WelcomePage(),
  SignInPage.routeName: (context) => SignInPage(),
  RegistrationPage.routeName: (context) => RegistrationPage(),
  RegistrationSuccess.routeName: (context) => RegistrationSuccess(),
  UserDataPage.routeName: (context) => UserDataPage(),
  EditUserData.routeName: (context) => EditUserData(),
};
