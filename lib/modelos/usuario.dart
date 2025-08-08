class Usuario {
  String nombre;
  String? apellidos;
  int edad;
  String sexo;
  String? fotoUrl;

  Usuario({
    required this.nombre,
    this.apellidos,
    required this.edad,
    required this.sexo,
    this.fotoUrl
  });
}