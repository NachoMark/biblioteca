import '../entidades/libro.dart';


abstract class RepositorioBiblioteca {
  void agregarLibro(Libro nuevoLibro);
  void agregarUsuario(Usuario nuevoUsuario);
  List<Libro> todosLosLibros();
  List<Usuario> todosLosUsuarios();
  void agregarMovimiento(MovimientoDeBiblioteca nuevoMovimiento);
  List<Libro> todosLosLibrosNoDevueltos();
}