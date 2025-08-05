import 'dart:io';
import 'dart:math';

void main(){
    print("Ingrese la opcion:\n 1. Calculo de distancia\n 2. Promedio de notas\n 3. Puntos de partidos\n 4. Planilla de una empresa\n 5. Calculo de la hipotenusa\n 6. De celsius a fahrenheit");
    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion){
      case 1:
        Actividad1();
        break;

      case 2:
        Actividad2();
        break;

      case 3:
        Actividad3();
        break;

      case 4:
        Actividad4();
        break;

      case 5:
        Actividad5();
        break;

      case 6:
        Actividad6();
        break;

      default:
        print("Opción inválida");
    }
}

void Actividad1(){
    print("Ingrese la velocidad:");
    double v = double.parse(stdin.readLineSync()!);
    print("Ingrese el tiempo:");
    double t = double.parse(stdin.readLineSync()!);

    double d = v*t;
    print("\n--- Resultados ---");
    print("La distancia que recorrio es: $d");
    print("------------------------------------------");
    main();
}

void Actividad2(){
  print("Ingrese la primera nota: ");
  double nota1 = double.parse(stdin.readLineSync()!);

  print("Ingrese la segunda nota: ");
  double nota2 = double.parse(stdin.readLineSync()!);

  print("Ingrese la tercera nota: ");
  double nota3 = double.parse(stdin.readLineSync()!);

  double promedio = nota1 + nota2 + nota3 / 3;
  print("\n--- Resultados ---");
  print("El promedio es: $promedio");
  print("------------------------------------------");
  main();
}

void Actividad3(){
  print("Ingrese los partidos ganados: ");
  int ganado = int.parse(stdin.readLineSync()!);

  print("Ingrese los partidos empatados: ");
  int empatado = int.parse(stdin.readLineSync()!);

  print("Ingrese los partidos perdidos: ");
  int perdido = int.parse(stdin.readLineSync()!);


  int puntosGanados = ganado * 3;
  int puntosEmpatados = empatado * 1;
  int puntosPerdidos = perdido * 0;
  int puntosTotal = puntosGanados + puntosEmpatados + puntosPerdidos;
  int patidosJugados = ganado + empatado + perdido;

  print("\n--- Resultados ---");
  print("Partidos ganados: $ganado");
  print("Partidos empatados: $empatado");
  print("Partidos perdidos: $perdido");
  print("Puntos totales: $puntosTotal");
  print("Partidos jugados: $patidosJugados");
  print("------------------------------------------");
  main();
}

void Actividad4(){
  print("Ingrese el nombre del empleado:");
  String? nombreEmpleado = stdin.readLineSync();

  print("Ingrese la cantidad de horas trabajadas en el mes:");
  int cantidadHoras = int.parse(stdin.readLineSync()!);

  print("Ingrese la tarifa por hora:");
  double tarifaHora = double.parse(stdin.readLineSync()!);

  double totalDevengado = cantidadHoras * tarifaHora;

  print("\n--- Resultados ---");
  print("Nombre del empleado: $nombreEmpleado");
  print("Cantidad de horas laboradas: $cantidadHoras");
  print("Total devengado: $totalDevengado");
  print("------------------------------------------");
  main();
}

void Actividad5(){
  print("Ingrese el cateto opuesto:");
  double a = double.parse(stdin.readLineSync()!);

  print("Ingrese el cateto adyacente:");
  double b = double.parse(stdin.readLineSync()!);

  double h = sqrt(pow(a, 2)+pow(b, 2));

  print("\n--- Resultados ---");
  print("El cateto opuesto es: $a");
  print("El cateto adyacente es: $b");
  print("La hipotenusa es: ${h.toStringAsFixed(2)}");
  print("------------------------------------------");
  main();

}

void Actividad6(){
  print("Ingrese los grados celsius:");
  double celsius = double.parse(stdin.readLineSync()!);

  double fahrenheit = (celsius*1.8)+32;
  print("\n--- Resultados ---");
  print("Fahrenheit: ${fahrenheit.toStringAsFixed(2)}");
  print("------------------------------------------");
  main();
}