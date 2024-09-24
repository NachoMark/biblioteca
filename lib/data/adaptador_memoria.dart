
import '../../entidades/libro.dart';
import '../../repositorios/repositorio_biblioteca.dart';


class AdaptadorBibliotecaMemoria implements RepositorioBiblioteca {
  final List<Libro> _libros = [];
  final List<Usuario> _usuarios = [];
  final List<MovimientoDeBiblioteca> _movimientos = [];

  @override
  void agregarLibro(Libro nuevoLibro) {
    _libros.add(nuevoLibro);
  }

  @override
  void agregarUsuario(Usuario nuevoUsuario) {
    _usuarios.add(nuevoUsuario);
  }

  @override
  List<Libro> todosLosLibros() {
    return _libros;
  }

  @override
  List<Usuario> todosLosUsuarios() {
    return _usuarios;
  }

  @override
  void agregarMovimiento(MovimientoDeBiblioteca nuevoMovimiento) {
    _movimientos.add(nuevoMovimiento);
  }

  @override
  List<Libro> todosLosLibrosNoDevueltos() {
    var librosNoDevueltos = <Libro>[];
    for (var movimiento in _movimientos) {
      if (!movimiento.esDevolucion) {
        librosNoDevueltos.add(movimiento.libro);
      }
    }
    return librosNoDevueltos;
  }
}