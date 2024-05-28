import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.error,
    this.showPassword=false,
    this.suffixIcon ,
    // required this.data
  });

  final TextEditingController controller;
  final String label;
  final String hint ;
  final String error;
  bool showPassword= false ;
  Widget? suffixIcon ;
  // String data;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: showPassword,
      validator: (val) => /*anonymous function*/
      val!.isEmpty
          ? error
          : null /*if not empty , don't do anything*/
      ,
      decoration: InputDecoration(
        labelText:label,
        labelStyle: const TextStyle(
            fontFamily: 'Metropolis thin',
            fontWeight: FontWeight.w900),
        hintText: hint,
        hintStyle: const TextStyle(
            fontFamily: 'Metropolis thin',
            fontWeight: FontWeight.w900,
            // color: Colors.grey
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.redAccent ,
      ),
    );
  }
}

