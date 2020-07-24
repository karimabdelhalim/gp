import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp1/provider/user_data.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userGromfireBaseUser(FirebaseUser user) {
    return user != null ? User(userId: user) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userGromfireBaseUser(user))
        .map(_userGromfireBaseUser);
  }

  Future registeration(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      return _userGromfireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future loginform(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userGromfireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInanom() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;

      return _userGromfireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
