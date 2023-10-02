import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador_2_0/Providers/counter_provider.dart';

class AddSub extends StatelessWidget {
  const AddSub({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add and Subtract"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<CounterProvider>().counter.toString(),
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().increment();
                  },
                  child: const Text('+', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().decrement();
                  },
                  child: const Text('-', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().reset();
                  },
                  child: const Text('Reset', style: TextStyle(fontSize: 24)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
