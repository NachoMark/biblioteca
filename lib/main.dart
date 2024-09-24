import 'package:flutter/services.dart';

import './data/adaptador_memoria.dart';
import 'entidades/libro.dart';
import 'package:flutter/material.dart';
// import "casos_de_uso/adminitracion_biblioteca.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final repositorio = AdaptadorBibliotecaMemoria();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(repositorio: repositorio),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final AdaptadorBibliotecaMemoria repositorio;

  HomeScreen({required this.repositorio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: Text('TP N2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => mostrarTodosLosLibros(context, repositorio),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[100]
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children:[
                  Icon(Icons.book),
                  SizedBox(width: 8),
                  Text('Mostrar todos los libros'),
                ]
              )
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => agregarLibro(context, repositorio),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[100]
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children:[
                  Icon(Icons.book),
                  SizedBox(width: 8),
                  Text('Agregar un libro'),
                ]
              )
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => mostrarTodosLosUsuarios(context, repositorio),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[100]
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children:[
                  Icon(Icons.book),
                  SizedBox(width: 8),
                  Text('Mostrar todos los usuarios'),
                ]
              )
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => agregarUsuario(context, repositorio),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[100]
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children:[
                  Icon(Icons.book),
                  SizedBox(width: 8),
                  Text('Agregar un usuario'),
                ]
              )
            ),
            const SizedBox(height: 12),
            // ElevatedButton(
            //   onPressed: () => registrarRetiroLibro(context, repositorio),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.amber[100]
            //   ),
            //   child: const Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children:[
            //       Icon(Icons.book),
            //       SizedBox(width: 8),
            //       Text('Mostrar libros no devueltos'),
            //     ]
            //   )
            // ),
            ElevatedButton(
              onPressed: () => mostrarLibrosNoDevueltos(context, repositorio),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[100]
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children:[
                  Icon(Icons.book),
                  SizedBox(width: 8),
                  Text('Mostrar libros no devueltos'),
                ]
              )
            ),
          ],
        ),
      ),
    );
  }

  void mostrarTodosLosLibros(
      BuildContext context, AdaptadorBibliotecaMemoria repositorio) {
    final libros = repositorio.todosLosLibros();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Todos los libros'),
        content: libros.isEmpty
            ? Text('No hay libros registrados.')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: libros
                    .map((libro) =>
                        Text('ID: ${libro.id}, Nombre: ${libro.nombre}'))
                    .toList(),
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void agregarLibro(
      BuildContext context, AdaptadorBibliotecaMemoria repositorio) {
    final idController = TextEditingController();
    final nombreController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Agregar un libro'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'ID del libro'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre del libro'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final id = int.parse(idController.text);
              final nombre = nombreController.text;
              final libro = Libro(id, nombre);
              repositorio.agregarLibro(libro);
              Navigator.pop(context);
            },
            child: const Text('Agregar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  void mostrarTodosLosUsuarios(
      BuildContext context, AdaptadorBibliotecaMemoria repositorio) {
    final usuarios = repositorio.todosLosUsuarios();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Todos los usuarios'),
        content: usuarios.isEmpty
            ? const Text('No hay usuarios registrados.')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: usuarios
                    .map((usuario) => Text(
                        'DNI: ${usuario.dni}, Nombre: ${usuario.nombre} ${usuario.apellido}'))
                    .toList(),
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void agregarUsuario(
      BuildContext context, AdaptadorBibliotecaMemoria repositorio) {
    final dniController = TextEditingController();
    final nombreController = TextEditingController();
    final apellidoController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Agregar un usuario'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: dniController,
              decoration: const InputDecoration(labelText: 'DNI del usuario'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nombreController,
              decoration:
                  const InputDecoration(labelText: 'Nombre del usuario'),
            ),
            TextField(
              controller: apellidoController,
              decoration:
                  const InputDecoration(labelText: 'Apellido del usuario'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final dni = int.parse(dniController.text);
              final nombre = nombreController.text;
              final apellido = apellidoController.text;
              final usuario = Usuario(
                dni: dni,
                nombre: nombre,
                apellido: apellido,
                telefono: 0,
                email: '',
              );
              repositorio.agregarUsuario(usuario);
              Navigator.pop(context);
            },
            child: const Text('Agregar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }


//   void registrarRetiroLibro(
//       BuildContext context, AdaptadorBibliotecaMemoria repositorio, Usuario usuario, Libro libro) {
//     final fecha = DateTime.now();
//     final idController = TextEditingController();
//     final dniController = TextEditingController();
//     final retiro = MovimientoDeBiblioteca(
//       usuario: usuario,
//       libro: libro,
//       fecha: fecha,
//       esDevolucion: false
//     );
//     repositorio.agregarMovimiento(retiro);
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Registrar retiro de libro'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: idController,
//               decoration: const InputDecoration(labelText: 'ID del libro'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: dniController,
//               decoration: const InputDecoration(labelText: 'DNI del usuario'),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               final id = int.parse(idController.text);
//               final dni = int.parse(dniController.text);
//               repositorio.agregarMovimiento(retiro);
//               Navigator.pop(context);
//             },
//             child: const Text('Agregar'),
//           ),
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancelar'),
//           ),
//         ],
//       ),
//     );
//   }
// }



  void mostrarLibrosNoDevueltos(
      BuildContext context, AdaptadorBibliotecaMemoria repositorio) {
    final librosNoDevueltos = repositorio.todosLosLibrosNoDevueltos();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Libros no devueltos'),
        content: librosNoDevueltos.isEmpty
            ? const Text('No hay libros sin devolver.')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: librosNoDevueltos
                    .map((libro) =>
                        Text('ID: ${libro.id}, Nombre: ${libro.nombre}'))
                    .toList(),
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

}