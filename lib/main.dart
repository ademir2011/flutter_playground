import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/exercises_page.dart';
import 'package:flutter_playground/screens/home_page.dart';
import 'package:flutter_playground/screens/splashscreen_page.dart';
import 'package:flutter_playground/utils/app_routes.dart';

class TypeMode {
  static ThemeMode theme = ThemeMode.dark;

  static toogle() {
    if (theme == ThemeMode.dark) {
      theme = ThemeMode.light;
    } else {
      theme = ThemeMode.dark;
    }
  }
}

void main(List<String> args) => runApp(
      const MyApp(),
    );

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: TypeMode.theme,
      theme: ThemeData(
        primaryColor: const Color(0xFF055AA3),
        backgroundColor: const Color(0xFFD6DFE4),
        cardTheme: const CardTheme(
          color: Color(0xFFEDF4F8),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF172026),
          ),
          headline2: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF172026),
          ),
          bodyText1: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF51565A),
          ),
          bodyText2: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF172026),
          ),
        ),
        primaryIconTheme: const IconThemeData(color: Colors.black),
        iconTheme: const IconThemeData(color: Colors.white),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF055AA3),
        highlightColor: const Color(0xFFEDF4F8),
        cardTheme: const CardTheme(
          color: Color(0xFF172026),
        ),
        backgroundColor: const Color(0xFF121517),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFEDF4F8),
          ),
          headline2: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFFEDF4F8),
          ),
          bodyText1: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF51565A),
          ),
          bodyText2: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFFEDF4F8),
          ),
        ),
        primaryIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF055AA3),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASH,
      routes: {
        AppRoutes.SPLASH: (context) => const SplashScreenPage(),
        AppRoutes.HOME: (context) => HomePage(toogleTheme: toogleTheme),
        AppRoutes.EXERCISES: (context) => ExercisesPage(toogleTheme: toogleTheme),
      },
    );
  }

  void toogleTheme(value) {
    setState(() {
      TypeMode.toogle();
    });
  }
}
