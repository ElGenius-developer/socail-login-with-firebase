

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_social_login/localData/EmailAndPasswordValidating.dart';

class CreateTextField extends StatefulWidget {
  final TextEditingController input;
  final int type;
  final Icon icon;
  CreateTextField ({  this.input, this.type, this.icon});
  @override
  _CreateTextFieldState createState() => _CreateTextFieldState();
}

class _CreateTextFieldState extends State<CreateTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        validator: (value) =>(widget.type==1)?EmailAndPasswordValidating().emailValidation(value: value):
        EmailAndPasswordValidating().passwordValidating(value: value),
        controller: widget.input,
        obscureText:(widget.type==1)?false:true,
        decoration: InputDecoration(
          hintText: (widget.type==1)?"Email":"Password",
          prefixIcon: widget.icon,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
