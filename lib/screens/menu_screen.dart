import 'package:flutter/material.dart';
import 'amigos_screen.dart';
import 'capicua_screen.dart';
import 'vocales_screen.dart';
import 'suma_digitos_screen.dart';
import 'perfecto_screen.dart';
import 'mcd_screen.dart';
import 'primo_screen.dart';
import 'invertir_screen.dart';
import 'factorial_screen.dart';
import 'fibonacci_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú de Operaciones'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuItem(
            context,
            'Números Amigos',
            const AmigosScreen(),
          ),
          _buildMenuItem(
            context,
            'Número Capícua',
            const CapicuaScreen(),
          ),
          _buildMenuItem(
            context,
            'Contar Vocales',
            const VocalesScreen(),
          ),
          _buildMenuItem(
            context,
            'Suma de Dígitos',
            const SumaDigitosScreen(),
          ),
          _buildMenuItem(
            context,
            'Número Perfecto',
            const PerfectoScreen(),
          ),
          _buildMenuItem(
            context,
            'Máximo Común Divisor',
            const MCDScreen(),
          ),
          _buildMenuItem(
            context,
            'Número Primo',
            const PrimoScreen(),
          ),
          _buildMenuItem(
            context,
            'Invertir Número/Palabra',
            const InvertirScreen(),
          ),
          _buildMenuItem(
            context,
            'Factorial',
            const FactorialScreen(),
          ),
          _buildMenuItem(
            context,
            'Serie Fibonacci',
            const FibonacciScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget screen) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}