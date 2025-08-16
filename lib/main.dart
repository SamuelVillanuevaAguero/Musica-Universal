import 'package:flutter/material.dart';
import 'package:musicos_universal/modelos/usuario.dart';
import 'package:musicos_universal/paginas/inicio_sesion.dart';
import 'package:musicos_universal/paginas/pagina_base.dart';
import 'package:musicos_universal/providers/provider_usuario.dart';
import 'package:provider/provider.dart';

//FireBase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final Usuario usuario = Usuario(
  nombre: 'Samuel',
  apellidos: 'Villanueva Aguero',
  edad: 22,
  sexo: 'Masculino',
);

class Aplicaion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderUsuario()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login': (context) => InicioSesion(),
          '/inicio': (context) => PaginaBase(),
        },
        title: 'Musicos Universal',
      ),
    );
  }
}

void main() async {
  //FireBase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //Inyectamos el usuario
  runApp(Aplicaion());
}
