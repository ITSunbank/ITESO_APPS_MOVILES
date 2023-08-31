import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 23, 68, 31)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tip time'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _roundUp = false;
  double _billAmount = 0.0;
  double _tipAmount = 0.0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int? _selectedRadioValue;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedRadioValue = value;
    });
  }

  void _calculateTotal() {
    double tipPercentage = (_selectedRadioValue ?? 0) / 100.0;
    double tipAmount = _billAmount * tipPercentage;
    double totalAmount = _billAmount + tipAmount;
  if (_roundUp) {
    totalAmount = totalAmount.ceilToDouble(); 
  }
    
    setState(() {
      _tipAmount = tipAmount;
    });

    print("Total Amount: \$${totalAmount.toStringAsFixed(2)}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Icon(Icons.restaurant_rounded),
              SizedBox(
                width: 200,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _billAmount = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Row(
            children: [
              Icon(Icons.local_restaurant),
              Text("How was the service?"),
            ],
          ),
          Column(
            children: [
              RadioListTile<int>(
                value: 20,
                groupValue: _selectedRadioValue,
                onChanged: _handleRadioValueChange,
                title: const Text("Amazing 20%"),
              ),
              RadioListTile<int>(
                value: 18,
                groupValue: _selectedRadioValue,
                onChanged: _handleRadioValueChange,
                title: const Text("Good 18%"),
              ),
              RadioListTile<int>(
                value: 15,
                groupValue: _selectedRadioValue,
                onChanged: _handleRadioValueChange,
                title: const Text("Okay 15%"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_forward),
              const SizedBox(width: 10),
              const Text("Round it up?"),
              const Spacer(),
              Switch(
                value: _roundUp,
                onChanged: (value) {
                  setState(() {
                    _roundUp = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculateTotal,
            child: const Text("Calculate"),
          ),
          const SizedBox(height: 20),
          Text(
            "Tip amount: \$${_tipAmount.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 20),
          ),
        ],
        
      ),
    );
  }
}
