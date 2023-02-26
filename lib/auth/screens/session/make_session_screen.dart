import 'package:eduzone_clone/auth/screens/session/invite_friend.dart';
import 'package:eduzone_clone/auth/screens/session/session_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widgets/nav_bar_widget.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  bool ezSelected = true;
  bool midSelected = false;
  bool hardSelected = false;
  String someTime = "600";

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
                "Let's start a session.",
                style: GoogleFonts.poppins(
                  color: Colors.deepPurple,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(18),
                    fillColor: Colors.blue[200],
                    hintText: 'Enter the subject.',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                "Choose a difficulty.",
                style: GoogleFonts.poppins(
                  color: Colors.deepPurple,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              )),
              const SizedBox(
                height: 10,
              ),
              Text(
                '"Remember, no one has ever chosen\nthe most difficult one, if you choose,\nyou are a warrior 🔥"',
                style: GoogleFonts.poppins(
                  color: Colors.purple,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    ezSelected = true;
                    midSelected = false;
                    hardSelected = false;
                    someTime = "600";
                    setState(() {});
                  },
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: ezSelected == true
                          ? Colors.blue[500]
                          : Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 65,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('EZ.',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        Text('not for warriors.',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    ezSelected = false;
                    midSelected = true;
                    hardSelected = false;
                    someTime = "1800";
                    setState(() {});
                  },
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: midSelected == true
                          ? Colors.blue[500]
                          : Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 65,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('MID.',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        Text('so, you wanna be one?',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    ezSelected = false;
                    midSelected = false;
                    hardSelected = true;
                    someTime = "3600";
                    setState(() {});
                  },
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: hardSelected == true
                          ? Colors.blue[500]
                          : Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 65,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HARD.',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        Text('OMG, you are the one.',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      moveScreen(
                          context,
                          false,
                          InviteFriendScreen(
                            time: someTime,
                          ));
                    },
                    child: Container(
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Invite buddies...',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (ezSelected == true) {
                          someTime = "600";
                          setState(() {});
                        } else if (midSelected) {
                          someTime = "1800";
                          setState(() {});
                        } else {
                          someTime = "3600";
                          setState(() {});
                        }
                      });

                      moveScreen(
                          context,
                          true,
                          SessionStartedScreen(
                            time: someTime,
                          ));
                    },
                    child: Container(
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'START!',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: NavBarWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
