import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFF6C6444), // ΝΕΟ ΧΡΩΜΑ
  scaffoldBackgroundColor: Color(0xFFF9FAFB),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white.withOpacity(0.2),
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.white.withOpacity(0.3)),
      ),
    ),
  ),
  textTheme: GoogleFonts.urbanistTextTheme().copyWith(
    headlineMedium: GoogleFonts.urbanist(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.urbanist(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.urbanist(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[
    CustomColors(
      backgroundGradient: LinearGradient(
        colors: [
          Color(0xFF747048), // ΝΕΟ ΧΡΩΜΑ
          Color(0xFF9A9569), // Μπορείς να αλλάξεις αυτό για πιο φυσική μετάβαση
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ],
);

class CustomColors extends ThemeExtension<CustomColors> {
  final LinearGradient backgroundGradient;
  CustomColors({required this.backgroundGradient});

  @override
  CustomColors copyWith({LinearGradient? backgroundGradient}) {
    return CustomColors(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
    ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) return this;
    return CustomColors(
      backgroundGradient: LinearGradient.lerp(
        backgroundGradient,
        other.backgroundGradient,
        t,
      )!,
    );
  }
}
