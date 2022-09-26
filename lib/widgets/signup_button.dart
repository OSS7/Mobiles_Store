import 'package:flutter/material.dart';
import 'package:mobile_store/constant.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class SignupButton extends StatefulWidget {
  final TextEditingController name;
  final TextEditingController password;
  final TextEditingController email;
  const SignupButton({Key? key, required this.name, required this.password, required this.email}) : super(key: key);

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.4,
      height: size.height * 0.04,
      child: MaterialButton(
        color: priClr,
        onPressed: () async {
          final username = widget.name.text.trim();
          final email = widget.email.text.trim();
          final password = widget.password.text.trim();

          final user =
          ParseUser.createUser(username, password, email);

          var response = await user.signUp();

          if (response.success) {
            // Navigator.pushNamed(context, '/LoginScreen');
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Success!"),
                  content:
                  const Text("User was successfully created!"),
                  actions: <Widget>[
                    TextButton(
                        child: const Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(
                              context, '/LoginScreen');
                        }),
                  ],
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Error!"),
                  content: const Text('errorMessage'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text("OK"),
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
          'Sign up',
          style: TextStyle(color: secClr),
        ),
      ),
    );
  }
}
