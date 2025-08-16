import 'package:flutter/material.dart';
import 'package:musicos_universal/constantes/datos_prueba.dart';
import 'package:musicos_universal/modelos/curso.dart';
import 'package:musicos_universal/widgets/curso_widget.dart';
import 'package:animate_do/animate_do.dart';

class PaginaCursos extends StatefulWidget {
  const PaginaCursos({Key? key}) : super(key: key);

  @override
  _PaginaCursos createState() => _PaginaCursos();
}

class _PaginaCursos extends State<PaginaCursos> {
  late final TextEditingController _controladorBusqueda;
  late List<Curso> _cursos;

  @override
  void initState() {
    super.initState();

    //Inicializar el controlador de búsqueda de cursos
    _controladorBusqueda = TextEditingController();

    //Inicializar los cursos del usuario
    _cursos = Pruebas.listaCursos();
  }

  @override
  void dispose() {
    super.dispose();

    //Destruir el controlador del búscador cuando se destruya el Widget
    _controladorBusqueda.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          //Widget de Animación para la tarjeta azul
          FadeInDown(
            //Duración de la animación de la tarjeta azul
            duration: const Duration(milliseconds: 1200),
            
            //Contenedor de búsqueda (color azul)
            child: SizedBox(
              height: 230,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  color: Colors.blueAccent,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(1, 3),
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      //Espaciado (Tipo Padding)
                      const SizedBox(height: 50),

                      //Texto de 'Encuentra tu aprendizaje'
                      const Text(
                        'Encuentra tu aprendizaje!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),

                      //Texto de búsqueda
                      const Text(
                        '¿Estás búscando algo especifio?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),

                      //Espacio (Tipo padding)
                      const SizedBox(height: 30),

                      //Campo de texto
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _cursos = Pruebas.listaCursos()
                            .where((c) => c.nombre.toLowerCase().contains(_controladorBusqueda.text.toLowerCase())).toList();
                          });
                        },
                        controller: _controladorBusqueda,
                        decoration: InputDecoration(
                          hintText: 'Busca un curso o lección',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //Espaciado (tipo Padding) entre la tarjeta azul y la lista de cursos
          const SizedBox(height: 30),
          
          //Cursos y lecciones búscadas
          Expanded(
            child: ListView.builder(
              itemCount: _cursos.length,
              itemBuilder: (context, index) {
                return CursoWidget(curso: _cursos[index], onTap: () {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
