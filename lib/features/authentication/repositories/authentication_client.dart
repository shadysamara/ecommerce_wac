import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  Auth._();
  static final Auth auth = Auth._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> createNewUserUsingEmailAndPassword(
      String email, String password) async {
    AuthResult authResut = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    FirebaseUser user = authResut.user;
    return user;
  }

  Future<FirebaseUser> loginUsingEmailAndPassword(
      String email, String password) async {
    AuthResult authResult = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = authResult.user;
    return user;
  }

  Future<FirebaseUser> loginUsingGmail() async {
    try {
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      String accessToken = googleSignInAuthentication.accessToken;
      String idToken = googleSignInAuthentication.idToken;
      AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: idToken, accessToken: accessToken);
      AuthResult authResult =
          await firebaseAuth.signInWithCredential(credential);
      return authResult.user;
    } catch (error) {
      print(error);
    }
  }

  logOut() {
    firebaseAuth.signOut();
  }

  Future<String> checkUser() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser == null) {
      return 'no user';
    } else {
      return firebaseUser.displayName;
    }
  }
}
