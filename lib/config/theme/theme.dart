import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primary = Color(0xFFFFB101);
  static const Color background = Color(0xFFE6F4FF);
  static const Color white = Colors.white;
  static const Color textGrey = Colors.black54;
  static const Color borderGrey = Color(0xFFE0E0E0);

  // Text Styles
  static const TextStyle labelSmall = TextStyle(
    color: textGrey,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle currencyText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
  );

  static const TextStyle inputText = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );

  static const TextStyle amountText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle infoLabelText = TextStyle(
    color: Colors.grey,
    fontSize: 13,
  );

  static TextStyle infoValueText = TextStyle(
    color: Colors.grey.shade700,
    fontSize: 13,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  // Button Styles
  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: primary,
    foregroundColor: white,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  // Decorations
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: const Offset(0, 5),
      ),
    ],
  );

  static final BoxDecoration currencySelectorDecoration = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(25),
    border: Border.all(
      color: primary,
      width: 2,
    ),
  );

  static const BoxDecoration swapButtonDecoration = BoxDecoration(
    color: primary,
    shape: BoxShape.circle,
  );

  static final BoxDecoration inputDecoration = BoxDecoration(
    border: Border.all(color: borderGrey),
    borderRadius: BorderRadius.circular(8),
  );

  static final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: primary),
  );

  static final defaultInputDecoration = InputDecorationTheme(
    border: inputBorder,
    enabledBorder: inputBorder,
    focusedBorder: inputBorder,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );

  // Theme Data
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          primary: primary,
        ),
        scaffoldBackgroundColor: background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: primaryButton,
        ),
        inputDecorationTheme: defaultInputDecoration,
      );
}
