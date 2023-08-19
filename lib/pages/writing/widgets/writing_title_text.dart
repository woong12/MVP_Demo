import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WritingTitleText extends StatelessWidget {
  const WritingTitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70.h,
        padding: const EdgeInsets.only(right: 5),
        child: TextField(
          maxLines: 1,
          maxLength: 16,
          obscureText: false,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: const Color(0xFF202020),
          decoration: InputDecoration(
            counterText: '',
            isDense: true,
            hintText: "Untitled",
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            hintStyle: TextStyle(
              color: Colors.grey[350],
            ),
          ),
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF202020),
          ),
          autocorrect: false,
        ),
      ),
    );
  }
}
