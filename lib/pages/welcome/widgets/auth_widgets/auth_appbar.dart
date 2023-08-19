import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../icon_action_button.dart';

class AuthAppBar extends StatelessWidget {
  final String appBarTitle;

  const AuthAppBar({
    super.key,
    required this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const IconActionButton(
          icon: Icons.chevron_left,
        ),
        Text(
          appBarTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        SizedBox(
          width: 60.w,
          height: 60.w,
        ),
      ],
    );
  }
}
