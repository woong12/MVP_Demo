import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mvp_demo/pages/authentication/sign_in_page.dart';
import 'package:mvp_demo/pages/authentication/widgets/auth_appbar.dart';
import 'package:mvp_demo/pages/authentication/widgets/auth_text_field.dart';
import 'package:mvp_demo/pages/authentication/widgets/login_button.dart';

import '../../controllers/expanded_container.dart';
import '../../common/widgets/next_page_button.dart';

class SignUpPage extends StatelessWidget {
  final ExpandedContainerController controller =
      Get.put(ExpandedContainerController());

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: Padding(
        padding: EdgeInsets.only(top: 80.h),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.black,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: ScaleTransition(
                  scale: controller.animation,
                  alignment: Alignment.center,
                  child: Container(
                    width: 380.w,
                    height: 720.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 380.w,
                          height: 720.h,
                          padding: EdgeInsets.all(20.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const AuthAppBar(appBarTitle: "Sign Up"),
                              SizedBox(height: 70.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Column(
                                  children: [
                                    const AuthTextField(
                                      hintText: "Enter your Username",
                                      icon: "iconUser",
                                      obscure: false,
                                      typeName: 'Username',
                                    ),
                                    SizedBox(height: 30.h),
                                    const AuthTextField(
                                      hintText: "Enter your Email",
                                      icon: "iconEmail",
                                      obscure: false,
                                      typeName: 'Email',
                                    ),
                                    SizedBox(height: 30.h),
                                    const AuthTextField(
                                      hintText: "Enter your Password",
                                      icon: "iconLock",
                                      obscure: true,
                                      typeName: 'Password',
                                    ),
                                    SizedBox(height: 30.h),
                                    const AuthTextField(
                                      hintText: "Enter your Confirm Password",
                                      icon: "iconLock",
                                      obscure: true,
                                      typeName: 'Confirm Password',
                                    ),
                                    SizedBox(height: 60.h),
                                    const LoginButton(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: NextPageButton(
                  pageName: "Sign In",
                  onTap: () {
                    Get.off(
                      () => SignInPage(),
                      transition: Transition.downToUp,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
