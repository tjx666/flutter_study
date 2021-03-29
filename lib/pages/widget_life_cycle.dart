import 'package:flutter/material.dart';

class TestWidgetLifeCycle extends StatefulWidget {
  TestWidgetLifeCycle({Key key}) : super(key: key);

  @override
  _TestWidgetLifeCycleState createState() => _TestWidgetLifeCycleState();
}

class _TestWidgetLifeCycleState extends State<TestWidgetLifeCycle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Life Cycle'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('setState'),
              )
            ],
          ),
          _TestStatefulWidgetLifeCycle(),
        ],
      ),
    );
  }
}

class _TestStatelessWidgetLifeCycle extends StatelessWidget {
  _TestStatelessWidgetLifeCycle({Key key}) : super(key: key) {
    print('[#${identityHashCode(this)}][stateless widget] call constructor!');
  }

  @override
  StatelessElement createElement() {
    print('[#${identityHashCode(this)}][stateless widget] call createElement!');
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    print('[#${identityHashCode(this)}][stateless widget] build!');

    return Container(
      child: Text('stateless widget'),
    );
  }
}

class _TestStatefulWidgetLifeCycle extends StatefulWidget {
  _TestStatefulWidgetLifeCycle({Key key}) : super(key: key) {
    print('[#${identityHashCode(this)}][stateful widget] call constructor!');
  }

  @override
  StatefulElement createElement() {
    print('[#${identityHashCode(this)}][stateful widget] call createElement!');
    return super.createElement();
  }

  @override
  _TestStatefulWidgetLifeCycleState createState() {
    print('[#${identityHashCode(this)}][stateful widget] call create state!');
    return _TestStatefulWidgetLifeCycleState();
  }
}

class _TestStatefulWidgetLifeCycleState
    extends State<_TestStatefulWidgetLifeCycle> {
  _TestStatefulWidgetLifeCycleState() : super() {
    print(
        '[#${identityHashCode(this)}][stateful widget state] call constructor!');
  }

  @override
  void initState() {
    super.initState();
    print('[#${identityHashCode(this)}][stateful widget state] init state!');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(
        '[#${identityHashCode(this)}][stateful widget state] call didChangeDependencies!');
  }

  @override
  void didUpdateWidget(covariant _TestStatefulWidgetLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(
        '[#${identityHashCode(this)}][stateful widget state] call didUpdateWidget!');
  }

  @override
  void dispose() {
    print('[#${identityHashCode(this)}][stateful widget state] dispose!');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('[#${identityHashCode(this)}][stateful widget state] build!');

    return Container(
      child: Text('stateful widget'),
    );
  }
}
