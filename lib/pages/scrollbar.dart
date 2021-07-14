import 'package:flutter/material.dart';

class TestScrollbar extends StatefulWidget {
  TestScrollbar({Key? key}) : super(key: key);

  @override
  _TestScrollbarState createState() => _TestScrollbarState();
}

class _TestScrollbarState extends State<TestScrollbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: ListView(
          children: List.generate(20, (index) {
            final alpha = ((index + 1) * 0.05 * 100).round() / 100;
            final color = Color.fromRGBO(0, 255, 0, alpha);
            return ColoredBox(
              color: color,
              child: ListTile(
                title: Text('$alpha'),
              ),
            );
          }),
        ),
      ),
    );
  }
}
