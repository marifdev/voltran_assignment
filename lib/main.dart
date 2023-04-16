import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voltran Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  List<Duration> tapDurations = [];
  List<Duration> newDurations = [];
  int tapCount = 0;
  DateTime? lastTapTime;
  bool isIncreasing = false;

  void _onTap() {
    final currentTime = DateTime.now();
    final duration = lastTapTime != null ? currentTime.difference(lastTapTime!) : Duration.zero;
    lastTapTime = currentTime;
    setState(() {
      if (isIncreasing) {
        newDurations.add(duration);
      } else {
        tapDurations.add(duration);
      }
    });
  }

  Future<void> _onLongPress() async {
    isIncreasing = true;
    for (var duration in tapDurations) {
      await Future.delayed(duration);
      setState(() {
        tapCount++;
      });
    }

    for (var duration in newDurations) {
      await Future.delayed(duration);
      setState(() {
        tapCount++;
      });
    }

    tapDurations = [];
    newDurations = [];
    lastTapTime = null;
    isIncreasing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voltran Assignment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$tapCount',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onLongPress: _onLongPress,
        child: FloatingActionButton(
          onPressed: _onTap,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
