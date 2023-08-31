import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Iteso',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _likes = 0;

  // Variables para controlar el color de los botones
  Color _foodButtonColor = Colors.black;
  Color _infoButtonColor = Colors.black;
  Color _locationButtonColor = Colors.black;

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _incrementLikes() {
    setState(() {
      _likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network("https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg"),
            ListTile(
              title: const Text("El ITESO", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text("San Pedro Tlaquepaque, Jal", style: TextStyle(fontWeight: FontWeight.w200)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      _incrementLikes();
                    },
                    icon: const Icon(Icons.thumb_up),
                  ),
                  Text(
                    " $_likes",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      iconSize: 48,
                      onPressed: () {
                        _showSnackBar(context, "¡Botón Comida presionado!");
                        setState(() {
                          _foodButtonColor = _foodButtonColor == Colors.black ? Colors.indigo : Colors.black;
                        });
                      },
                      icon: Icon(Icons.food_bank, color: _foodButtonColor),
                    ),
                    const Text("Comida"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 48,
                      onPressed: () {
                        _showSnackBar(context, "¡Botón Info presionado!");
                        setState(() {
                          _infoButtonColor = _infoButtonColor == Colors.black ? Colors.indigo : Colors.black;
                        });
                      },
                      icon: Icon(Icons.info, color: _infoButtonColor),
                    ),
                    const Text("Info"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 48,
                      onPressed: () {
                        _showSnackBar(context, "¡Botón Ubicación presionado!");
                        setState(() {
                          _locationButtonColor = _locationButtonColor == Colors.black ? Colors.indigo : Colors.black;
                        });
                      },
                      icon: Icon(Icons.location_history, color: _locationButtonColor),
                    ),
                    const Text("Ubicación"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 64,),
            const Text(
              '''El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente) 
              es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.
              La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. 
              La universidad es nombrada como la Universidad Jesuita de Guadalajara''', 
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
