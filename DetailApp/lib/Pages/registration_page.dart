import 'package:DetailApp/widgets/button.dart';
import 'package:DetailApp/widgets/email_form.dart';
import 'package:DetailApp/widgets/password_forms.dart';
import 'package:DetailApp/widgets/social_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/error_notifications.dart';
import 'registration_success.dart';

class RegistrationPage extends StatefulWidget {
  static String routeName = "/registration";
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirmPassword;
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                    Center(
                      child: Text(
                        "New User Registration",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Complete this form to register",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
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
                        password = value;
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
                    SizedBox(height: 20),
                    PasswordFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kPassNullError);
                        } else if (value.isNotEmpty &&
                            password == confirmPassword) {
                          removeError(error: kMatchPassError);
                        }
                        confirmPassword = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          addError(error: kPassNullError);
                          return "";
                        } else if ((password != value)) {
                          addError(error: kMatchPassError);
                          return "";
                        }
                        return null;
                      },
                      onSaved: (newValue) => confirmPassword = newValue,
                      label: 'Confirm Password',
                      hint: 'Re-enter your password',
                    ),
                    SizedBox(height: 50),
                    // DefaultButton(
                    //   title: 'Continue',
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, EditUserData.routeName);
                    //
                    //     // signUp();
                    //   },
                    // ),
                    isLoading
                        ? CircularProgressIndicator(
                            backgroundColor: Theme.of(context).primaryColor,
                            strokeWidth: 3)
                        : DefaultButton(
                            title: 'Register',
                            onPressed: () {
                              signUp();
                            },
                          ),
                    SizedBox(height: 20),
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
                    Text(
                      'By continuing your confirm that you agree \nwith our Term and Condition',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      setState(() {
        isLoading = true;
      });
      formState.save();
      try {
        final User = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Navigator.popAndPushNamed(context, RegistrationSuccess.routeName);
      } catch (e) {
        changeLoadingState();
        Error.showErrorMessage(context);
        print(e.message);
      }
    }
  }
}
