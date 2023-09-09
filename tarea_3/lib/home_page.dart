import 'package:flutter/material.dart';
import 'package:tarea_3/item_actividad.dart';
import 'package:tarea_3/info_lugar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double imageHeight = constraints.maxHeight / 4;

          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: imageHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  child: Image.network(
                    'https://e1.pxfuel.com/desktop-wallpaper/657/762/desktop-wallpaper-animated-clipart-beach-animated-beach-transparent-for-on-webstockreview-2020-cartoon-ocean.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: imageHeight,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(index: index);
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () { ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Reservación en progreso'),
                        ),
                      );
                      },
                      color: Colors.red,
                      child: const Text(
                        "Start booking",
                        style: TextStyle(
                          color: Colors.white, 
                        ),
                      ),
                      )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
