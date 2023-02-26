import 'package:eduzone_clone/auth/controller/auth_controller.dart';
import 'package:eduzone_clone/auth/models/user.dart';
import 'package:eduzone_clone/auth/screens/login_screen.dart';
import 'package:eduzone_clone/common/constants/constants.dart';
import 'package:eduzone_clone/common/widgets/auth/login_screen/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  signUp(BuildContext context) {
    AuthController controller = AuthController();

    if (_passwordConfirmController.text != _passwordConfirmController.text) {
      showSnackBar(context, 'Passwords do not match!');
    } else if (_phoneNumberController.text.length != 10) {
      showSnackBar(context, 'Invalid phone number!');
    } else if (_nameController.text.length < 3) {
      showSnackBar(context, 'Invalid name!');
    } else {
      User myUser = User(
          invited: "no",
          email: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text,
          phoneNumber: _phoneNumberController.text,
          noOfFriends: "0",
          totalHoursStudied: "0",
          uid: "");

      controller.signUp(myUser, context);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose;
    _passwordController.dispose;
    _nameController.dispose();
    _phoneNumberController.dispose();
    _passwordConfirmController.dispose();
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
            height: size.height * 1.3,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                          "Let's Sign Up",
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
                    height: size.height * 0.8,
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
                          controller: _nameController,
                          hintText: 'Enter your name',
                          icon: const Icon(Icons.email),
                          isObscure: false,
                        ),
                        AuthField(
                          controller: _phoneNumberController,
                          hintText: 'Enter your phone number',
                          icon: const Icon(Icons.email),
                          isObscure: false,
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
                        AuthField(
                          controller: _passwordConfirmController,
                          hintText: 'Confirm your password',
                          icon: const Icon(Icons.password),
                          isObscure: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              signUp(context);
                            },
                            child: Card(
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      HexColor("#1a5eed"),
                                      HexColor("#0034a1"),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Yes, Sign me up!',
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
                              moveScreen(context, false, const LoginScreen());
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
                                  'No, I wanna log in!',
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
