import 'package:flutter/material.dart';
import 'package:musicos_universal/providers/provider_usuario.dart';
import 'package:provider/provider.dart';

class PaginaConfiguraciones extends StatefulWidget {
  const PaginaConfiguraciones({Key? key}) : super(key: key);

  @override
  _PaginaConfiguraciones createState() => _PaginaConfiguraciones();
}

class _PaginaConfiguraciones extends State<PaginaConfiguraciones> {
  //Valores de los Switch de notificaciones y Tema
  bool _notificaciones = false;
  bool _temaOscuto = false;

  //Valores de los ListTile (Expandidos o no)

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      //Contenido del contenedor principal
      child: Column(
        children: [
          //Tarjeta superior de color azul
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(1, 3),
                  ),
                ],
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: //Texto de saludo
              Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Hola, ${context.watch<ProviderUsuario>().usuario.nombre}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Padding
          SizedBox(height: 50),

          //stack (Sobreposicionar la imagen del usuario y la barra circular del progreso)
          Stack(
            children: [
              //Primer elemento del stack (Barra de progreso)
              SizedBox(
                height: 150,
                width: 150,
                child: CircularProgressIndicator(
                  value: 2.0,
                  strokeWidth: 5,
                  color: Colors.blueAccent,
                ),
              ),

              //Borde de la imagen del usuario
              Positioned(
                left: 20,
                top: 20,
                child: //Foto del usuario
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.03),
                  radius: 55,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://lh3.googleusercontent.com/a/ACg8ocKIVTLFqDedbNkgen3D3rra0YtOTvY1QQvRwiQ64xGrDeSgi0KL=s288-c-no',
                    ),
                  ),
                ),
              ),
            ],
          ),

          //Espaciado (Tipo Padding)
          SizedBox(height: 20),

          //Datos de progreso
          Text(
            '10 / 50',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          Text(
            'Lecciones',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w400,
            ),
          ),

          //Espaciado (Tipo Padding)
          SizedBox(height: 30),

          //Lista de configuraciones
          Expanded(
            child: Column(
              children: [
                //1. Lista de configuraciones del sistema

                //1.1 Notificaciones
                ExpansionTile(
                  leading: Icon(Icons.notifications_on_rounded),
                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  title: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Notificaciones'),
                  ),
                  onExpansionChanged: (value) {},
                  children: [
                    //Row
                    Row(
                      children: [
                        //
                        SizedBox(width: 20),
                        //Mensaje
                        Text(
                          '¿Deseas recibir notificaciones?',
                          style: TextStyle(
                            //color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        //
                        Spacer(),

                        //
                        Switch(
                          activeColor: Colors.blueAccent,
                          value: _notificaciones,
                          onChanged: (value) {
                            setState(() {
                              _notificaciones = value;
                            });
                          },
                        ),

                        //
                        SizedBox(width: 30),
                      ],
                    ),

                    SizedBox(height: 20),
                  ],
                ),

                //1.2 Tema
                ExpansionTile(
                  leading: Icon(Icons.dark_mode),
                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  title: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Tema'),
                  ),
                  children: [
                    Row(
                      children: [
                        Spacer(),

                        Icon(Icons.light_mode),

                        SizedBox(width: 40),

                        Switch(
                          activeColor: Colors.blueAccent,
                          value: _temaOscuto,
                          onChanged: (value) {
                            setState(() {
                              _temaOscuto = value!;
                            });
                          },
                        ),

                        SizedBox(width: 40),

                        Icon(Icons.dark_mode),

                        Spacer(),
                      ],
                    ),
                  ],
                ),

                //Linea divisora entre las opciones de la aplicación y del usuario
                Divider(),

                //2. Lista de configuraciones del usuario

                //2.1 Cuenta dle usuario
                ListTile(
                  leading: Icon(Icons.account_circle_rounded),
                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  title: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Cuenta'),
                  ),
                ),

                //2.2 Cerrar sesión
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Cerrar sesión'),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
