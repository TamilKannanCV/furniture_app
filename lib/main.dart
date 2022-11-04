import 'package:flutter/material.dart';
import 'package:furniture_app/screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // We set Poppins as our default font
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorSchemeSeed: const Color(0xFF035AA6),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
