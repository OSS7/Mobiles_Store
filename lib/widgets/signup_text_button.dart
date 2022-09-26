import 'package:flutter/material.dart';
import 'package:mobile_store/constant.dart';

class SignupTextButton extends StatelessWidget {
  const SignupTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/SignupScreen',
          );
        },
        child: Text(
          'sign up',
          style: TextStyle(
            color: priClr,
          ),
        ));
  }
}
