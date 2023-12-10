import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/tabs.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

var theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark, seedColor: Colors.deepPurple),
    useMaterial3: true,
    textTheme: GoogleFonts.latoTextTheme());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
