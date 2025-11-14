import 'package:flutter/material.dart';
import 'config/app_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: environmentConfig["title"] as String? ?? "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: environmentConfig["primaryColor"] as Color? ?? Colors.blue,
        ),
        scaffoldBackgroundColor:
            environmentConfig["bgColor"] as Color? ?? Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void _increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(environmentConfig["title"] as String),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is environment-based build"),
            const SizedBox(height: 10),
            Text(
              "$counter",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        backgroundColor:
            environmentConfig["fabColor"] as Color? ?? Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
