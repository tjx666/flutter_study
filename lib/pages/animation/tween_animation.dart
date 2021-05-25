import 'package:flutter/material.dart';

class TestTweenAnimation extends StatefulWidget {
  TestTweenAnimation({Key? key}) : super(key: key);

  @override
  _TestTweenAnimationState createState() => _TestTweenAnimationState();
}

class _TestTweenAnimationState extends State<TestTweenAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this)
          ..addListener(() {
            setState(() {});
          });
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.forward(from: 1.0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试补间动画'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: animation.value * 300,
            width: 60,
            height: 60,
            child: ColoredBox(color: Colors.red),
          )
        ],
      ),
    );
  }
}
