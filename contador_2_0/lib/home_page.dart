import 'package:flutter/material.dart';
import 'package:contador_2_0/Screens/multiply.dart';
import 'package:contador_2_0/Screens/add_sub.dart';
import 'package:contador_2_0/Screens/prime.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage =0;
  final List<Widget> _pages = [
    const AddSub(),
    const MultiplyC(),
    const Prime(),
    

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        
        body: _pages[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (int index){
            setState(() {
              selectedPage = index;
            });
          }, items: const [
            BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Suma y resta'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Multiplica'),
            BottomNavigationBarItem(icon: Icon(Icons.heat_pump), label: 'Primo'),
          ],

        ),
      ),
    );
  }
}