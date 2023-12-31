import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WritingTitleText extends StatefulWidget {
  final String? hintText;
  final bool isTitle;

  const WritingTitleText({
    super.key,
    this.hintText,
    required this.isTitle,
  });

  @override
  _WritingTitleTextState createState() => _WritingTitleTextState();
}

class _WritingTitleTextState extends State<WritingTitleText> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70.h,
        padding: const EdgeInsets.only(right: 5),
        child: TextField(
          controller: _textEditingController,
          maxLines: 1,
          maxLength: 16,
          autocorrect: false,
          obscureText: false,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: const Color(0xFF202020),
          decoration: InputDecoration(
            counterText: '',
            isDense: true,
            hintText: widget.isTitle ? widget.hintText ?? "" : "Untitled",
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
              color:
                  widget.isTitle ? const Color(0xFF202020) : Colors.grey[350],
            ),
          ),
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF202020),
          ),
        ),
      ),
    );
  }
}
