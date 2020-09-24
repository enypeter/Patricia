import 'package:DetailApp/Pages/registration_page.dart';
import 'package:DetailApp/constants/error_notes.dart';
import 'package:DetailApp/widgets/button.dart';
import 'package:DetailApp/widgets/email_form.dart';
import 'package:DetailApp/widgets/password_forms.dart';
import 'package:DetailApp/widgets/social_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/error_notifications.dart';
import 'edit_user_detail.dart';

class SignInPage extends StatefulWidget {
  static String routeName = "/sign_in";
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  bool isLoading = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void initState() {
    super.initState();
  }

  changeLoadingState() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Center(
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Sign in with your email and password ",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    EmailFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kEmailNullError);
                        } else if (emailValidatorRegExp.hasMatch(value)) {
                          removeError(error: kInvalidEmailError);
                        }
                        return null;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          addError(error: kEmailNullError);
                          return "";
                        } else if (!emailValidatorRegExp.hasMatch(value)) {
                          addError(error: kInvalidEmailError);
                          return "";
                        }
                        return null;
                      },
                      onSaved: (newValue) => email = newValue,
                      label: "Email",
                      hint: "Enter your Email",
                    ),
                    SizedBox(height: 20),
                    PasswordFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kPassNullError);
                        } else if (value.length >= 8) {
                          removeError(error: kShortPassError);
                        }
                        return null;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          addError(error: kPassNullError);
                          return "";
                        } else if (value.length < 8) {
                          addError(error: kShortPassError);
                          return "";
                        }
                        return null;
                      },
                      onSaved: (newValue) => password = newValue,
                      label: 'Password',
                      hint: 'Enter your password',
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: remember,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (value) {
                            setState(() {
                              remember = value;
                            });
                          },
                        ),
                        Text("Remember me"),
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot Password",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    FormError(errors: errors),
                    SizedBox(height: 50),
                    isLoading
                        ? CircularProgressIndicator(
                            backgroundColor: Theme.of(context).primaryColor,
                            strokeWidth: 3)
                        : DefaultButton(
                            title: 'Sign In',
                            onPressed: () {
                              signIn();
                            },
                          ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialLogInCard(
                          icon: "assets/icons/google-icon.svg",
                          press: () {},
                        ),
                        SocialLogInCard(
                          icon: "assets/icons/facebook-2.svg",
                          press: () {},
                        ),
                        SocialLogInCard(
                          icon: "assets/icons/twitter.svg",
                          press: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RegistrationPage.routeName);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      setState(() {
        isLoading = true;
      });
      formState.save();
      try {
        final User = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        Navigator.pushReplacementNamed(context, EditUserData.routeName);
      } catch (e) {
        changeLoadingState();
        Error.showErrorMessage(context);
        print(e.message);
      }
    }
  }
}
