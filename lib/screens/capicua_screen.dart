import 'package:flutter/material.dart';

class CapicuaScreen extends StatefulWidget {
  const CapicuaScreen({super.key});

  @override
  CapicuaScreenState createState() => CapicuaScreenState();
}

class CapicuaScreenState extends State<CapicuaScreen> {
  final TextEditingController _numeroController = TextEditingController();
  String _resultado = '';

  bool _esCapicua(String input) {
    return input == input.split('').reversed.join('');
  }

  void _verificarCapicua() {
    final numero = _numeroController.text.trim();
    setState(() {
      _resultado = _esCapicua(numero)
          ? '$numero ES capícua'
          : '$numero NO es capícua';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Número Capícua')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _numeroController,
              decoration: const InputDecoration(labelText: 'Ingrese un número'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verificarCapicua,
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