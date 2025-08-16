import 'package:musicos_universal/constantes/datos_prueba.dart';
import 'package:musicos_universal/modelos/curso.dart';

class Usuario {
  //Datos personales
  String nombre;
  String? apellidos;
  int edad;
  String sexo;

  //fotografia de la cuenta
  String? fotoUrl;

  //Progreso del usuario
  int puntos;

  Usuario({
    required this.nombre,
    this.apellidos,
    required this.edad,
    required this.sexo,
    this.fotoUrl,
    this.puntos = 0
  });
  
  double progreso(){
    return puntos / Pruebas.puntos_total * 100;
  }
}