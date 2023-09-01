import 'package:flutter/material.dart';
import 'package:flutter1_app/utils/routes.dart';
import 'package:flutter1_app/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoutes,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoutes: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
