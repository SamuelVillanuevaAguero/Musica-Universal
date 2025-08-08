import 'package:flutter/material.dart';
import 'package:musicos_universal/constantes/colores_base.dart';
import 'package:musicos_universal/paginas/pagina_configuraciones.dart';
import 'package:musicos_universal/paginas/pagina_cursos.dart';
import 'package:musicos_universal/paginas/pagina_inicio.dart';

class PaginaBase extends StatefulWidget {
  @override
  _PaginaBase createState() => _PaginaBase();
}

class _PaginaBase extends State<PaginaBase> {
  final PageController _controladorPaginas = PageController();

  int _indexActual = 0;

  final List<Widget> _paginas = [
    PaginaInicio(key: PageStorageKey('PaginaInicio')),
    PaginaCursos(key: PageStorageKey('PaginaCursos')),
    PaginaConfiguraciones(key: PageStorageKey('PaginaConfiguraciones')),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //Páginas
      body: PageView(
        controller: _controladorPaginas,
        children: _paginas,
        onPageChanged: (index) {
          setState(() {
            _indexActual = index;
          });
        },
      ),

      //Navegación bajaja
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColoresBase.navegacionBaja,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: ColoresBase.itemNoSeleccionado,
        currentIndex: _indexActual,
        onTap: (index) {
          setState(() {
            _indexActual = index;
            _controladorPaginas.animateToPage(
              _indexActual,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Cursos'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuraciones',
          ),
        ],
      ),
    );
  }
}
