import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class NewsAppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.black),
    displayLarge: GoogleFonts.openSans(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: GoogleFonts.openSans(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
    displaySmall: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black),
    headlineMedium: GoogleFonts.openSans(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    titleLarge: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        // primaryColor:,
        hintColor: Colors.black,
        textTheme: lightTextTheme,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        iconTheme: const IconThemeData(color: Colors.black, opacity: 0.8));
  }
}
