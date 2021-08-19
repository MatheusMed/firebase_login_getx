import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> _firebaseUser = Rxn<User>();

  var userIsAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
    ever(_firebaseUser, (User? user) {
      if (user != null) {
        userIsAuthenticated.value = true;
      } else {
        userIsAuthenticated.value = false;
      }
    });
  }

  // geters para acessar a instancia
  User get user => _firebaseUser.value!;
  static AuthService get to => Get.find<AuthService>();

  showSnack(String titulo, String erro) {
    Get.snackbar(
      titulo,
      erro,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  //criando usuario no firebase SEMPRE ASYNC!!
  createUser(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
    } catch (e) {
      showSnack('Erro ao Cadastrar', e.toString());
    }
  }

  // Fazendo Login do usuario
  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
    } catch (e) {
      showSnack('Erro no Login', e.toString());
    }
  }

  // Sair da Pagina depois de ter feito LOGIN
  logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      showSnack('Erro ao Sair', e.toString());
    }
  }
}
