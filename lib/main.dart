import 'package:flutter/material.dart';
import 'package:musicos_universal/modelos/usuario.dart';
import 'package:musicos_universal/paginas/inicio_sesion.dart';
import 'package:musicos_universal/paginas/pagina_base.dart';


final Usuario usuario = Usuario(nombre: 'Samuel', apellidos: 'Villanueva Aguero', edad: 22, sexo: 'Masculino');


class Aplicaion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => InicioSesion(),
        '/inicio': (context) => PaginaBase()
      },
      title: 'Musicos Universal',
    );
  }
}


void main() async{
  //Inyectamos el usuario
  runApp(Aplicaion());
}