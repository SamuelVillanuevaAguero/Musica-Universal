import 'package:flutter/material.dart';

class PaginaConfiguraciones extends StatefulWidget {
  const PaginaConfiguraciones({Key? key}) : super(key: key);

  @override
  _PaginaConfiguraciones createState() => _PaginaConfiguraciones();
}

class _PaginaConfiguraciones extends State<PaginaConfiguraciones> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      //Contenido del contenedor principal
      child: Column(
        children: [
          SizedBox(
            height: 100,
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
              Text(
                'Hola, Samuel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          //Padding
          SizedBox(height: 50),

          //STACK
          Stack(
            children: [
              //Primer elemento del stack
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

          SizedBox(height: 20),

          //Datos de progreso
          Text(
            '10 / 50',
            style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 18),
          ),

          Text(
            'Lecciones',
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w400),
          ),

          //
          SizedBox(height: 30),

          //Lista de opciones de la aplicación
          Expanded(
            child: ListView(
              children: [
                //Lista de configuraciones del sistema

                //1. Notificaciones
                ListTile(
                  leading: Icon(Icons.notifications_on_rounded),
                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  title: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Notificaciones'),
                  ),
                ),

                //2. Tema
                ListTile(
                  leading: Icon(Icons.dark_mode),
                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  title: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Tema'),
                  ),
                ),

                Divider(),

                //Lista de configuraciones del usuario

                //Cuenta dle usuario
                ListTile(
                  leading: Icon(Icons.account_circle_rounded),
                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  title: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Cuenta'),
                  ),
                ),

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
