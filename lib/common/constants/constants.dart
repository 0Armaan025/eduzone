import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

const String appName = "EduZone";
const String appTagLine = "Let's study!";
String uid = "";
String name = "";
String email = "";
const String usersCollection = "users";

final backgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      HexColor("#82aaff"),
      HexColor("#1760fc"),
    ],
  ),
);

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

AppBar myAppBar() {
  return AppBar(
    title: Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/eduzone_logo.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          "EduZone",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

moveScreen(BuildContext context, bool isPushReplacement, Widget toScreen) {
  if (isPushReplacement) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => toScreen));
  } else {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => toScreen));
  }
}

//firebase stuff

final firestore = FirebaseFirestore.instance;
final firebaseAuth = FirebaseAuth.instance;
final firebaseStorage = FirebaseStorage.instance;
