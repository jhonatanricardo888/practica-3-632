import 'package:flutter/material.dart';

class InvertirScreen extends StatefulWidget {
  const InvertirScreen({super.key});

  @override
  InvertirScreenState createState() => InvertirScreenState();
}

class InvertirScreenState extends State<InvertirScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _resultado = '';

  String _invertir(String input) {
    return input.split('').reversed.join('');
  }

  void _invertirInput() {
    setState(() {
      _resultado = _invertir(_inputController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Invertir Número/Palabra')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(
                labelText: 'Ingrese un número o palabra',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _invertirInput,
              child: const Text('Invertir'),
            ),
            const SizedBox(height: 20),
            Text(
              'Resultado: $_resultado',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}