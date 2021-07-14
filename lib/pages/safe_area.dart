import 'package:flutter/material.dart';

class TestSafeArea extends StatefulWidget {
  TestSafeArea({Key? key}) : super(key: key);

  @override
  _TestSafeAreaState createState() => _TestSafeAreaState();
}

class _TestSafeAreaState extends State<TestSafeArea> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
