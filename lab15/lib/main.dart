import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  @override
  CalculatorAppState createState() => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp> {
  int counter = 0;
  double x = 1.0;
  double y = 0.0;

  // Клас для розрахунку функції y = x - 15x^2
  double calculateFunction(double x) {
    return x - 15 * x * x;  // Функція y = x - 15x^2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Natalia's CS-32 Flutter App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Counter: $counter",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "x: $x",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "y = f(x): $y",
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Обчислюємо y на основі значення x
                  y = calculateFunction(x);
                  counter += 1;
                });
              },
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter += 1;
            x += 0.1;  // Змінюємо x для нового розрахунку
          });
        },
        child: const Icon(Icons.person),
      ),
    );
  }
}
