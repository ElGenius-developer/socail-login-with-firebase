import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_social_login/Ui/AuthenticationWidget.dart';
import 'package:test_social_login/Ui/Login_and_register/LoginAndCreateScreen.dart';
import 'package:test_social_login/localData/LocalData.dart';
import 'package:flutter/material.dart';
import 'package:test_social_login/main.dart';
import 'package:test_social_login/services/LoginServices.dart';


Widget createAppBar({bool isHome,BuildContext context}) {

  return AppBar(
    backgroundColor: defaultColor,
    elevation: 0,
    title: Text((isHome == false) ? "Signing" : "Home"),
    automaticallyImplyLeading: false,
    actions: [
      (isHome == true)
          ? FlatButton.icon(
              label: Text(
                "logout",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
// color: Colors.white,
              onPressed: () {
                MyApp.auth.signOut();
                if(AuthenticationWidget.loginType!=4) {
                   if(AuthenticationWidget.loginType==2)//for facebook
                    {
                      FacebookLogin fb = FacebookLogin();
                        fb.logOut();
                    }
                  else if(AuthenticationWidget.loginType==3){// for google
                    GoogleSignIn google= GoogleSignIn();
                    google.signOut();
                  }
                }

              })
          : FlatButton.icon(
              label: Text(
                "guest",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),

              onPressed: () {
                AuthenticationWidget.loginType=5;
                LoginServices().signInAnonymously();
              })
    ],
  );
}
