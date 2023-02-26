import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendStatusWidget extends StatelessWidget {
  const FriendStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Colors.lightBlue,
            Colors.blue,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(''),
          ),
          Text(
            'Armaan',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Container(
            width: 120,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 0.5),
            ),
            child: Text(
              'Studying...',
              style: GoogleFonts.roboto(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
