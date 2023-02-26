import 'package:eduzone_clone/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetBadgeScreen extends StatelessWidget {
  const GetBadgeScreen({super.key});

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
                  "The badge\ngoes\nto\nArmaan!",
                  style: GoogleFonts.poppins(
                    color: Colors.deepPurple,
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/744/744922.png'),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  'CONGRATULATIONS 🥳',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
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
