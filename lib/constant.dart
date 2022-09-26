import 'package:flutter/material.dart';
import 'package:mobile_store/models/category.dart';

Color secClr = const Color(0xFF002365);
Color priClr = Colors.white;

List<CategoryItem> categories = [
  CategoryItem(
    title: 'Samsung',
    color: Colors.white,
  ),
  CategoryItem(
    title: 'Apple',
    color: Colors.blueAccent,
  ),
  CategoryItem(
    title: 'Huawei',
    color: Colors.white,
  ),
  CategoryItem(
    title: 'Sony',
    color: Colors.blueAccent,
  ),
  CategoryItem(
    title: 'Xiaomi',
    color: Colors.orangeAccent.shade700,
  ),
];

const leftRightRadius = BorderRadius.only(
  topRight: Radius.circular(
    30,
  ),
  topLeft: Radius.circular(
    30,
  ),
);

const topPadding =  EdgeInsets.only(
  top: 60,
);