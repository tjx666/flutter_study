import 'package:flutter/material.dart';

class TestSlider extends StatefulWidget {
  TestSlider({Key? key}) : super(key: key);

  @override
  _TestSliderState createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$value'),
            Slider(
              value: value,
              onChanged: (val) {
                setState(() {
                  value = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
