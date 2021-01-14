import 'package:test_social_login/Ui/creators/CreateButtons.dart';
import 'package:test_social_login/Ui/creators/CreateTextField.dart';
import 'package:test_social_login/Ui/creators/ShowErrorLine.dart';
import 'package:test_social_login/localData/LocalData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_social_login/main.dart';
import '../AuthenticationWidget.dart';

class CreateLoginForm extends StatefulWidget {
  @override
  _CreateLoginFormState createState() => _CreateLoginFormState();
}

class _CreateLoginFormState extends State<CreateLoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String error;
  bool resetPassword;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin = true;
    resetPassword = false;
    error = '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CreateTextField(
              icon: Icon(
                Icons.email,
              ),
              input: _emailController,
              type: 1),
          CreateTextField(
              icon: Icon(
                Icons.vpn_key_rounded,
              ),
              input: _passwordController,
              type: 2),
          ShowErrorLine(
            email: _emailController.text,
            error: error,
            resetPassword: resetPassword,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              createButtons(validateSignIn, "Login", Colors.blue[800], false),
              createButtons(validateSignUp, "Sign up", Colors.green[600], true),
            ],
          ),
          GestureDetector(
              child: Text(
                "Forget password",
                style: TextStyle(color: Colors.red[900]),
              ),
              onTap: () async {
                await MyApp.auth
                    .resetPassword(email: _emailController.text)
                    .whenComplete(() {
                  Scaffold.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      content: Text(
                        "reset link sent .. check your inbox",
                        textScaleFactor: 1.2,
                      ),
                      duration: Duration(seconds: 3),
                    ));
                });
              }),
        ],
      ),
    );
  }

  void validateSignIn() async {
    if (_formKey.currentState.validate()) {
      MyApp.auth
          .signInWithEmailAndPassword(
              _emailController.text, _passwordController.text)
          .then((value) {
        setState(() {
          AuthenticationWidget.loginType = 1;
        });

        if (value != null) {
          if (value.contains(errors[1])) {
            setState(() {
              error = "email not exist please register";
            });
          } else if (value.contains(errors[2])) {
            setState(() {
              error = "incorrect password";
              resetPassword = true;
            });
          }
        }
      });
    }
  }

  void validateSignUp() async {
    if (_formKey.currentState.validate()) {
      MyApp.auth
          .signUpWithEmailAndPassword(
              _emailController.text, _passwordController.text)
          .then((value) {
        setState(() {
          AuthenticationWidget.loginType = 1;
        });

        if (value != null) {
          if (value.contains(errors[0])) {
            setState(() {
              error = "email is already registered";
            });
          }
        }
      });
    }
  }
}
