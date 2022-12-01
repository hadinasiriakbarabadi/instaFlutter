import 'package:flutter/material.dart';
import 'package:havadar/shared/shared.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
      ),
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}