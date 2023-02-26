import 'package:eduzone_clone/auth/models/user.dart';
import 'package:eduzone_clone/auth/screens/home_screen.dart';
import 'package:eduzone_clone/common/constants/constants.dart';

import 'package:flutter/material.dart';

class AuthController {
  //sign up details and stuff

  void signUp(User userModel, BuildContext context) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      )
          .then((value) {
        uid = firebaseAuth.currentUser?.uid ?? '';

        User newUserModel = User(
            invited: "no",
            email: userModel.email,
            name: userModel.name,
            noOfFriends: userModel.noOfFriends,
            password: userModel.password,
            phoneNumber: userModel.phoneNumber,
            totalHoursStudied: userModel.totalHoursStudied,
            uid: uid);

        firestore
            .collection('users')
            .doc(uid)
            .set(newUserModel.toMap())
            .then((value) {
          uid = firebaseAuth.currentUser!.uid;
          showSnackBar(context, 'You are signed up!');
          moveScreen(context, true, HomeScreen());
        });
      });
    } catch (e) {
      print(e);
      showSnackBar(context, "An error occured. Please try again..." + "$e");
    }
  }

  void login(BuildContext context, String email, String pass) {
    try {
      firebaseAuth
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        uid = firebaseAuth.currentUser!.uid;
        showSnackBar(context, 'done');
        moveScreen(context, true, HomeScreen());
      });
    } catch (e) {
      showSnackBar(context, 'an error occurred while doing this! $e');
    }
  }
}
