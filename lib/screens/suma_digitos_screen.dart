import 'package:flutter/material.dart';

class SumaDigitosScreen extends StatefulWidget {
  const SumaDigitosScreen({super.key});

  @override
  SumaDigitosScreenState createState() => SumaDigitosScreenState();
}

class SumaDigitosScreenState extends State<SumaDigitosScreen> {
  final TextEditingController _numeroController = TextEditingController();
  int _suma = 0;

  int _sumarDigitos(String numero) {
    return numero.runes.fold(0, (sum, char) {
      final digit = int.tryParse(String.fromCharCode(char)) ?? 0;
      return sum + digit;
    });
  }

  void _calcularSuma() {
    setState(() {
      _suma = _sumarDigitos(_numeroController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Suma de Dígitos')),
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
              onPressed: _calcularSuma,
              child: const Text('Calcular Suma'),
            ),
            const SizedBox(height: 20),
            Text(
              'Suma de dígitos: $_suma',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}