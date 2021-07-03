import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pedifacil/shared/themes/app_colors.dart';

class AppTextStyles {
  static final loginText = GoogleFonts.montserrat(
      fontSize: 32, fontWeight: FontWeight.w600, color: AppColors.heading);
  static final errorText = GoogleFonts.lato(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black);
  static final appBarText = GoogleFonts.montserrat(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black);
  static final cardTitle = GoogleFonts.montserrat(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black);
  static final countText = GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black);
  static final descriptionText = GoogleFonts.lato(
      fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[600]);
  static final descriptionHighlight = GoogleFonts.lato(
      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black);
  static final button = GoogleFonts.montserrat(
      fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.background);
}
