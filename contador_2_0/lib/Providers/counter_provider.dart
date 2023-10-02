import 'package:flutter/material.dart';


//me va a estar diciendo que es lo que pasa en toos lados
//aqui es donde crearemos nuestro contador
class CounterProvider with ChangeNotifier{
  int _counter =0;  //variable privada, lausamos eoslo en el prv¿ovider

  int get counter  => _counter;

  void increment(){
    _counter++;
    notifyListeners(); //le avisa a los listeners que cambio un dato
  }

  void decrement(){
    _counter--;
    notifyListeners(); //le avisa a los listeners que cambio un dato
  }

  void reset(){
    _counter=0;
    notifyListeners(); //le avisa a los listeners que cambio un dato
  }

  void multiDos(){
    _counter=_counter*2;
    notifyListeners();
  }
  void multiTres(){
    _counter=_counter*3;
    notifyListeners();
  }
  void multiCinco(){
    _counter=_counter*5;
    notifyListeners();
  }

 bool esPrimo(int numero) {
  if (numero <= 1) {
    return false; // Los números menores o iguales a 1 no son primos
  }
  if (numero <= 3) {
    return true; // 2 y 3 son primos
  }
  if (numero % 2 == 0 || numero % 3 == 0) {
    return false; // Los múltiplos de 2 o 3 no son primos
  }
  int i = 5;
  while (i * i <= numero) {
    if (numero % i == 0) {
      return false; // Si es divisible por algún número entre i, no es primo
    }
    i += 6; // Optimización: solo verificar números en la forma 6k ± 1
  }
  return true; // Si no se encontró ningún divisor, es primo
}



}