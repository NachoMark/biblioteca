class Usuario {
  int dni;
  String nombre;
  String apellido;
  int telefono;
  String email;

  Usuario(
      {required this.dni,
      required this.nombre,
      required this.apellido,
      required this.telefono,
      required this.email});
}

class Libro {
  int id;
  String nombre;
  Libro(this.id, this.nombre);
}

class MovimientoDeBiblioteca {
  DateTime fecha;
  Usuario usuario;
  Libro libro;
  bool esDevolucion;

  MovimientoDeBiblioteca({
    required this.fecha,
    required this.usuario,
    required this.libro,
    required this.esDevolucion,
  });
}