import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShowcaseView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShowCaseWidget(
        builder: Builder(
          builder: (context) => const HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: GlobalKey(),
      title: 'Welcome to the Home Page!',
      description: 'This is the main screen of your app.',
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Next Page'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: GlobalKey(),
      title: 'Welcome to the Second Page!',
      description: 'This is the second screen of your app.',
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Go Back'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
