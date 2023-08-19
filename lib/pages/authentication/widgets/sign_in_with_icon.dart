import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInWithIcon extends StatelessWidget {
  final String icon;

  const SignInWithIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      height: 55.w,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Image.asset("assets/icons/$icon.png"),
    );
  }
}
