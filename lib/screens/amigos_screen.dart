import 'package:flutter/material.dart';

class AmigosScreen extends StatefulWidget {
  const AmigosScreen({super.key});

  @override
  AmigosScreenState createState() => AmigosScreenState();
}

class AmigosScreenState extends State<AmigosScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _resultado = '';

  bool _sonAmigos(int a, int b) {
    if (a == b) return false;
    return _sumaDivisores(a) == b && _sumaDivisores(b) == a;
  }

  int _sumaDivisores(int n) {
    if (n == 1) return 0;
    int suma = 1;
    for (int i = 2; i <= n / 2; i++) {
      if (n % i == 0) suma += i;
    }
    return suma;
  }

  void _verificarAmigos() {
    final num1 = int.tryParse(_num1Controller.text) ?? 0;
    final num2 = int.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      _resultado = _sonAmigos(num1, num2)
          ? '$num1 y $num2 SON números amigos'
          : '$num1 y $num2 NO son números amigos';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Números Amigos')),
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
              onPressed: _verificarAmigos,
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