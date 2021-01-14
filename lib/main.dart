  

import 'package:test_social_login/Ui/AuthenticationWidget.dart';
 import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_social_login/services/LoginServices.dart';

import 'Ui/AuthenticationWidget.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static LoginServices auth = LoginServices();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return  MaterialApp(
        title: 'firebase',
         debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:AuthenticationWidget(),
     // ),
    );
  }
}
