import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_demo/pages/writing/widgets/writing_content.dart';
import 'package:mvp_demo/pages/writing/widgets/writing_title_text.dart';

import '../../common/widgets/icon_action_button.dart';

class WritingPage extends StatefulWidget {
  final String? hintText;
  final bool isTitle;

  const WritingPage({
    super.key,
    this.hintText,
    required this.isTitle,
  });

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
    return Material(
      color: Colors.transparent,
      child: Container(
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
                  width: 380.w,
                  height: 750.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: DefaultTextStyle(
                    style: const TextStyle(color: Colors.black),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            top: 30.w,
                            right: 20.w,
                          ),
                          width: 360.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WritingTitleText(
                                hintText: widget.hintText,
                                isTitle: widget.isTitle,
                              ),
                              const IconActionButton(
                                icon: Icons.check,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              height: 650.h,
                              padding: const EdgeInsets.all(20),
                              child: const WritingContent(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
