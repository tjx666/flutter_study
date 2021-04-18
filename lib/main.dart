import 'package:flutter/material.dart';
import './pages/stateless_widget_life_cycle.dart';
import './pages/stateful_widget_life_cycle.dart';
import './pages/automatic_keep_alive.dart';
import './pages/keep_alive_widget.dart';

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
        primarySwatch: Colors.green,
      ),
      home: TestStatefulWidgetLifeCycle(),
    );
  }
}
