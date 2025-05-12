import 'package:flutter/material.dart';

class FactorialScreen extends StatefulWidget {
  const FactorialScreen({super.key});

  @override
  FactorialScreenState createState() => FactorialScreenState();
}

class FactorialScreenState extends State<FactorialScreen> {
  final TextEditingController _numeroController = TextEditingController();
  BigInt _factorial = BigInt.zero;

  BigInt _calcularFactorial(int n) {
    if (n < 0) return BigInt.from(-1);
    if (n == 0) return BigInt.one;
    BigInt result = BigInt.one;
    for (int i = 1; i <= n; i++) {
      result *= BigInt.from(i);
    }
    return result;
  }

  void _calcular() {
    final numero = int.tryParse(_numeroController.text) ?? 0;
    setState(() {
      _factorial = _calcularFactorial(numero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Factorial')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese un número entero positivo',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              child: const Text('Calcular Factorial'),
            ),
            const SizedBox(height: 20),
            Text(
              'Factorial: $_factorial',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}