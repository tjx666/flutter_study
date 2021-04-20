import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  AppLifecycleState? _notification;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Future<bool> didPopRoute() async {
    print('[HomePage] Route LifeCycle: pop route');
    return false;
  }

  @override
  Future<bool> didPushRoute(String route) async {
    print('[HomePage] Route LifeCycle: push route');
    return false;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('[HomePage] App lifeCycle $state!');
    setState(() {
      _notification = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('app lifeCycle state: $_notification'),
          ],
        ),
      ),
    );
  }
}

class TestRouter extends StatefulWidget {
  TestRouter({Key? key}) : super(key: key);

  @override
  _TestRouterState createState() => _TestRouterState();
}

class _TestRouterState extends State<TestRouter> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
