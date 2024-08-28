import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class GenChemTheme {
  static const primaryColor = Color(0xFF004191);

  static ThemeData light() {
    final base = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
        primary: primaryColor,
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
    );

    return base.copyWith(
      iconTheme: base.iconTheme.copyWith(color: Colors.black87),
      primaryTextTheme: buildTextTheme(base.primaryTextTheme),
      textTheme: buildTextTheme(base.textTheme).apply(
        bodyColor: Colors.black87,
        displayColor: Colors.black87,
      ),
    );
  }

  static TextTheme buildTextTheme(TextTheme baseTextTheme) {
    final base = GoogleFonts.ibmPlexSansKrTextTheme(baseTextTheme);
    return base.copyWith(
      titleLarge: base.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
