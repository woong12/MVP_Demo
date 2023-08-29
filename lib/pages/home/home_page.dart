import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_demo/pages/welcome/widgets/memo_box.dart';
import 'package:mvp_demo/pages/writing/writing_page.dart';
import 'package:mvp_demo/common/widgets/next_page_button.dart';
import 'package:mvp_demo/pages/welcome/widgets/paper_size.dart';
import 'package:mvp_demo/pages/welcome/widgets/scroll_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset boxPosition = const Offset(300, 250);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: Column(
              children: [
                Text(
                  "July 21",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Mon",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 30.h),
              ],
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
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10, // Number of columns in the grid
                        mainAxisSpacing: 20, // Spacing between rows
                        crossAxisSpacing: 20, // Spacing between columns
                      ),
                      itemCount:
                          30, // Number of MemoBox widgets you want to display
                      itemBuilder: (context, index) {
                        return const MemoBox();
                      },
                    ),
                    // Stack(
                    //   children: [
                    //     // Positioned(
                    //     //   left: 0,
                    //     //   top: 0,
                    //     //   child: TemplateBox(
                    //     //     width: 340.w,
                    //     //     height: 230.h,
                    //     //     templateTitle: "welcome",
                    //     //     backgroundColor: const Color(0xFFfff3da),
                    //     //   ),
                    //     // ),
                    //     Positioned(
                    //       left: boxPosition.dx,
                    //       top: boxPosition.dy,
                    //       child: Draggable(
                    //         feedback: const MemoBox(),
                    //         onDraggableCanceled: (velocity, offset) {
                    //           setState(() {
                    //             boxPosition = offset;
                    //           });
                    //         },
                    //         child: const MemoBox(),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ),
                  const ScrollBar(),
                ],
              ),
            ),
          ),
          NextPageButton(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const WritingPage(isTitle: false),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeOut;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 500),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
