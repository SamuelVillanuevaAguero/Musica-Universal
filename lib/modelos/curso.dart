import 'package:musicos_universal/modelos/leccion.dart';

class Curso {
  int id;
  String nombre;
  String descripcion;
  List<Leccion> lecciones;
  String imagenUrl;
  double progreso;
  String nivel;

  Curso({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.lecciones,
    required this.imagenUrl,
    this.progreso = 0.0,
    required this.nivel
  });
}