import 'package:flutter/material.dart';
import 'package:musicos_universal/modelos/usuario.dart';

class ProviderUsuario extends ChangeNotifier {
  late Usuario _usuario;
  Usuario get usuario => _usuario;

  void iniciarUsuario(Usuario usuario){
    _usuario = usuario;
  }

  void actualizarProgreso(int puntos){
    _usuario.puntos + puntos;

    notifyListeners();
  }
}
