import 'package:DetailApp/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Detail App',
      theme: ThemeData(
        fontFamily: 'AvenirLTPro',
        primaryColor: Colors.blue,
        accentColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: WelcomePage.routeName,
      routes: routes,
    );
  }
}
