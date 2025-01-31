// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/pages/homepage.dart';
import 'package:store_app/pages/landing.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_font/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_font'], license);
  });

  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: _ColorScheme,
        textTheme: GoogleFonts.robotoTextTheme(_textTheme),
        useMaterial3: true,
      ).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: _ColorScheme.primary,
          foregroundColor: _ColorScheme.onPrimary,
        ),
      ),
      home: const Landing(),
      routes: {
        '/Homepage': (context) => Homepage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

ColorScheme get _ColorScheme =>
    ColorScheme.fromSeed(seedColor: Colors.deepPurple);

const _regular = FontWeight.w400;
const _medium = FontWeight.w500;
const _semiBold = FontWeight.w600;
// static const _bold = FontWeight.w700;

TextTheme get _textTheme => TextTheme(
      headlineMedium: const TextStyle(
        fontWeight: _medium,
        color: Colors.white,
        fontSize: 20,
      ),
      bodySmall: TextStyle(
        fontWeight: _regular,
        // color: _defaultColorScheme.onSurfaceVariant,
      ),
      headlineSmall: const TextStyle(
        fontWeight: _medium,
      ),
      titleMedium: const TextStyle(
        fontWeight: _medium,
      ),
      bodyLarge: const TextStyle(
        fontWeight: _regular,
      ),
      titleSmall: const TextStyle(
        fontWeight: _medium,
      ),
      bodyMedium: const TextStyle(
        fontWeight: _regular,
        color: Colors.grey,
      ),
      titleLarge: const TextStyle(
        fontWeight: _semiBold,
      ),
      labelLarge: const TextStyle(
        fontWeight: _semiBold,
      ),
    );
