import 'package:flutter/material.dart';
import 'package:mobile_store/constant.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: priClr,
      width: size.width * 0.7,
      height: size.height * 0.3,
      child: Image.asset(
        'assets/logo.png',
        color: secClr,

      ),
    );
  }
}
