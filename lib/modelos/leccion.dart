import 'package:flutter/material.dart';

class Leccion {
  int id;
  String nombre;
  String descripcion;
  List<Leccion>? requisitos;
  double progreso;

  //Contenido
  ContenidoTexto contenidoTexto;
  ContenidoVideo? contenidoVideo;
  ContenidPreguntas? contenidPreguntas;

  Leccion({
    required this.id,
    required this.nombre,
    required this.descripcion,
    this.requisitos,
    required this.progreso,
    required this.contenidoTexto,
    this.contenidoVideo,
    this.contenidPreguntas
  });
}

class ContenidoTexto {
  String titulo;
  String subtitulo;
  String informacion;

  ContenidoTexto({
    required this.titulo,
    required this.subtitulo,
    required this.informacion
  });
}

class ContenidoVideo {
  String url;
  String titulo;
  String descripcion;

  ContenidoVideo({
    required this.url,
    required this.titulo,
    required this.descripcion
  });

}

class ContenidPreguntas {
  List<Pregunta> preguntas;
  double? calificacion;

  ContenidPreguntas({
    required this.preguntas,
    this.calificacion = 0.0
  });
}

class Pregunta {
  String pregunta;
  List<String> opciones;
  int respuesta;
  double puntos;

  Pregunta({
    required this.pregunta,
    required this.opciones,
    required this.respuesta,
    required this.puntos
  });
}