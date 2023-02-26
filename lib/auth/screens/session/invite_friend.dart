import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduzone_clone/auth/screens/session/session_started_screen.dart';
import 'package:eduzone_clone/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/widgets/friend_tile_widget.dart';

class InviteFriendScreen extends StatefulWidget {
  final String time;
  const InviteFriendScreen({super.key, required this.time});

  @override
  State<InviteFriendScreen> createState() => _InviteFriendScreenState();
}

class _InviteFriendScreenState extends State<InviteFriendScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myAppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return FriendTileWidget(
                email: data['email'],
                uid: data['uid'],
                name: data['name'],
                time: widget.time,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
