
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:test_social_login/localData/LocalData.dart';
import 'package:test_social_login/model/Users.dart';
 import 'creators/checkUserData.dart';
import 'creators/createAppBar.dart';

class HomeScreen extends StatefulWidget {
  final int loginType;
  final UsersSigned user;
  HomeScreen({Key key,this.loginType,this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //true for login false for register

  @override
  Widget build(BuildContext context) {
   UsersSigned _user= checkUserData(widget.user);
    return Scaffold(
        appBar: createAppBar(isHome: true,context:context ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 50),
                alignment: Alignment.topCenter,
                child: Text(
                  "Welcome ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: defaultColor),
                ),
              ),
              CircleAvatar(
                backgroundColor: defaultColor,
                radius: 53,
                child: CircleAvatar(
                   radius: 50,
                  backgroundImage:(_user.photoUrl.contains('null'))
                  ?AssetImage('assets/user.png'):
                  NetworkImage(_user.photoUrl,)


                ),
                
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(_user.displayName,style: TextStyle(fontSize: 17),)),

            ],
          ),
        ));
  }
}
