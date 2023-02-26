import 'dart:async';

import 'package:eduzone_clone/auth/screens/session/done_screen.dart';
import 'package:eduzone_clone/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/widgets/friend_status_widget.dart';
import '../home_screen.dart';

class SessionStartedScreen extends StatefulWidget {
  final String time;
  const SessionStartedScreen({super.key, required this.time});

  @override
  State<SessionStartedScreen> createState() => _SessionStartedScreenState();
}

class _SessionStartedScreenState extends State<SessionStartedScreen> {
  int seconds = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    seconds = int.parse(widget.time);
    setState(() {});
    decreaseTime();
  }

  void decreaseTime() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          showSnackBar(context, "Congrats Warrior!");
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
    moveScreen(context, true, DoneScreen());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 1,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.lightBlue[100],
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Session has started.",
                style: GoogleFonts.poppins(
                  color: Colors.deepPurple,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              )),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 128.0),
                child: Text("Time remaining...",
                    style: GoogleFonts.poppins(
                      color: Colors.deepPurple,
                      fontSize: 21,
                      fontWeight: FontWeight.w300,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  '${seconds}',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  '"A warrior never gives up! 🔥"',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    FriendStatusWidget(),
                    const SizedBox(height: 10),
                    FriendStatusWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    showSnackBar(context, "never expected from a warrior!");
                    moveScreen(context, true, HomeScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'GIVE UP! (But it isn\'t for you!)',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
