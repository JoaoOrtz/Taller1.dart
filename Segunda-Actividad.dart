import 'dart:io';

// Variable global
List<Map<String, dynamic>> libros = [];

void main(){
  int opcion;
  do {
    print("Ingrese la opcion:\n 1. Agregar libro\n 2. Listar libro\n 3. Actualizar libro\n 4. Eliminar libro\n 5. Salir");
    opcion = int.parse(stdin.readLineSync()!);

    switch (opcion){
      case 1: 
          AgregarLibro();
        break;
      case 2: 
        ListarLibro();
        break;
      case 3: 
        ActualizarLibro();
        break;
      case 4: 
        ElimianarLibros();
        break;
      case > 5: 
        print("Opcion no encontrada $opcion");
        break;
    }
    
  } while (opcion != 5);
  print("Gracias y adios");
}

// Funcion para agregar libro
void AgregarLibro(){
  print("------------------Agregar libro------------------------");
    print("Agregar un libro, para salir ingrese (salir)");
    int i = 0;
    while (true){
      Map<String, dynamic> libro = {};

    stdout.write('${i+1}.Titulo del libro: ');
    String? titulo = stdin.readLineSync() ?? "";
    if (titulo.toLowerCase() == "salir") break;
    libro["Titulolibro"] = titulo;


    stdout.write('Autor: ');
    String? autor = stdin.readLineSync() ?? "Desconocido";
    if(autor.toLowerCase() == "salir") break;
    libro["Autor"] = autor;

    stdout.write('Año de publicacion: ');
    String? anoPublicacion  = stdin.readLineSync();
    if(anoPublicacion == "salir") break;
    libro["AnoPublicacion"] = anoPublicacion;
    libros.add(libro);

    i++;
    }
  print("------------------------------------------------------");

}

// Funcion para listar libros
void ListarLibro(){
  print("------------------Listar libro------------------------");
  if (libros.isEmpty) {
    print("No hay datos");
  }
  for (var i = 0; i < libros.length; i++) {
    print("\n Libro: ${i+1}");
    print("Título: ${libros[i]['Titulolibro']}");
    print("Autor: ${libros[i]['Autor']}");
    print("Año: ${libros[i]['AnoPublicacion']}");
  }
  print("------------------------------------------------------");
}

// Funcion para actulizar libro
void ActualizarLibro(){
  print("------------------Actualizar libro--------------------");
  ListarLibro();

  stdout.write("Ingrese el número del libro que desea actualizar: ");
  int indice = int.parse(stdin.readLineSync()!) - 1;

  stdout.write("Nuevo titulo (actual: ${libros[indice]['Titulolibro']}): ");
  String? nuevoTitulo = stdin.readLineSync();
  if (nuevoTitulo != null && nuevoTitulo.isNotEmpty) {
      libros[indice]['Titulolibro'] = nuevoTitulo;
    }

  stdout.write("Nuevo autor (actual: ${libros[indice]['Autor']}): ");
  String? nuevoAutor = stdin.readLineSync();
  if (nuevoAutor != null && nuevoAutor.isNotEmpty){
    libros[indice]["Autor"] = nuevoAutor;
  }

  stdout.write("Nueva año de publicacion (actual: ${libros[indice]['AnoPublicacion']}): ");
  String? nuevoAnoPublicacion = stdin.readLineSync();
  if (nuevoAnoPublicacion != null && nuevoAnoPublicacion.isNotEmpty) {
    libros[indice]["AnoPublicacion"] = nuevoAnoPublicacion;
  }

  print("\nEl libro actualizado");
  print("Libro: ${indice+1}");
  print("Título: ${libros[indice]['Titulolibro']}");
  print("Autor: ${libros[indice]['Autor']}");
  print("Año: ${libros[indice]['AnoPublicacion']}");


  
  print("------------------------------------------------------");

}


// Funcion para eliminar libro
void ElimianarLibros(){
  print("\n------------------ Eliminar libro -----------------------");
  ListarLibro();

  stdout.write("Ingrese el número del libro que desea actualizar: ");
  int indice = int.parse(stdin.readLineSync()!) - 1;

  libros.removeAt(indice);
  print("Libro eliminado exitosamente!");

  ListarLibro();
  print("-----------------------------------------------------------");
}