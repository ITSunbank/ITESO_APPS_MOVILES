import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final int index;

  ItemActividad({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> placeNames = [
      "Vallarta",
      "Tulum",
      "Cancun",
      "Manzanillo",
      "Sayulita",
    ];

    List<String> imageUrls = [
      "https://visitapuertovallarta.com.mx/uploads/static/puerto-vallarta-mexico-movil.webp",
      "https://a.cdn-hotels.com/gdcs/production73/d1624/45ab7e53-4363-41f8-8783-78765ac502ee.jpg",
      "https://www.xcaret.com/assets/xcaret/landings/destinos/cancun.webp",
      "https://www.eternal-expat.com/wp-content/uploads/2020/09/IMG_1988.jpg.webp",
      "https://www.elpueblitosayulita.com/ui/frontend/images/sayulita/sayu-1.jpg",
    ];

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            color: Colors.purple,
            child: Image.network(
              imageUrls[index], // URL de la imagen
              fit: BoxFit.cover,
            ),
          ),
          Text("Day ${index + 1}", style: TextStyle(fontSize: 11)),
          Text(placeNames[index]),
        ],
      ),
    );
  }
}
