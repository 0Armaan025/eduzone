import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  final icon;
  final bool isObscure;
  final TextEditingController controller;
  const AuthField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.isObscure,
      required this.controller});

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 2.1,
              color: Colors.purple,
            ),
          ),
          iconColor: Colors.green,
          hintText: widget.hintText,
        ),
        obscureText: widget.isObscure,
        controller: widget.controller,
      ),
    );
  }
}
