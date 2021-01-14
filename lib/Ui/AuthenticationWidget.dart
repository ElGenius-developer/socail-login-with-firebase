import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_social_login/Ui/Login_and_register/LoginAndCreateScreen.dart';
import 'package:flutter/material.dart';
import 'package:test_social_login/model/Users.dart';
import 'HomeScreen.dart';


class AuthenticationWidget extends StatelessWidget {
static int loginType;
  //1 for login/create with email and password
  //2 for facebook login ,
  //3 for google login
  //4 for mobile login
  //5 for guest
  static UsersSigned homeUser;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return StreamBuilder(
        stream: _auth.userChanges(),
        builder: (context, snapshot){
          if(snapshot.data==null) {
          return LoginAndCreateScreen();
        } else {

            homeUser=UsersSigned().fillUserData(_auth.currentUser);
          return HomeScreen(
            loginType: loginType,
            user: homeUser,
          );
        }
      },);

  }
}
