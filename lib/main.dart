import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacionar_app/app/app.dart';
import 'package:stacionar_app/firebase_options.dart';
import 'package:stacionar_app/observers.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ProviderScope(
      observers: [
        Observers(),
      ],
      child: const MyApp(),
    ),
  );
}
