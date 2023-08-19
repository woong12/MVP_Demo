import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextPageButton extends StatefulWidget {
  final String? pageName;
  final VoidCallback onTap;

  const NextPageButton({
    super.key,
    this.pageName,
    required this.onTap,
  });

  @override
  State<NextPageButton> createState() => _NextPageButtonState();
}

class _NextPageButtonState extends State<NextPageButton>
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
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _animationController.forward();
      },
      onTapUp: (_) {
        _animationController.reverse();
      },
      onTapCancel: () {
        _animationController.reverse();
      },
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          double scaleX = _scaleAnimation.value;
          double scaleY = _scaleAnimation.value;
          double scaleZ = 1.0;

          Matrix4 transformMatrix =
              Matrix4.diagonal3Values(scaleX, scaleY, scaleZ);

          return Transform(
            transform: transformMatrix,
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 240.w,
              height: 65.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Center(
                child: Text(
                  widget.pageName ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
