import 'package:flutter/material.dart';

class MCDScreen extends StatefulWidget {
  const MCDScreen({super.key});

  @override
  MCDScreenState createState() => MCDScreenState();
}

class MCDScreenState extends State<MCDScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  int _mcd = 0;

  int _calcularMCD(int a, int b) {
    while (b != 0) {
      final temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  void _calcular() {
    final num1 = int.tryParse(_num1Controller.text) ?? 0;
    final num2 = int.tryParse(_num2Controller.text) ?? 0;
    setState(() {
      _mcd = _calcularMCD(num1, num2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Máximo Común Divisor')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Primer número'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Segundo número'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              child: const Text('Calcular MCD'),
            ),
            const SizedBox(height: 20),
            Text(
              'MCD: $_mcd',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}