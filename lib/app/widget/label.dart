import 'package:flutter/material.dart';
import 'package:flutter_application_cinemax/app/widget/colors.dart';

class Teg extends StatelessWidget {
  const Teg({super.key});

  @override
Widget build(BuildContext context) {
  return Container(
    width: 65,
    height: 20,
    decoration: BoxDecoration(
      color:  label,
      borderRadius: BorderRadius.circular(6),
    ),
    alignment: Alignment.center,
    child: const Text(
      'Free',
      style: TextStyle(
        color: textname,
        fontSize: 10,
        fontWeight: FontWeight.w500
      ),
    ),
  );
}

}