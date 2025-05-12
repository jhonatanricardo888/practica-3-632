import 'package:flutter/material.dart';

class FibonacciScreen extends StatefulWidget {
  const FibonacciScreen({super.key});

  @override
  FibonacciScreenState createState() => FibonacciScreenState();
}

class FibonacciScreenState extends State<FibonacciScreen> {
  final TextEditingController _numeroController = TextEditingController();
  List<int> _serie = [];

  List<int> _generarFibonacci(int n) {
    if (n <= 0) return [];
    if (n == 1) return [0];
    List<int> serie = [0, 1];
    for (int i = 2; i < n; i++) {
      serie.add(serie[i - 1] + serie[i - 2]);
    }
    return serie;
  }

  void _generarSerie() {
    final n = int.tryParse(_numeroController.text) ?? 0;
    setState(() {
      _serie = _generarFibonacci(n);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Serie Fibonacci')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese cantidad de términos (N)',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generarSerie,
              child: const Text('Generar Serie'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _serie.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Término ${index + 1}: ${_serie[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}