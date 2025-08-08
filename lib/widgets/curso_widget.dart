import 'package:flutter/material.dart';
import 'package:musicos_universal/modelos/curso.dart';
import 'package:animate_do/animate_do.dart';

Map<String, Color> _coloresFondo = {
  'Principiante':Colors.lightGreenAccent,
  'Intermedio':Colors.yellow,
  'Avanzado':const Color.fromARGB(255, 255, 206, 143)
};

Map<String, Color> _coloresLetras = {
  'Principiante':Colors.green,
  'Intermedio':Colors.orange,
  'Avanzado':Colors.red
};

class CursoWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Curso curso;

  const CursoWidget({
    required this.onTap,
    required this.curso
  });

  @override
  Widget build(BuildContext context) {
    var widget = GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(0.2),
                offset: Offset(1, 3),
              ),
            ],
          ),

          //
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(color: Colors.white),

                    Positioned(
                      bottom: 0,
                      right: -15,
                      child: Image.asset(
                        curso.imagenUrl,
                        height: 130,
                        width: 150,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 20),

              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Espacio
                  SizedBox(height: 10),

                  //Nivel - Letras
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _coloresFondo[curso.nivel],
                    ),
                    child: Text(
                      curso.nivel,
                      style: TextStyle(
                        color: _coloresLetras[curso.nivel],
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Text(
                    curso.nombre,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black.withOpacity(0.6,/*1*/)),
                    textAlign: TextAlign.left,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Container(
                    width: (MediaQuery.of(context).size.width - 200) * (curso.progreso / 100),
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 147, 255, 150),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  )
                ],
              ),)
            ],
          ),
        ),
      ),
    );

    return (curso.id % 2 == 0)? 
    FadeInLeft(duration: Duration(milliseconds: 1500), child: widget) : 
    FadeInRight(duration: Duration(milliseconds: 1500), child: widget);
  }
}
