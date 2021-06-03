import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final width = size.width;
    // final height = size.height;

    canvas.drawRect(Rect.fromLTRB(100, 100, 150, 150), Paint()..color = Colors.red);
    // canvas.drawRect(Rect.fromLTWH(100, 100, 50, 50), Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TestCanvas extends StatefulWidget {
  TestCanvas({Key? key}) : super(key: key);

  @override
  _TestCanvasState createState() => _TestCanvasState();
}

class _TestCanvasState extends State<TestCanvas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试 canvas'),
      ),
      body: CustomPaint(
        painter: MyPainter(),
      ),
    );
  }
}
