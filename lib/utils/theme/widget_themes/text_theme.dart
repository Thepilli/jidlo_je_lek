import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacionar_app/constants/colors.dart';

class JTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 20, color: jPrimaryLightColor, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(fontSize: 24, color: Colors.black54, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.poppins(fontSize: 24, color: Colors.black54, fontWeight: FontWeight.w700),
    headlineLarge: GoogleFonts.poppins(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w600),
    headlineMedium: GoogleFonts.poppins(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w600),
    bodyLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.poppins(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.normal),
    // aka tile
    labelLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.normal),
    // aka buttonBlack
    labelMedium: GoogleFonts.poppins(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.normal),
    // aka buttonWhite
    labelSmall: GoogleFonts.poppins(fontSize: 14, color: Colors.white70, fontWeight: FontWeight.normal),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 20, color: jPrimaryDarkColor, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(fontSize: 24, color: Colors.white60, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.poppins(fontSize: 24, color: Colors.white60, fontWeight: FontWeight.w700),
    headlineLarge: GoogleFonts.poppins(fontSize: 20, color: Colors.white70, fontWeight: FontWeight.w600),
    headlineMedium: GoogleFonts.poppins(fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.white60, fontWeight: FontWeight.w600),
    bodyLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.white60, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.poppins(fontSize: 14, color: Colors.white60, fontWeight: FontWeight.normal),
    // aka tile
    labelLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.normal),
    // aka button
    labelMedium: GoogleFonts.poppins(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.normal),
    // aka buttonInverse
    labelSmall: GoogleFonts.poppins(fontSize: 14, color: Colors.white70, fontWeight: FontWeight.normal),
  );
}

// Text(jProfile, style: Theme.of(context).textTheme.headlineLarge),
// Text(jProfile, style: Theme.of(context).textTheme.headlineMedium),
