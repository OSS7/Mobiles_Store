import 'package:flutter/material.dart';
import 'package:mobile_store/constant.dart';
import 'package:mobile_store/widgets/login_button.dart';
import 'package:mobile_store/widgets/logo_container.dart';
import 'package:mobile_store/widgets/signup_text_button.dart';
import 'package:mobile_store/widgets/txt_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: secClr,
        foregroundColor: priClr,
        title: const Text(
          'Login',
        ),
      ),
      backgroundColor: priClr,
      body: Column(
        children: [
          const LogoContainer(),
          Expanded(
            child: Container(
              width: size.width,
              padding: topPadding,
              decoration: BoxDecoration(
                boxShadow: const [BoxShadow(color: Colors.black,offset: Offset(0.2,0.5))],
                color: secClr,
                borderRadius: leftRightRadius,
              ),
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
                          'Log in',
                          style: TextStyle(
                            color: priClr,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
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
                  LoginButton(email: _email, password: _password),
                  const SignupTextButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
