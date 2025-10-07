import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readky/view/screens/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Modern system UI overlay style for Flutter 3.x
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Readky - News App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Open Sans',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      home: const WelcomePage(),
    );
  }
}
