import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context)=>ThemeData(
  primarySwatch: Colors.deepPurple,
  fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
  appBarTheme: AppBarTheme(
  color: Colors.white,
  centerTitle: true,
  elevation: 0.0,
  iconTheme: IconThemeData(color: Colors.black),
  ),
  );
  static ThemeData darkTheme(BuildContext context)=> ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: dark,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
  ),
  );

  //COLORS

static Color creamColor=Color(0xffF5F0F0);
static Color dark=Vx.gray900;
static Color darkBluishColor=Color(0xff403b58);
static Color lightblue=Vx.purple400;
}
