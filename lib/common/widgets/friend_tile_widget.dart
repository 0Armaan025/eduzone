import 'package:eduzone_clone/auth/screens/session/make_session_screen.dart';
import 'package:eduzone_clone/auth/screens/session/session_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class FriendTileWidget extends StatefulWidget {
  final String name;
  final String email;
  final String uid;
  final String time;
  const FriendTileWidget(
      {super.key,
      required this.name,
      required this.email,
      required this.uid,
      required this.time});

  @override
  State<FriendTileWidget> createState() => _FriendTileWidgetState();
}

class _FriendTileWidgetState extends State<FriendTileWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.time);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Colors.lightBlueAccent,
              Colors.blue,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Armaan',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                Text(
                  'armaan33000@gmail.com',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  showSnackBar(context,
                      "For beta version, you can only add 2 buddies for session!");
                  firestore
                      .collection('sessions')
                      .doc("${uid}+${widget.uid}")
                      .set({
                    "participants": [
                      uid,
                      widget.uid,
                    ],
                  });
                  firestore
                      .collection('sessions')
                      .doc("${uid}+${widget.uid}")
                      .collection(uid)
                      .doc(uid)
                      .set({"givenUp": "no"});
                  firestore
                      .collection('sessions')
                      .doc("${uid}+${widget.uid}")
                      .collection(widget.uid)
                      .doc(widget.uid)
                      .set({"givenUp": "no"});
                  moveScreen(
                      context,
                      true,
                      SessionStartedScreen(
                        time: widget.time,
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
