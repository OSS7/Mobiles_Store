import 'package:flutter/material.dart';
import 'package:mobile_store/screens/categories_screen.dart';
import 'package:mobile_store/screens/details_screen.dart';
import 'package:mobile_store/screens/login_screen.dart';
import 'package:mobile_store/screens/products_Screen.dart';
import 'package:mobile_store/screens/signup_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  const keyClientKey = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/CategoriesScreen': (context) => const CategoriesScreen(),
        '/SignupScreen': (context) => const SignupScreen(),
        '/LoginScreen': (context) => const LoginScreen(),
        '/ProductsScreen': (context) => const ProductsScreen(),
        '/DetailsScreen': (context) => const DetailsScreen()
      },
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
