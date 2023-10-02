import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador_2_0/Providers/counter_provider.dart';
import 'package:contador_2_0/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_)=> CounterProvider(),
      child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador 2.0',
      home: HomePage(),
    
    );
  }
}