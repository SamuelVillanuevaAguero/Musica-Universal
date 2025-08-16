// Importaciones necesarias
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // ========================================
  // MÉTODO PRINCIPAL: INICIAR SESIÓN CON GOOGLE
  // ========================================
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // 1. Iniciar flujo de Google Sign-In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
      // Si el usuario cancela
      if (googleUser == null) return null;

      // 2. Obtener credenciales de Google
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // 3. Crear credencial para Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 4. Autenticar en Firebase
      return await _auth.signInWithCredential(credential);
      
    } catch (e) {
      print('Error en Google Sign-In: $e');
      rethrow;
    }
  }

  // ========================================
  // MÉTODO: CERRAR SESIÓN
  // ========================================
  Future<void> signOut() async {
    try {
      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (e) {
      print('Error al cerrar sesión: $e');
      rethrow;
    }
  }

  // ========================================
  // MÉTODOS AUXILIARES
  // ========================================
  
  // Usuario actual
  User? get currentUser => _auth.currentUser;
  
  // Stream del estado de autenticación
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  
  // Verificar si está logueado
  bool get isLoggedIn => currentUser != null;
}