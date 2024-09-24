
import '../entidades/libro.dart';
import '../repositorios/repositorio_biblioteca.dart';

class AdministracionDeBiblioteca {
  final RepositorioBiblioteca repositorio;

  AdministracionDeBiblioteca(this.repositorio);

  void registrarEntregaDeLibro(DateTime fecha, Libro libro, Usuario usuario) {
    var movimiento = MovimientoDeBiblioteca(
      fecha: fecha,
      usuario: usuario,
      libro: libro,
      esDevolucion: false,
    );
    repositorio.agregarMovimiento(movimiento);
  }

  void registrarDevolucionDeLibro(DateTime fecha, Libro libro, Usuario usuario) {
    var movimiento = MovimientoDeBiblioteca(
      fecha: fecha,
      usuario: usuario,
      libro: libro,
      esDevolucion: true,
    );
    repositorio.agregarMovimiento(movimiento);
  }
}