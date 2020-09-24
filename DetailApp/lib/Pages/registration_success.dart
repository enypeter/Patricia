import 'package:DetailApp/Pages/sign_in_page.dart';
import 'package:flutter/material.dart';

class RegistrationSuccess extends StatelessWidget {
  static String routeName = "/registration_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: GestureDetector(
              onTap: () {
                Navigator.popAndPushNamed(context, SignInPage.routeName);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF00287A), width: 2),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Click to sign in now!',
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
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
