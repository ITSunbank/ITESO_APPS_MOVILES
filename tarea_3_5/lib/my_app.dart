import 'package:flutter/material.dart';
import 'recipeview.dart'; // Importa el archivo recipeview.dart

void main() {
  runApp(MyApp());
}

class Recipe {
  final String title;
  final String imageUrl;
  final String ingredients;
  final String steps;
  final String time;
  final String price;
  final String complexity;

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.time,
    required this.price,
    required this.complexity,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Recipe> recipes = [
      Recipe(
        title: 'Sopa de espinacas',
        imageUrl: 'assets/images/recipe1.jpg',
        ingredients: '1 cucharada. Aceite de Maíz Mazola® ( 15 mililitros de aceite)¾ tazas de zanahorias peladas y cortadas en cubitos (85 gramos)1 jitomate/tomate grande o 2 tomates roma, picados (300 gramos)⅛ de una cebolla blanca grande, picada 1 diente de ajo pequeño, picado 4 tazas de agua*1 taza de pasta con forma de conchas pequeñas (100 gramos) 2 cucharaditas Caldo de pollo (ver Notas) 1½ taza de hojas espinacas cortadas (50 gramos) Sal al gusto',
        steps: 'Calienta el aceite en una olla mediana a fuego medio-alto. Una vez que el aceite esté caliente, agrega las zanahorias picadas y sofreir durante unos 5 minutos. Pasado este tiempo, deben verse semicocidas y tener un color naranja brillante. Mientras se cocinan las zanahorias, coloca los tomates picados, la cebolla, el ajo y 2 tazas de agua en una licuadora. Procesar para hacer una salsa tersa. Reserva. Ahora que sus zanahorias se han estado cocinando durante 5 minutos, añade la pasta y sofreir durante unos 3 minutos. Revuelve constantemente hasta obtener un color dorado claro en la pasta. Está bien si la pasta tiene algunas partes más doradas. ¡Esto agrega más sabor!',
        time: '25  min',
        price: '\$',
        complexity: 'Fácil',
      ),
      Recipe(
        title: 'Espagueti Rojo',
        imageUrl: 'assets/images/recipe2.jpg',
        ingredients: 'Espagueti, Aceite de maíz ,Cebolla blanca ,Diente de ajo ,Tomate rojo ,Orégano mexicano ,Caldo de pollo en polvo , Sal y pimienta al gusto.',
        steps: 'Cocina la pasta en una olla grande con 4 litros de agua hirviendo y 1 cucharadita de sal. Cocina según las instrucciones del paquete hasta que esté AL DENTE, por lo general unos 6 minutos. Retira la olla del fuego. La pasta no debe estar demasiado cocida en este punto, recuerda que se seguirá cocinando en la salsa.',
        time: '45 min',
        price: '\$\$',
        complexity: 'Media',
      ),
    ];

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 37, 25, 20), 
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 37, 25, 20),
        ),

      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quick & Easy'),
        ),
        body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RecipeView(
                      title: recipes[index].title,
                      imageUrl: recipes[index].imageUrl,
                      ingredients: recipes[index].ingredients,
                      steps:  recipes[index].steps,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 5.0,
                margin: EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    Container(
                      height: 150, // Ajusta la altura deseada
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(recipes[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          recipes[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.access_time, size: 16),
                              SizedBox(width: 4),
                              Text(recipes[index].time),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.attach_money, size: 16),
                              SizedBox(width: 4),
                              Text(recipes[index].price),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, size: 16),
                              SizedBox(width: 4),
                              Text(recipes[index].complexity),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
