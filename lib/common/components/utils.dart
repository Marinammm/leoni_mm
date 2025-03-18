import 'package:flutter/material.dart';

class StyledCircleAvatar extends StatelessWidget {
  final double radius;
  final String imagePath;
  const StyledCircleAvatar({super.key, required this.radius, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.tealAccent,
      child: CircleAvatar(
        radius: radius - 4,
        backgroundColor: Colors.black,
        child: CircleAvatar(
          radius: radius - 7,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
    );
  }
}
