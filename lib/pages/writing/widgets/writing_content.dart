import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WritingContent extends StatefulWidget {
  const WritingContent({super.key});

  @override
  _WritingContentState createState() => _WritingContentState();
}

class _WritingContentState extends State<WritingContent> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        width: 380.w,
        child: TextField(
          controller: _textEditingController,
          autocorrect: false,
          obscureText: false,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          cursorColor: const Color(0xFF202020),
          decoration: InputDecoration(
            counterText: '',
            isDense: true,
            hintText: "write anything",
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
              color: Colors.grey[400],
            ),
          ),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF202020),
          ),
        ),
      ),
    );
  }
}
