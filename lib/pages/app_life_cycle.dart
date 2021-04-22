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

  /// 例如按虚拟按键返回桌面退出 flutter 应用时，将 flutter 应用这个应用级别的 route pop
  @override
  Future<bool> didPopRoute() async {
    print('[HomePage] App Route LifeCycle: pop route');
    return false;
  }

  /// 没见触发过
  @override
  Future<bool> didPushRoute(String route) async {
    print('[HomePage] App Route LifeCycle: push route');
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

class TestAppLifeCycle extends StatefulWidget {
  TestAppLifeCycle({Key? key}) : super(key: key);

  @override
  _TestAppLifeCycleState createState() => _TestAppLifeCycleState();
}

class _TestAppLifeCycleState extends State<TestAppLifeCycle> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
