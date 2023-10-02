import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador_2_0/Providers/counter_provider.dart';

class Prime extends StatefulWidget {
  const Prime({Key? key});

  @override
  State<Prime> createState() => _PrimeState();
}

class _PrimeState extends State<Prime> {
  bool isPrime(int number) {
    if (number <= 1) return false;
    if (number <= 3) return true;

    if (number % 2 == 0 || number % 3 == 0) return false;

    for (int i = 5; i * i <= number; i += 6) {
      if (number % i == 0 || number % (i + 2) == 0) {
        return false;
      }
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final int counter = context.watch<CounterProvider>().counter;
    final bool isNumberPrime = isPrime(counter);

    final Color backgroundColor = isNumberPrime ? Colors.green : Colors.blue;

    return Scaffold(
      appBar: AppBar(
        title: Text("Prime number"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
          children: [
            Text(
              counter.toString(),
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              isNumberPrime ? "Its Prime" : "Not Prime",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor, // Color de fondo
    );
  }
}
