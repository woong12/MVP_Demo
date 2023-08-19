import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  final String typeName;
  final String icon;
  final String hintText;
  final bool obscure;

  const AuthTextField({
    super.key,
    required this.typeName,
    required this.icon,
    required this.hintText,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              typeName,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 5.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15.w),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 17.w),
                  width: 20.w,
                  height: 20.w,
                  child: Image.asset("assets/icons/$icon.png"),
                ),
                SizedBox(
                  width: 250.w,
                  height: 60.h,
                  child: TextField(
                    cursorHeight: 17.h,
                    cursorWidth: 1.5.w,
                    maxLines: 1,
                    autocorrect: false,
                    obscureText: obscure,
                    cursorColor: const Color(0xFF202020),
                    decoration: InputDecoration(
                      hintText: hintText,
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
                        fontSize: 14.sp,
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.normal,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
