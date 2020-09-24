import 'package:DetailApp/Pages/registration_page.dart';
import 'package:DetailApp/Pages/sign_in_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static String routeName = "/welcomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF00287A), width: 2),
                borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Detail App',
                style: TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 3.0),
                      blurRadius: 5.0,
                      color: Colors.blueGrey,
                    ),
                  ],
                  color: Color(0xFF00287A),
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegistrationPage.routeName);
            },
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'New to DetailApp?  ',
                        style: TextStyle(color: Colors.black, fontSize: 13)),
                    TextSpan(
                        text: 'Register',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SignInPage.routeName);
            },
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Already have an account?  ',
                        style: TextStyle(color: Colors.black, fontSize: 13)),
                    TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16))
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
