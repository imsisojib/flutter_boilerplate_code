import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData buildLightTheme(BuildContext context) {
  final base = ThemeData.light();
  return base.copyWith(
    bottomAppBarColor: AppColors.primaryColorLight,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.primaryColorLight,
      modalBackgroundColor: Colors.white.withOpacity(0.7),
    ),
    cardColor: AppColors.cardColorLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColorLight,
      secondary: AppColors.secondaryColorLight,
      surface: AppColors.surfaceColorLight,
      error: AppColors.errorColorLight,
      onPrimary: AppColors.onPrimaryColorLight,
      onSecondary: AppColors.onSecondaryColorLight,
      onBackground: AppColors.onBackgroundColorLight,
      onSurface: AppColors.onSurfaceColorLight,
      onError: AppColors.onErrorColorLight,
      background: AppColors.backgroundColorLight,
    ),
    textTheme: _buildLightTextTheme(base.textTheme),
    scaffoldBackgroundColor: AppColors.scaffoldColorLight,
  );
}

ThemeData buildDarkTheme(BuildContext context) {
  final base = ThemeData.dark();
  return base.copyWith(
    /*bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.darkDrawerBackground,
      modalBackgroundColor: Colors.black.withOpacity(0.7),
    ),*/
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      color: AppColors.scaffoldColorDark,
      shadowColor: AppColors.primaryColorDark.withOpacity(.3),
      elevation: 7,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: AppColors.secondaryColorDark,
      ),
      titleTextStyle: GoogleFonts.rubik(
        fontWeight: FontWeight.normal,
        fontSize: 18.sp,
        letterSpacing: 0.2,
        color: AppColors.secondaryColorDark,
      ),
    ),
    cardColor: AppColors.darkCardBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColorDark,
      secondary: AppColors.secondaryColorDark,
      surface: AppColors.surfaceColorDark,
      error: AppColors.errorColorDark,
      onPrimary: AppColors.onPrimaryColorDark,
      onSecondary: AppColors.onSecondaryColorDark,
      onBackground: AppColors.onBackgroundColorDark,
      onSurface: AppColors.onSurfaceColorDark,
      onError: AppColors.onErrorColorDark,
      background: AppColors.backgroundColorDark,
    ),
    textTheme: _buildDarkTextTheme(base.textTheme),
    scaffoldBackgroundColor: AppColors.scaffoldColorDark,
    bottomAppBarColor: AppColors.scaffoldColorDark,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.scaffoldColorDark,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: Colors.red,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
      )
    )
  );
}

TextTheme _buildLightTextTheme(TextTheme base) {
  return base.copyWith(
    headline4: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 34,
      letterSpacing: 0.4,
      height: 0.9,
      color: AppColors.textColorLight,
    ),
    headline5: GoogleFonts.workSans(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: 0.27,
      color: AppColors.textColorLight,
    ),
    headline6: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 0.18,
      color: AppColors.textColorLight,
    ),
    subtitle2: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: -0.04,
      color: AppColors.textColorLight,
    ),
    bodyText1: GoogleFonts.workSans(
      fontWeight: FontWeight.normal,
      fontSize: 16.sp,
      letterSpacing: 0.2,
      color: AppColors.textColorLight,
    ),
    bodyText2: GoogleFonts.workSans(
      fontWeight: FontWeight.normal,
      fontSize: 14.sp,
      letterSpacing: -0.05,
      color: AppColors.textColorLight,
    ),
    caption: GoogleFonts.workSans(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      letterSpacing: 0.2,
      color: AppColors.textColorLight,
    ),
  );
}

TextTheme _buildDarkTextTheme(TextTheme base) {
  return base.copyWith(
    headline4: GoogleFonts.rubik(
      fontWeight: FontWeight.w600,
      fontSize: 34.sp,
      letterSpacing: 0.4,
      height: 0.9,
      color: AppColors.textColorDark,
    ),
    headline5: GoogleFonts.rubik(
      fontWeight: FontWeight.bold,
      fontSize: 24.sp,
      letterSpacing: 0.27,
      color: AppColors.textColorDark,
    ),
    headline6: GoogleFonts.rubik(
      fontWeight: FontWeight.w600,
      fontSize: 20.sp,
      letterSpacing: 0.18,
      color: AppColors.textColorDark,
    ),
    subtitle2: GoogleFonts.rubik(
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
      letterSpacing: -0.04,
      color: AppColors.textColorDark,
    ),
    bodyText1: GoogleFonts.rubik(
      fontWeight: FontWeight.normal,
      fontSize: 16.sp,
      letterSpacing: 0.2,
      color: AppColors.textColorDark,
    ),
    bodyText2: GoogleFonts.rubik(
      fontWeight: FontWeight.normal,
      fontSize: 14.sp,
      letterSpacing: -0.05,
      color: AppColors.textColorDark,
    ),
    caption: GoogleFonts.rubik(
      fontWeight: FontWeight.normal,
      fontSize: 12.sp,
      letterSpacing: 0.2,
      color: AppColors.textColorDark,
    ),
  );
}