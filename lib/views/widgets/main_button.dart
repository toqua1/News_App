import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    required this.onTap});

final String text ;
final VoidCallback onTap ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
          onPressed: onTap,
          child: Text(text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white ,
          fontSize: 18,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600,
          letterSpacing: 1
        ),
      ),
      ),
    );
  }
}
