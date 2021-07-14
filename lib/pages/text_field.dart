import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestTextField extends StatefulWidget {
  TestTextField({Key? key}) : super(key: key);

  @override
  _TestTextFieldState createState() => _TestTextFieldState();
}

class _TestTextFieldState extends State<TestTextField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test user input'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Row(
              children: [
                Text('name: '),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: '搜索',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Text('phone: '),
                Expanded(child: CupertinoTextField()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
