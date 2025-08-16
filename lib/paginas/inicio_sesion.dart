import 'package:flutter/material.dart';
import 'package:musicos_universal/constantes/colores_login.dart';
import 'package:animate_do/animate_do.dart';
import 'package:musicos_universal/modelos/usuario.dart';
import 'package:musicos_universal/providers/provider_usuario.dart';
import 'package:musicos_universal/servicios/autenticacion_google.dart';
import 'package:provider/provider.dart';

class InicioSesion extends StatefulWidget {
  const InicioSesion({super.key});

  @override
  _InicioSesion createState() => _InicioSesion();
  
}

class _InicioSesion extends State<InicioSesion> {
  
  late final AuthService _autenticacion;

  @override
  void initState() {
    super.initState();

    _autenticacion = AuthService();
  }

  @override
  Widget build(BuildContext context) {
    //Iniciar el usuario de prueba
    context.watch<ProviderUsuario>().iniciarUsuario(Usuario(nombre: 'Samuel', apellidos: 'Villanueva', edad: 22, sexo: 'Masculino'));

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors:
                  [
                    ClaroLoginColores.inicioSesionFondo1,
                    ClaroLoginColores.inicioSesionFondo2,
                  ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //1 - Espacio inicial
            const SizedBox(height: 50),

            //2 - Texto 'Inicio de sesión' titulo
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //1
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      'Inicio de sesión',
                      style: TextStyle(
                        color:ClaroLoginColores.letraPrimaria,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //2
                  const SizedBox(height: 10),

                  //3 - Texto 'Bienvenido' sub titulo
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: Text(
                      'Bienvenido',
                      style: TextStyle(
                        color: ClaroLoginColores.letraPrimaria,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //3 - Espacio entre 'Bienvenido' y Tarjeta
            const SizedBox(height: 50),

            //4 - Contenedor 'tarjeta'
            Expanded(
              child: FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Container(
                  decoration: BoxDecoration(
                    color: ClaroLoginColores.tarjeta,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    children: [
                      //1 - Separación superior para las credenciales
                      const SizedBox(height: 20),
                      //2 - Contenedor de las credenciales
                      Stack(
                        clipBehavior:
                            Clip.none, // Permite que el contenedor sobresalga
                        children: [
                          Container(
                            //Margen para la separación de los costados
                            margin: const EdgeInsets.symmetric(horizontal: 20),

                            //Decoración (Efecto flotante, color y sombra)
                            decoration: BoxDecoration(
                              color: ClaroLoginColores.tarjeta,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: ClaroLoginColores.letraSecundaria,
                                  blurRadius: 20,
                                  offset: const Offset(1, 10),
                                ),
                              ],
                            ),

                            //Campos de texto
                            child: Column(
                              children: [
                                //Correo del usuario
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                      color: ClaroLoginColores.letraSecundaria,
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hint: Text(
                                        'Ingresa tu correo',
                                        style: TextStyle(
                                          color:
                                              ClaroLoginColores.letraSecundaria,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color:
                                            ClaroLoginColores.letraSecundaria,
                                      ),
                                      filled: false,
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),

                                //Contraseña
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  child: TextField(
                                    obscureText: true,
                                    style: TextStyle(
                                      color: ClaroLoginColores.letraSecundaria,
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hint: Text(
                                        'Ingresa tu contraseña',
                                        style: TextStyle(
                                          color:
                                              ClaroLoginColores.letraSecundaria,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color:
                                            ClaroLoginColores.letraSecundaria,
                                      ),
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            top: -70,
                            left: (MediaQuery.of(context).size.width / 2) - 50,
                            child: FadeInUp(
                              duration: const Duration(milliseconds: 1500),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: ClaroLoginColores.tarjeta,
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ), // Bordes redondeados
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),

                                child: Icon(
                                  Icons.music_note,
                                  size: 50,
                                  color: ClaroLoginColores.letraSecundaria,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //3 - Espacio
                      const SizedBox(height: 30),

                      //4 - Texto para recuperar contraseña
                      Text.rich(
                        TextSpan(
                          text: '¿Olvidaste tu contraseña?  ',
                          style: TextStyle(
                            color: ClaroLoginColores.letraSecundaria,
                            fontSize: 12,
                          ),

                          children: [
                            TextSpan(
                              text: 'Recuperar',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      //5 - Botón 'Iniciar sesión'
                      ElevatedButton(
                        onPressed: () async {
                          try{
                            final resultado = await _autenticacion.signInWithGoogle();
                          } catch(e){
                            print('Error de autenticación : $e');
                          }
                          Navigator.pushReplacementNamed(context, '/inicio');
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: ClaroLoginColores.inicioSesionFondo1,
                          backgroundColor: ClaroLoginColores.inicioSesionFondo2,
                          foregroundColor: ClaroLoginColores.letraPrimaria,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 20,
                          ),
                        ),
                        child: Text(
                          'Iniciar sesión',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),

                      //6 - Espacio
                      const SizedBox(height: 30),

                      //7 - Texto 'Incia con alguna red social'
                      Text(
                        'Inicia con alguna red social',
                        style: TextStyle(
                          color: ClaroLoginColores.letraSecundaria,
                          fontSize: 12,
                        ),
                      ),

                      //8 - Espacio
                      const SizedBox(height: 30),

                      //9 - Redes sociales
                      Row(
                        children: [
                          //Botón de google
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0,
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ClaroLoginColores.letraPrimaria,
                                  foregroundColor: ClaroLoginColores.letraSecundaria,
                                  shadowColor:
                                      ClaroLoginColores.letraSecundaria,
                                  padding: const EdgeInsets.all(15),
                                  shape: const CircleBorder(),
                                  minimumSize: const Size(65, 65),
                                ),
                                child: Image.asset(
                                  'assets/imagenes/google.png',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          //Botón de Facebook
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0,
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ClaroLoginColores.facebook,
                                  foregroundColor:
                                      ClaroLoginColores.letraPrimaria,
                                  shadowColor:
                                      ClaroLoginColores.inicioSesionFondo2,
                                  padding: const EdgeInsets.all(15),
                                  shape:
                                      const CircleBorder(), // Hace el botón circular
                                  minimumSize: const Size(65, 65),
                                ),
                                child: Image.asset(
                                  'assets/imagenes/facebook.png',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //Espacio
                      const SizedBox(height: 30),

                      //Texto - 'Registrar'
                      Text.rich(
                        TextSpan(
                          text: '¿Aún no te has registrado?   ',
                          style: TextStyle(
                            color: ClaroLoginColores.letraSecundaria,
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: 'Registrate',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
