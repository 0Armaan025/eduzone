import 'package:eduzone_clone/auth/screens/session/get_badge_screen.dart';
import 'package:eduzone_clone/common/widgets/nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/constants/constants.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

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
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Yayyy!... Finally done!\nthe hardwork pays off!',
                  style: GoogleFonts.poppins(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.done,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  moveScreen(context, true, GetBadgeScreen());
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
                    'Get the badge',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 230,
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
