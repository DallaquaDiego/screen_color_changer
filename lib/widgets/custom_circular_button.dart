import 'package:flutter/material.dart';

// This widget is a reusable circular button, that accepts an icon and a callback function
class CustomCircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;

  const CustomCircularButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 56.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: Icon(
          icon,
          size: size * 0.5,
          color: const Color(0xFFD84315),
        ),
      ),
    );
  }
}
