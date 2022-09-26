// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:mobile_store/constant.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController password;
  const LoginButton({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.4,
      height: size.height * 0.04,
      child: MaterialButton(
        color: priClr,
        onPressed: () async {
          final email = widget.email.text.trim();
          final password = widget.password.text.trim();

          final user = ParseUser(email, password, null);

          var response = await user.login();
          if (response.success) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/CategoriesScreen',
              (Route<dynamic> route) => false,
            );
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    "Error!",
                  ),
                  content: const Text(
                    'errorMessage',
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text(
                        "OK",
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Text(
          'Login',
          style: TextStyle(
            color: secClr,
          ),
        ),
      ),
    );
  }
}
