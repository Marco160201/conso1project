class Usuario {
  final String nombres;
  final String apellidos;
  final String correo;
  final String contrasena;
  final String repetirContrasena;
  final String numeroCelular;
  final DateTime fechaNacimiento;
  final String domicilio;

  Usuario({
    required this.nombres,
    required this.apellidos,
    required this.correo,
    required this.contrasena,
    required this.repetirContrasena,
    required this.numeroCelular,
    required this.fechaNacimiento,
    required this.domicilio,
  });
}