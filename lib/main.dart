import 'package:flutter/material.dart';
import 'config/app_config.dart';

// Convert int → Color
Color toColor(dynamic value) {
  if (value is int) return Color(value);
  return Colors.blue; // fallback
}

// Convert any → String
String toStr(dynamic value) {
  if (value is String) return value;
  return value.toString();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: toStr(environmentConfig["title"]),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: toColor(environmentConfig["primaryColor"]),
        ),
        scaffoldBackgroundColor: toColor(environmentConfig["bgColor"]),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: toStr(environmentConfig["title"]),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

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
        backgroundColor: toColor(environmentConfig["primaryColor"]),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Environment: ${toStr(environmentConfig["title"])}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: toColor(environmentConfig["fabColor"]),
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
