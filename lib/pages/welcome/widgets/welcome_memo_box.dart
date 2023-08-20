import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomMemoBox extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final bool isIcon;

  const WelcomMemoBox({
    super.key,
    this.title,
    this.icon,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: isIcon
            ? Icon(
                icon,
                size: 28.sp,
              )
            : Text(
                title ?? "",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
