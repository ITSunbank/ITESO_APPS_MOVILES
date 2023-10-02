import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador_2_0/Providers/counter_provider.dart';

class MultiplyC extends StatefulWidget {
  const MultiplyC({Key? key});

  @override
  State<MultiplyC> createState() => _MultiplyCState();
}

class _MultiplyCState extends State<MultiplyC> {
  void mostrarSnackBar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiply"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Text(
              context.watch<CounterProvider>().counter.toString(),
              style: const TextStyle(fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().multiDos();
                    mostrarSnackBar('x2');
                  },
                  child: const Text('x2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().multiTres();
                    mostrarSnackBar('x3');
                  },
                  child: const Text('x3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().multiCinco();
                    mostrarSnackBar('x5');
                  },
                  child: const Text('x5'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
