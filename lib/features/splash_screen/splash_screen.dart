import 'package:eduzone_clone/auth/screens/home_screen.dart';
import 'package:eduzone_clone/auth/screens/login_screen.dart';
import 'package:eduzone_clone/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = firebaseAuth.currentUser?.uid ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: size.height * 0.94,
            width: double.infinity,
            decoration: backgroundDecoration,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 2.0, left: 20),
                  child: Text('Hi There,\nWelcome to $appName.',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 36,
                      )),
                ),
                Image(
                  image: AssetImage('assets/images/hello_img.png'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      moveScreen(
                          context,
                          true,
                          firebaseAuth.currentUser == null
                              ? LoginScreen()
                              : HomeScreen());
                    },
                    splashColor: Colors.green[600],
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                          width: 1,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            HexColor("#abc6ff"),
                            HexColor("#6395ff"),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: double.infinity,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        'Continue',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
