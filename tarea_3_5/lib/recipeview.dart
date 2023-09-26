import 'package:flutter/material.dart';

class RecipeView extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String ingredients;
  final String steps;

  RecipeView({
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
  });

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star_border : Icons.star,
              color: Colors.white,
            ),
            onPressed: () {
              toggleFavorite();
              final snackBar = SnackBar(
                content: Text(isFavorite ? 'Agregado a favoritos' : 'Eliminado de favoritos'),
                duration: Duration(seconds: 2),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            widget.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 220.0, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ingredientes',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 133, 80, 10),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.ingredients,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 88, 85, 80),
                  ),
                ),
                SizedBox(height: 16),
                const Text(
                  'Pasos',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 133, 80, 10),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.steps,
                  style: const TextStyle(
                    fontSize: 16.0,
                     color: Color.fromARGB(255, 88, 85, 80),
                  ),
                ),
                // Aquí puedes mostrar más detalles de la receta si lo deseas
              ],
            ),
          ),
        ],
      ),
    );
  }
}
