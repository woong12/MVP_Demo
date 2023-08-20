import 'package:flutter/material.dart';

class DragAndDropExample extends StatefulWidget {
  const DragAndDropExample({super.key});

  @override
  _DragAndDropExampleState createState() => _DragAndDropExampleState();
}

class _DragAndDropExampleState extends State<DragAndDropExample> {
  Offset _positionRed = const Offset(50, 50);
  Offset _positionBlue = const Offset(150, 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag and Drop Example'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: _positionRed.dx,
            top: _positionRed.dy,
            child: Draggable(
              feedback: Container(
                width: 100,
                height: 100,
                color: Colors.red.withOpacity(0.7),
                child: const Center(child: Text('Red')),
              ),
              onDraggableCanceled: (velocity, offset) {
                setState(() {
                  _positionRed = offset;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: const Center(child: Text('Red')),
              ),
            ),
          ),
          Positioned(
            left: _positionBlue.dx,
            top: _positionBlue.dy,
            child: Draggable(
              feedback: Container(
                width: 100,
                height: 100,
                color: Colors.blue.withOpacity(0.7),
                child: const Center(child: Text('Blue')),
              ),
              onDraggableCanceled: (velocity, offset) {
                setState(() {
                  _positionBlue = offset;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(child: Text('Blue')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
