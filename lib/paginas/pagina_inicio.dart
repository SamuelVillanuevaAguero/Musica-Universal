import 'package:flutter/material.dart';
import 'package:musicos_universal/modelos/curso.dart';
import 'package:musicos_universal/providers/provider_usuario.dart';
import 'package:musicos_universal/widgets/curso_widget.dart';
import 'package:musicos_universal/constantes/datos_prueba.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({Key? key}) : super(key: key);

  @override
  _PaginaInicio createState() => _PaginaInicio();
}

class _PaginaInicio extends State<PaginaInicio> {
  //Variables de estado
  late List<Curso> _cursos;

  //Controlador del TextField
  late final TextEditingController _controladorTexto;

  //Método - Búscar curso
  void _buscarCurso(String valor) {
    setState(() {
      _cursos = Pruebas.listaCursosProgreso()
          .where((p) => p.nombre.toLowerCase().contains(valor.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();

    //Inicializar el controlador del búscador de cursos en progreso
    _controladorTexto = TextEditingController();

    //Inicializar los cursos de prueba
    _cursos = Pruebas.listaCursosProgreso();
  }

  @override
  void dispose() {
    super.dispose();

    //Destruir el controlador cuando el Widget se destruya
    _controladorTexto.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          //Tarjeta morada -
          FadeInDown(
            //Animación hacía abajo
            duration: Duration(
              milliseconds: 1300,
            ), //Duración de la animación - 1300 milisegundos
            child: SizedBox(
              height: (MediaQuery.of(context).size.height * 2) / 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent, //Color morado de la tarjeta
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      60,
                    ), //Borde redondeado de la parte izquierda baja
                    bottomRight: Radius.circular(
                      60,
                    ), //Borde redondeado de la parte derecha baja
                  ),
                ),

                //Elementos dentro de la tarjeta - Padding para todos
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: 30,
                    top: 20,
                  ), //Padding izquierdo y superior
                  child: Column(
                    //Elementos de la tarjeta - Buscador y textos
                    crossAxisAlignment: CrossAxisAlignment
                        .start, //Los elementos inician a la izquierda (Al inicio de la columna)
                    children: [
                      //Espacio superior (Tipo Padding)
                      SizedBox(height: 30),

                      //Texto - 'Hola, Usuario'
                      Text(
                        'Hola, ${context.watch<ProviderUsuario>().usuario.nombre}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),

                      //Texto tipo subtitulo - '¿Qué vamos a aprender hoy?'
                      Text(
                        '¿Qué vamos a aprender hoy?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                        ),
                      ),

                      //Espacio superior (Tipo Padding)
                      SizedBox(height: 30),

                      //Elementos - Buscador y botón de búscar
                      Row(
                        children: [
                          //Se utiliza un expanded para el TextField
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                _buscarCurso(value);
                              },
                              controller: _controladorTexto,
                              decoration: InputDecoration(
                                hintText: 'Busca un curso',
                                filled: true, //Relleno
                                fillColor: Colors.white, //Color del relleno
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none, //Sin borde
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ), //Borde circular
                                ),
                              ),
                            ),
                          ),

                          //Espacio superior (Tipo Padding)
                          SizedBox(width: 20),

                          //Espacio superior (Tipo Padding)
                          SizedBox(width: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //Se utiliza un expanded porqué la columna del contenedor se tiene que expandir (Por el elemento encimado del Stack)
          Expanded(
            child: Stack(
              clipBehavior: Clip
                  .none, //Sin limite del Stack (Permite el desbordamiento de la sobreposición)
              children: [
                //Contenedor de fondo
                Container(
                  color: Colors.white,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      //Elementos de la parte inferior
                      children: [
                        //Espaciado - 50 top
                        //Espacio superior (Tipo Padding)
                        SizedBox(height: 50, width: 1),

                        //Texto - 'Cursos en progreso'
                        /*Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Cursos en progreso',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),*/

                        //Espacio superior (Tipo Padding)
                        SizedBox(height: 20),

                        //Se necesita un Expanded porqué tenemos un ListView dentro de un Column
                        Expanded(
                          child: ListView.builder(
                            //Genera los widgets de la lista en base a los cursos
                            clipBehavior: Clip.none,
                            itemCount: _cursos.length,
                            itemBuilder: (context, index) {
                              return CursoWidget(
                                curso: _cursos[index],
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Widget para determinar la sobreposición de los elementos en el Stack
                Positioned(
                  //Elementos - 'Inicia de aprendizaje' | Botón iniciar | Imagen aprendiendo
                  bottom: (MediaQuery.of(context).size.height * 2 / 4.2),
                  left:
                      (MediaQuery.of(context).size.width / 2) -
                      ((MediaQuery.of(context).size.width - 50) / 2),
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width - 50,
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1200),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 20,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            //Sobreposición
                            Stack(
                              clipBehavior: Clip.none, //Sin borde (limite)
                              children: [
                                //Elementos - 'Inicia tu aprendizaje' | Botón iniciar
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, //Se colocan al inicio de la columna
                                  children: [
                                    //Padding para el texto 'Inicia tu aprendizaje'
                                    Padding(
                                      padding: EdgeInsetsGeometry.only(
                                        left: 20,
                                        top: 10,
                                      ),
                                      child: Text(
                                        'Inicia tu aprendizaje',
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            118,
                                            118,
                                            118,
                                          ),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),

                                    //Padding para el botón
                                    Padding(
                                      padding: EdgeInsetsGeometry.only(
                                        left: 20,
                                        top: 20,
                                      ),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueAccent,
                                          shape: ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  15,
                                                ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            Text(
                                              'Iniciar | ', //Texto del botón
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Icon(
                                              //Icono del botón
                                              Icons.favorite,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //Sobreposición de la imagen estudiando
                                Positioned(
                                  left: MediaQuery.of(context).size.width - 210,
                                  bottom: 0,
                                  child: Image.asset(
                                    'assets/imagenes/persona_aprende.png',
                                    height: 130,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
