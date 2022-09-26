import 'package:flutter/material.dart';
import 'package:mobile_store/constant.dart';

class DetailTileTitle extends StatelessWidget {
  final String? txt;
  const DetailTileTitle({Key? key, this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt ?? 'null',
      style: TextStyle(
        color: priClr,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
