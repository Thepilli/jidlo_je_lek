import 'package:stacionar_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/navigation_panel/navigation_panel.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: '.env');

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(
        const MyApp(),
      ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stacionar',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: currentTheme.currentTheme,
      // home: const Scaffold(
      //   body: Center(child: MealPlanDetailContainer()),
      // ),
      home: const TabPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
