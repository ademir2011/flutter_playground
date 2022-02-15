import 'package:flutter/material.dart';
import 'package:flutter_playground/components/ctheme_dark.dart';
import 'package:flutter_playground/components/ctheme_light.dart';
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
      theme: CThemeLight.theme,
      darkTheme: CThemeDark.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASH,
      routes: {
        AppRoutes.SPLASH: (context) => const SplashScreenPage(),
        AppRoutes.HOME: (context) => HomePage(toogleTheme: toogleTheme),
        AppRoutes.EXERCISES: (context) => ExercisesPage(toogleTheme: toogleTheme),
      },
    );
  }

  void toogleTheme() {
    setState(() {
      TypeMode.toogle();
    });
  }
}
