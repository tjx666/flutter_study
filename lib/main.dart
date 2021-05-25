import 'package:flutter/material.dart';
// import './pages/stateless_widget_life_cycle.dart';
// import './pages/stateful_widget_life_cycle.dart';
// import './pages/app_life_cycle.dart';
// import './pages/route_life_cycle.dart';
// import './pages/canvas.dart';
// import './pages/app_life_cycle.dart';
// import './pages/automatic_keep_alive.dart';
// import './pages/keep_alive_widget.dart';
// import './pages/counter.dart';
// import './pages/custom_dialog.dart';
// import './pages/animation/tween_animation.dart';
// import './pages/connectivity.dart';
// import './pages/callbacks..dart';
import './pages/cached_network_image.dart';

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
      // home: TestStatelessWidgetLifeCycle(),
      // home: TestStatefulWidgetLifeCycle(),
      // home: TestRouteLifeCycle(),
      // navigatorObservers: [routeObserver],
      // home: TestAppLifeCycle(),
      // home: Counter(),
      // home: TestTweenAnimation(),
      // home: TestConnectivity(),
      // home: TestCallbacks(),
      home: TestCachedNetworkImage(),
    );
  }
}
