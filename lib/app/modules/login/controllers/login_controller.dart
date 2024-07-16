import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ngontak/app/database/database.dart';
import 'package:ngontak/app/database/schema.dart' as ngontak;
import 'package:ngontak/app/routes/app_pages.dart';
import 'package:realm/realm.dart';

class LoginController extends GetxController {
  final RxBool isLoading = false.obs;
  final _database = Database();

  Future<void> login() async {
    try {
      isLoading.value = true;

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        _showErrorDialog('Login dibatalkan oleh pengguna.');
        isLoading.value = false;
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final resultLogin = await firebase_auth.FirebaseAuth.instance.signInWithCredential(credential);

      await _database.initialize();
      final realm = _database.realm;
      final checkUser = realm.find<ngontak.User>(resultLogin.user!.uid);

      if (checkUser != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        _addNewUserToRealm(realm, resultLogin.user!);
        final user = realm.find<ngontak.User>(resultLogin.user!.uid);
        if (user != null) {
          Get.offAllNamed(Routes.HOME);
        } else {
          _showErrorDialog('Gagal login!');
        }
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      _showErrorDialog('Kesalahan pada server!');
    }
  }

  void _addNewUserToRealm(Realm realm, firebase_auth.User user) {
    realm.write(() {
      realm.add(ngontak.User(
        user.uid,
        user.displayName ?? '',
        user.email ?? '',
        user.photoURL ?? '',
      ));
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: Get.overlayContext!,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}