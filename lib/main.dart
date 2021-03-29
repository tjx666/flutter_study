import 'package:flutter/material.dart';
import './pages/widget_life_cycle.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestWidgetLifeCycle(),
    );
  }
}
