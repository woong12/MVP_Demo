import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mvp_demo/pages/welcome/widgets/welcome_memo_box.dart';
import 'package:mvp_demo/pages/writing/writing_page.dart';
import 'package:mvp_demo/common/widgets/next_page_button.dart';
import 'package:mvp_demo/pages/welcome/widgets/paper_size.dart';
import 'package:mvp_demo/pages/welcome/widgets/scroll_bar.dart';
import 'package:mvp_demo/pages/welcome/widgets/template_box.dart';

import '../authentication/sign_in_page.dart';
import 'description_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 130.h),
            child: Text(
              "FLOO",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 1290.w,
              height: 550.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 1290.w,
                        height: 15.h,
                        child: Row(
                          children: [
                            const Spacer(),
                            paperSize("5"),
                            paperSize("10"),
                            paperSize("15"),
                            paperSize("20"),
                            paperSize("25"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 1290.w,
                    height: 500.h,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: TemplateBox(
                            width: 340.w,
                            height: 230.h,
                            templateTitle: "welcome",
                            backgroundColor: const Color(0xFFfff3da),
                          ),
                        ),
                        Positioned(
                          left: 70.w,
                          bottom: 290.h,
                          child: const WelcomMemoBox(
                            title: "Drag",
                          ),
                        ),
                        Positioned(
                          left: 200.w,
                          bottom: 250.h,
                          child: const WelcomMemoBox(
                            isIcon: true,
                            icon: Icons.arrow_forward,
                          ),
                        ),
                        Positioned(
                          left: 430.w,
                          bottom: 280.h,
                          child: const WelcomMemoBox(
                            isIcon: true,
                            icon: Icons.arrow_forward,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: TemplateBox(
                            height: 180.h,
                            width: 600.w,
                            backgroundColor: const Color(0xFFDFCCFB),
                            templateTitle: "Hello",
                          ),
                        ),
                        Positioned(
                          left: 150.w,
                          bottom: 40.h,
                          child: const WelcomMemoBox(
                            isIcon: true,
                            icon: Icons.back_hand,
                          ),
                        ),
                        Positioned(
                          left: 370.w,
                          bottom: 40.h,
                          child: const WelcomMemoBox(),
                        ),
                        Positioned(
                          left: 650,
                          bottom: 50,
                          child: TemplateBox(
                            height: 350.h,
                            width: 180.w,
                            backgroundColor: const Color(0xFFBEADFA),
                            templateTitle: "buy list",
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Positioned(
                          left: 690.w,
                          bottom: 80.h,
                          child: const WelcomMemoBox(
                            title: "items",
                          ),
                        ),
                        Positioned(
                          left: 690.w,
                          bottom: 220.h,
                          child: const WelcomMemoBox(
                            title: "apple",
                          ),
                        ),
                        Positioned(
                          left: 900.w,
                          bottom: 150.h,
                          child: TemplateBox(
                            height: 150.h,
                            width: 280.w,
                            backgroundColor: const Color(0xFFFDCEDF),
                            specialText: true,
                          ),
                        ),
                        Positioned(
                          left: 1050.w,
                          bottom: 175.h,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                () => const DescriptionPage(),
                                transition: Transition.fadeIn,
                                duration: const Duration(milliseconds: 500),
                              );
                            },
                            child: const DefaultTextStyle(
                              style: TextStyle(color: Colors.black),
                              child: WelcomMemoBox(
                                title: "Hi !",
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 940.w,
                          bottom: 320.h,
                          child: GestureDetector(
                            ///
                            onTap: () {
                              Get.to(
                                () => const WritingPage(
                                  hintText: "Click to Edit",
                                  isTitle: true,
                                ),
                                transition: Transition.fadeIn,
                                duration: const Duration(milliseconds: 500),
                              );
                            },
                            child: const WelcomMemoBox(
                              title: "Click to\n   Edit",
                            ),
                          ),
                        ),
                        Positioned(
                          left: 860.w,
                          bottom: 20.h,
                          child: const WelcomMemoBox(
                            title: "good",
                          ),
                        ),
                        Positioned(
                          left: 1080.w,
                          bottom: 20.h,
                          child: const WelcomMemoBox(),
                        ),
                      ],
                    ),
                  ),
                  const ScrollBar(),
                ],
              ),
            ),
          ),
          NextPageButton(
            pageName: "start",
            onTap: () {
              Get.to(
                () => SignInPage(),
                transition: Transition.downToUp,
                duration: const Duration(milliseconds: 500),
              );
            },
          ),
        ],
      ),
    );
  }
}
