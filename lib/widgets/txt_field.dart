import 'package:flutter/material.dart';
import 'package:mobile_store/constant.dart';

enum inputType { password, normal }

class TxtField extends StatelessWidget {
  final String? hntText;
  final inputType type;
  final TextEditingController controller;
  // Function(String)? onChang;
  const TxtField(
      {Key? key,
      this.hntText,
      this.type = inputType.normal,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      height: 75,
      child: TextField(
        controller: controller,
        obscureText: type == inputType.password ? true : false,
        style: TextStyle(
          color: priClr,
        ),
        cursorColor: Colors.white,
        cursorHeight: 20,
        decoration: InputDecoration(
          hintText: hntText,
          hintStyle: TextStyle(
            color: priClr,
          ),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: priClr,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: priClr,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
