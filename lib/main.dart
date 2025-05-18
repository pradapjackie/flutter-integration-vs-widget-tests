import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;

  void _increment() => setState(() => count++);
  void _decrement() => setState(() => count--);
  void _reset() => setState(() => count = 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Button Counter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Count: $count', key: const Key('counterText')), // ✅ Fixed here
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    key: const Key('incrementButton'),
                    onPressed: _increment,
                    child: const Text('Increment'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    key: const Key('decrementButton'),
                    onPressed: _decrement,
                    child: const Text('Decrement'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    key: const Key('resetButton'),
                    onPressed: _reset,
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}