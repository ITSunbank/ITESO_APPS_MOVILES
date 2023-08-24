import 'package:flutter/material.dart';

void main() => runApp(const CardExampleApp());

class CardExampleApp extends StatelessWidget {
  const CardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Mc flutter')),
        body: const CardExample(),
      ),
    );
  }
}

class CardExample extends StatefulWidget {
  const CardExample({super.key});

  @override
  _CardExampleState createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  List<Color> _iconColors = [Colors.black, Colors.black, Colors.black, Colors.black];

  void color_swap(int index) {
    setState(() {
      if (_iconColors[index] == Colors.black) {
        _iconColors[index] = Colors.indigo;
      } else {
        _iconColors[index] = Colors.black;
      }
    });

    // Mostrar un Snackbar al cambiar el color
    final snackBar = SnackBar(
      content: Text('Hola profe'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Flutter McFlutter'),
                subtitle: Text('Experienced App Developer'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => color_swap(0),
                    child: Icon(Icons.person, color: _iconColors[0]),
                  ),
                  SizedBox(width: 60), 
                  GestureDetector(
                    onTap: () => color_swap(1),
                    child: Icon(Icons.lock_clock, color: _iconColors[1]),
                  ),
                  SizedBox(width: 60), 
                  GestureDetector(
                    onTap: () => color_swap(2),
                    child: Icon(Icons.phone_android, color: _iconColors[2]),
                  ),
                  SizedBox(width: 60), 
                  GestureDetector(
                    onTap: () => color_swap(3),
                    child: Icon(Icons.phone_iphone, color: _iconColors[3]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
