import 'package:flutter/material.dart';

class PerfectoScreen extends StatefulWidget {
  const PerfectoScreen({super.key});

  @override
  PerfectoScreenState createState() => PerfectoScreenState();
}

class PerfectoScreenState extends State<PerfectoScreen> {
  final TextEditingController _numeroController = TextEditingController();
  String _resultado = '';

  bool _esPerfecto(int n) {
    if (n <= 1) return false;
    int suma = 1;
    for (int i = 2; i <= n / 2; i++) {
      if (n % i == 0) suma += i;
    }
    return suma == n;
  }

  void _verificarPerfecto() {
    final numero = int.tryParse(_numeroController.text) ?? 0;
    setState(() {
      _resultado = _esPerfecto(numero)
          ? '$numero ES un número perfecto'
          : '$numero NO es un número perfecto';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Número Perfecto')),
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
              onPressed: _verificarPerfecto,
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