import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Future<bool> checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('email');
  }

  Future<bool> signInWithEmailAndPassword(
      context, String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        saveAuthData(credential);
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  saveAuthData(credential, {username}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('email', credential.user!.uid);
    if (username != null) {
      prefs.setString('username', credential.user!.uid);
    }
  }

  Future<bool> createWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        saveAuthData(credential, username: username);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
