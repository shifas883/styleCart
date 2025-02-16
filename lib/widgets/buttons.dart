import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key, required this.text, required this.onTap, required this.width});
  final String text;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.red.shade900,
          borderRadius: BorderRadius.circular(30),

        ),
        child: Center(child: Text(text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600
          ),)),
      ),
    );
  }
}
