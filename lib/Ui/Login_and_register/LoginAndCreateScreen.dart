 import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_social_login/Ui/AuthenticationWidget.dart';
import 'package:test_social_login/Ui/creators/createAppBar.dart';
import 'package:test_social_login/Ui/creators/createLoginForm.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:test_social_login/main.dart';

import 'login_with_phone_screen.dart';


class LoginAndCreateScreen extends StatefulWidget {
  @override
  _LoginAndCreateScreenState createState() => _LoginAndCreateScreenState();
}

class _LoginAndCreateScreenState extends State<LoginAndCreateScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(isHome: false),
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //image
              Card(
                  elevation: 2,
                  margin: EdgeInsets.all(10),
                  child: InteractiveViewer(child: Image.asset('assets/photo.webp'))), //image
              //form and sign buttons
              Container(
                height: MediaQuery.of(context).size.height / 2.1,
                padding: EdgeInsets.all(10),
                child: Card(
                  child: CreateLoginForm(

                  ),
                ),
              ),

              SignInButton(
                  buttonType: ButtonType.facebook,
                  onPressed: () async {
                    setState(() {AuthenticationWidget.loginType=2;});
                    await MyApp.auth.loginWithFaceBook();
                  }),





              SignInButton(buttonType: ButtonType.google, onPressed: () async{
                setState(() {AuthenticationWidget.loginType=3;});
                await MyApp.auth.signInWithGoogle();

              }),


              // SignInButton(buttonType: ButtonType.mail, onPressed: () {}),
              // SignInButton(buttonType: ButtonType.microsoft, onPressed: () {}),

              FilterChip(
                avatar: Icon(Icons.vpn_key,size: 20,),
                padding: EdgeInsets.symmetric(horizontal: 35),
                label: Text("Sign in with phone "),onSelected: (value){
                setState(() {AuthenticationWidget.loginType=4;});
                Navigator.push(context, MaterialPageRoute(builder:(context) => LoginWithPhoneScreen(),));
               },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
