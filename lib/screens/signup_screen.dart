import 'package:flutter/material.dart';
import 'package:mobile_store/constant.dart';
import 'package:mobile_store/widgets/logo_container.dart';
import 'package:mobile_store/widgets/signup_button.dart';
import 'package:mobile_store/widgets/txt_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secClr,
        foregroundColor: priClr,
        title: const Text(
          'Sign up',
        ),
      ),
      backgroundColor: priClr,
      body: Column(
        children: [
          const LogoContainer(),
          Expanded(
            child: Container(
              padding: topPadding,
              decoration: BoxDecoration(
                color: secClr,
                borderRadius: leftRightRadius,
              ),
              width: size.width,
              // height: size.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      20.0,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: priClr,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TxtField(
                    controller: _name,
                    hntText: 'Name',
                  ),
                  TxtField(
                    controller: _email,
                    hntText: 'Email',
                  ),
                  TxtField(
                    controller: _password,
                    hntText: 'Password',
                    type: inputType.password,
                  ),
                  SignupButton(
                    name: _name,
                    password: _password,
                    email: _email,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
