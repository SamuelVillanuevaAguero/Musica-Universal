import 'package:musicos_universal/modelos/curso.dart';
import 'package:musicos_universal/modelos/leccion.dart';

class Pruebas {

  static int puntos_total = 200;
  
  static List<Curso> listaCursos(){
    return [
      Curso(
        id: 1, 
        nombre: 'Fundamentos de música | Primeros pasos', 
        descripcion: 'En este curso aprenderás los fundamentos teoricos de la música, ¡incialo ya!', 
        lecciones: List.empty(), 
        imagenUrl: 'assets/imagenes/primeros_pasos.png', 
        nivel: 'Principiante',
        progreso: 90
      ),

       Curso(
        id: 2, 
        nombre: 'Fundamentos de música | Conociendo acordes', 
        descripcion: 'En este curso aprenderás los distintos tipos de acordes que existen, Vamos, ¡hay que conocerlos!', 
        lecciones: List.empty(), 
        imagenUrl: 'assets/imagenes/acordes.png', 
        nivel: 'Principiante',
        progreso: 80
      ),

      Curso(
        id: 3, 
        nombre: 'Fundamentos de música | Circulos y progresiones', 
        descripcion: 'En este curso aprenderás algunas progresiones que puedes aplicar a distintos cantos, ¡Pruebalos ya!', 
        lecciones: List.empty(), 
        imagenUrl: 'assets/imagenes/progresiones.png', 
        nivel: 'Intermedio',
        progreso: 60
      ),

      Curso(
        id: 4, 
        nombre: 'Práctica | Composición', 
        descripcion: 'En este curso aprenderás algunas progresiones que puedes aplicar a distintos cantos, ¡Pruebalos ya!', 
        lecciones: List.empty(), 
        imagenUrl: 'assets/imagenes/progresiones.png', 
        nivel: 'Avanzado',
        progreso: 0.0
      ),


    ];
  }

  static List<Curso> listaCursosProgreso(){
    return listaCursos().
    where((c) => c.progreso > 0)
    .toList();
  }

  static List<Leccion> _leccionesPrimerosPasos(){
    return [

    ];
  }
}