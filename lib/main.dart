import 'package:flutter/material.dart';
import 'config/app_config.dart';   // Load environment config

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: environmentConfig["title"],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: environmentConfig["primaryColor"],
        ),
        scaffoldBackgroundColor: environmentConfig["bgColor"],
        appBarTheme: AppBarTheme(
          backgroundColor: environmentConfig["primaryColor"],
        ),
      ),
      home: MyHomePage(title: environmentConfig["title"]),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Environment: ${environmentConfig["title"]}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text('Tap the button and see the counts!'),
            const SizedBox(height: 10),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: environmentConfig["fabColor"],
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
