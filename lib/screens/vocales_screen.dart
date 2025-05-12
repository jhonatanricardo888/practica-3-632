import 'package:flutter/material.dart';

class VocalesScreen extends StatefulWidget {
  const VocalesScreen({super.key});

  @override
  VocalesScreenState createState() => VocalesScreenState();
}

class VocalesScreenState extends State<VocalesScreen> {
  final TextEditingController _textoController = TextEditingController();
  int _totalVocales = 0;

  int _contarVocales(String texto) {
    int count = 0;
    for (var char in texto.toLowerCase().runes) {
      final c = String.fromCharCode(char);
      if ('aeiou'.contains(c)) count++;
    }
    return count;
  }

  void _calcularVocales() {
    setState(() {
      _totalVocales = _contarVocales(_textoController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contar Vocales')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _textoController,
              decoration: const InputDecoration(labelText: 'Ingrese una frase'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularVocales,
              child: const Text('Contar Vocales'),
            ),
            const SizedBox(height: 20),
            Text(
              'Total de vocales: $_totalVocales',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}