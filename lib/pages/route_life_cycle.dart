import 'package:flutter/material.dart';

final routeObserver = RouteObserver<ModalRoute>();

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  AppLifecycleState? _notification;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    /// Called when the current route has been pushed.
    print('[HomePage] route did push!');
  }

  @override
  void didPushNext() {
    /// Called when the current route has been popped off.
    print('[HomePage] route did push next!');
  }

  @override
  void didPop() {
    /// Called when the current route has been popped off.
    print('[HomePage] route did pop!');
  }

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
    print('[HomePage] route did pop next!');
  }

  void goToSecondPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return SecondPage();
      },
    ));
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
            ElevatedButton(
              onPressed: goToSecondPage,
              child: Text('go to second page'),
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with RouteAware {
  AppLifecycleState? _notification;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    // Route was pushed onto navigator and is now topmost route.
    print('[SecondPage] route did push!');
  }

  @override
  void didPushNext() {
    /// Called when the current route has been popped off.
    print('[SecondPage] route did push next!');
  }

  @override
  void didPop() {
    /// Called when the current route has been popped off.
    print('[SecondPage] route did pop!');
  }

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
    print('[SecondPage] route did pop next!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('app lifeCycle state: $_notification'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('go to page 1'),
            )
          ],
        ),
      ),
    );
  }
}

class TestRouteLifeCycle extends StatefulWidget {
  TestRouteLifeCycle({Key? key}) : super(key: key);

  @override
  _TestRouteLifeCycleState createState() => _TestRouteLifeCycleState();
}

class _TestRouteLifeCycleState extends State<TestRouteLifeCycle> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
