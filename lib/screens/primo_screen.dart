import 'package:flutter/material.dart';

class PrimoScreen extends StatefulWidget {
  const PrimoScreen({super.key});

  @override
  PrimoScreenState createState() => PrimoScreenState();
}

class PrimoScreenState extends State<PrimoScreen> {
  final TextEditingController _numeroController = TextEditingController();
  String _resultado = '';

  bool _esPrimo(int n) {
    if (n <= 1) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;
    for (int i = 3; i * i <= n; i += 2) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void _verificarPrimo() {
    final numero = int.tryParse(_numeroController.text) ?? 0;
    setState(() {
      _resultado = _esPrimo(numero)
          ? '$numero ES un número primo'
          : '$numero NO es un número primo';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Número Primo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Ingrese un número'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verificarPrimo,
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 20),
            Text(_resultado, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}