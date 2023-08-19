import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../welcome/widgets/icon_action_button.dart';

class WritingPage extends StatefulWidget {
  const WritingPage({super.key});

  @override
  _WritingPageState createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      height: 932.h,
      decoration: const BoxDecoration(
        color: Color(0xFF202020),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                padding: const EdgeInsets.all(30),
                width: 380.w,
                height: 750.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: const DefaultTextStyle(
                  style: TextStyle(color: Colors.black),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WritingWidget(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class WritingWidget extends StatelessWidget {
  const WritingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.w,
      child: const Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WritingTextField(),
            IconActionButton(
              icon: Icons.check,
            ),
          ],
        ),
      ),
    );
  }
}

class WritingTextField extends StatelessWidget {
  const WritingTextField({
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
