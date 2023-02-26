import 'package:eduzone_clone/auth/screens/home_screen.dart';
import 'package:eduzone_clone/auth/screens/session/make_session_screen.dart';
import 'package:eduzone_clone/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.lightBlue,
            Colors.purple,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              moveScreen(context, false, HomeScreen());
            },
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue[400],
                border: Border.all(
                  color: Colors.deepPurple,
                  width: 0.1,
                ),
              ),
              height: size.height * 0.07,
              alignment: Alignment.center,
              child: Text(
                'HOME',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              moveScreen(context, false, SessionScreen());
            },
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue[400],
                border: Border.all(
                  color: Colors.deepPurple,
                  width: 0.1,
                ),
              ),
              height: size.height * 0.07,
              alignment: Alignment.center,
              child: Text(
                'STUDY',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
