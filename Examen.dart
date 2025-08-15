import 'dart:io';

// Variable global
List<Map<String, dynamic>> productos = [];

void main() {
  int opcion = 0;
  
  do {
    print("\n--- MENÚ PRINCIPAL ---");
    print("1. Agregar libro");
    print("2. Listar libros");
    print("3. Actualizar libro");
    print("4. Eliminar libro");
    print("5. Salir");

    bool entradaValida = false;
    while (!entradaValida) {
      stdout.write("Ingrese una opción (1-5): ");
      String? input = stdin.readLineSync();
      
      try {
        if (input == null || input.isEmpty) {
          throw FormatException();
        }
        
        opcion = int.parse(input);
        entradaValida = true;
        
        if (opcion < 1 || opcion > 5) {
          print("Error: La opción $opcion no existe. Ingrese un número entre 1 y 5");
          entradaValida = false;
        }
      } on FormatException {
        print("Error: Debe ingresar solo números. Intente nuevamente.");
      }
    }
    
    switch (opcion) {
      case 1:
        AgregarProducto();
        break;
      case 2:
        ListarProducto();
        break;
      case 3:
        ActualizarProducto();
        break;
      case 4:
        ElimianarProducto();
        break;
      case 5:
        print("Saliendo del sistema...");
        break;
    }
    
  } while (opcion != 5);
  
  print("Gracias por usar el sistema. ¡Hasta pronto!");
}

void AgregarProducto(){
    print("------------------Agregar productos------------------------");
    print("Agregar un producto, para salir ingrese (salir)");
    int i = 0;
    while (true){
      Map<String, dynamic> producto = {};

    stdout.write('${i+1}. Nombre del producto: ');
    String? nombre = stdin.readLineSync() ?? "";
    if (nombre.toLowerCase() == "salir") break;
    producto["nombre"] = nombre;


    stdout.write('Precio del producto: ');
    double? precio = double.parse(stdin.readLineSync() ?? "0");
    if(precio == 0) break;
    producto["precio"] = precio;

    stdout.write('Cantidad disponible: ');
    int? cantidad  = int.parse(stdin.readLineSync() ?? "0");
    if(cantidad == 0) break;
    producto["cantidad"] = cantidad;

    productos.add(producto);

    i++;
    }
  print("------------------------------------------------------");
}

void ListarProducto(){
  print("------------------Listar libro------------------------");
  if (productos.isEmpty) {
    print("No hay datos");
  }
  for (var i = 0; i < productos.length; i++) {
    print("\n Producto: ${i+1}");
    print("Nombre del producto: ${productos[i]['nombre']}");
    print("Precio: ${productos[i]['precio']}\$");
    print("Cantidad: ${productos[i]['cantidad']}");
  }
  print("------------------------------------------------------");
}

void ActualizarProducto(){
  print("------------------Actualizar libro--------------------");
  ListarProducto();

  stdout.write("Ingrese el número del producto que desea actualizar: ");
  int indice = int.parse(stdin.readLineSync()!) - 1;

  stdout.write("Nuevo nombre del producto (actual: ${productos[indice]['nombre']}): ");
  String? nuevoNombre = stdin.readLineSync();
  if (nuevoNombre != null && nuevoNombre.isNotEmpty) {
      productos[indice]['nombre'] = nuevoNombre;
    }

  stdout.write("Nuevo precio (actual: ${productos[indice]['precio']}): ");
  String? nuevoPrecio = stdin.readLineSync();
  if (nuevoPrecio != null && nuevoPrecio.isNotEmpty){
    double.parse(nuevoPrecio);
    productos[indice]["precio"] = nuevoPrecio;
  }

  stdout.write("Nueva cantidad (actual: ${productos[indice]['cantidad']}): ");
  String? nuevoCantidad =  stdin.readLineSync();
  if (nuevoCantidad != null && nuevoCantidad.isNotEmpty) {
    int.parse(nuevoCantidad);
    productos[indice]["cantidad"] = nuevoCantidad;
  }

  print("\nEl libro actualizado");
  print("Producto: ${indice+1}");
  print("Nombre del producto: ${productos[indice]['nombre']}");
  print("Precio: ${productos[indice]['precio']}\$");
  print("Cantidad: ${productos[indice]['cantidad']}");

  print("------------------------------------------------------");

}

void ElimianarProducto(){
  print("\n------------------ Eliminar libro -----------------------");
  ListarProducto();

  stdout.write("Ingrese el número del producto que desea actualizar: ");
  int indice = int.parse(stdin.readLineSync()!) - 1;

  productos.removeAt(indice);
  print("Libro eliminado exitosamente!");

  ListarProducto();
  print("-----------------------------------------------------------");
}