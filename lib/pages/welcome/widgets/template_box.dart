import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TemplateBox extends StatelessWidget {
  final double width;
  final double height;
  final String? templateTitle;
  final Color backgroundColor;
  final AlignmentGeometry? alignment;
  final bool specialText;

  const TemplateBox({
    super.key,
    required this.width,
    required this.height,
    this.templateTitle,
    required this.backgroundColor,
    this.alignment,
    this.specialText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(20.w),
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: specialText
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Click\nHere ",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 25.sp,
                    ),
                  ],
                ),
              ],
            )
          : Text(
              templateTitle ?? "",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
