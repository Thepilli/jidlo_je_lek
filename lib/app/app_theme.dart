import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        error: AppColors.error,
        background: AppColors.backgroundLight,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldLight,
      primaryTextTheme: AppTextTheme.lightTextTheme,
      textTheme: AppTextTheme.lightTextTheme,
      appBarTheme: const AppBarTheme(
        titleSpacing: 0,
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.scaffoldLight,
        foregroundColor: AppColors.black,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        shadowColor: AppColors.bottomSheetShadowLight,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.white,
        shadowColor: AppColors.drawerShadowLight,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundLight,
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryLight),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryLight),
          ),
          labelStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryLight),
          hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryLight),
          filled: true,
          fillColor: AppColors.formFillLight,
          alignLabelWithHint: true),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 15.0),
          shape: const StadiumBorder(),
          foregroundColor: AppColors.scaffoldDark,
          backgroundColor: AppColors.primaryLight,
          side: const BorderSide(color: AppColors.primaryLight, width: 3),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(style: ElevatedButton.styleFrom(foregroundColor: AppColors.black)),
      expansionTileTheme: ExpansionTileThemeData(
          backgroundColor: AppColors.primaryLight,
          collapsedBackgroundColor: AppColors.primaryLight,
          textColor: Colors.white70,
          collapsedTextColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          iconColor: Colors.black54,
          collapsedIconColor: Colors.black54),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      listTileTheme: ListTileThemeData(
          horizontalTitleGap: 20,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: AppColors.primaryLight),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          foregroundColor: AppColors.black,
          side: const BorderSide(color: AppColors.primaryLight),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        error: AppColors.error,
        background: AppColors.backgroundDark,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldDark,
      primaryTextTheme: AppTextTheme.darkTextTheme,
      textTheme: AppTextTheme.darkTextTheme,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.scaffoldDark,
        foregroundColor: AppColors.white,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.bottomSheetDark,
        shadowColor: AppColors.bottomSheetShadowDark,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.drawerDark,
        shadowColor: AppColors.drawerShadowDark,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundDark,
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryDark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryDark),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryDark),
          ),
          labelStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryDark),
          hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryDark),
          filled: true,
          fillColor: AppColors.formFillDark,
          alignLabelWithHint: true),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 15.0),
          shape: const StadiumBorder(),
          foregroundColor: Colors.white70,
          backgroundColor: AppColors.primaryDark,
          side: const BorderSide(color: AppColors.primaryDark, width: 3),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(style: ElevatedButton.styleFrom(foregroundColor: Colors.white)),
      expansionTileTheme: ExpansionTileThemeData(
          backgroundColor: AppColors.primaryDark,
          collapsedBackgroundColor: AppColors.primaryDark,
          textColor: Colors.white70,
          collapsedTextColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          iconColor: Colors.white70,
          collapsedIconColor: Colors.black54),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          foregroundColor: AppColors.primaryDark,
          side: const BorderSide(color: AppColors.primaryDark),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      listTileTheme: ListTileThemeData(
          horizontalTitleGap: 20,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: AppColors.primaryDark),
    );
  }
}
