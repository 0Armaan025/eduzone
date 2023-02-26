import 'package:eduzone_clone/auth/controller/auth_controller.dart';
import 'package:eduzone_clone/auth/models/user.dart';
import 'package:eduzone_clone/auth/screens/login_screen.dart';
import 'package:eduzone_clone/auth/screens/signup_screen.dart';
import 'package:eduzone_clone/common/constants/constants.dart';
import 'package:eduzone_clone/common/widgets/auth/login_screen/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LogininScreenState();
}

class _LogininScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  login(BuildContext context) {
    AuthController()
        .login(context, _emailController.text, _passwordController.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose;
    _passwordController.dispose;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Shader linearGradient = LinearGradient(
      colors: <Color>[HexColor("#e6a6ff"), HexColor("#9a00d6")],
    ).createShader(
      Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: size.height * 1.1,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  HexColor("#d9e6ff"),
                  HexColor("#dd87ff"),
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/eduzone_logo.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(110),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "Let's Log In",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            foreground: Paint()..shader = linearGradient,
                          ),
                        ),
                        Text(
                          "Let's study more efficiently!",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          HexColor("#efc7ff"),
                          HexColor("#e49eff"),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Let's fill some details",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthField(
                          controller: _emailController,
                          hintText: 'Enter your email',
                          icon: const Icon(Icons.email),
                          isObscure: false,
                        ),
                        AuthField(
                          controller: _passwordController,
                          hintText: 'Enter your password',
                          icon: const Icon(Icons.password),
                          isObscure: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              login(context);
                            },
                            child: Card(
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      HexColor("#1a5eed"),
                                      HexColor("#c958f5"),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Yes, Log In me!',
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              moveScreen(context, false, const SignUpScreen());
                            },
                            child: Card(
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      HexColor("#9fbbf5"),
                                      HexColor("#3475f7"),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'No, I wanna Sign Up!',
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
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
