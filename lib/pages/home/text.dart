import 'dart:math';

import 'package:flutter/material.dart';

class DragAndDropDemo extends StatefulWidget {
  const DragAndDropDemo({Key? key}) : super(key: key);

  @override
  _DragAndDropDemoState createState() => _DragAndDropDemoState();
}

class _DragAndDropDemoState extends State<DragAndDropDemo> {
  double xPos = 100;
  double yPos = 100;
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onPanDown: (details) {
            if (isInBallRegion(details.localPosition)) {
              setState(() {
                isDragging = true;
              });
            }
          },
          onPanEnd: (details) {
            setState(() {
              isDragging = false;
            });
          },
          onPanUpdate: (details) {
            if (isDragging) {
              setState(() {
                xPos = details.localPosition.dx;
                yPos = details.localPosition.dy;
              });
            }
          },
          child: Container(
            width: 500,
            height: 500,
            color: Colors.lightBlueAccent,
            child: CustomPaint(
              painter: _Paint(
                xPosition: xPos,
                yPosition: yPos,
                ballRad: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isInBallRegion(Offset position) {
    num distance = pow(position.dx - xPos, 2) + pow(position.dy - yPos, 2);
    return distance <= pow(20, 2);
  }
}

class _Paint extends CustomPainter {
  final double xPosition;
  final double yPosition;
  final double ballRad;

  _Paint({
    required this.xPosition,
    required this.yPosition,
    required this.ballRad,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(xPosition, yPosition),
      ballRad,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
