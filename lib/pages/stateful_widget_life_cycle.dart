import 'package:flutter/material.dart';

class TestWidgetLifeCycle extends StatefulWidget {
  TestWidgetLifeCycle({Key? key}) : super(key: key);

  @override
  _TestWidgetLifeCycleState createState() => _TestWidgetLifeCycleState();
}

class _TestWidgetLifeCycleState extends State<TestWidgetLifeCycle> {
  int count = 0;
  bool showStatefulWidget = true;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);

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
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                child: Text('didUpdate'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showStatefulWidget = false;
                  });
                },
                child: Text('dispose'),
              ),
            ],
          ),
          if (showStatefulWidget)
            _TestStatefulWidgetLifeCycle(
              count: count,
            ),
        ],
      ),
    );
  }
}

class _TestStatefulWidgetLifeCycle extends StatefulWidget {
  final int count;

  _TestStatefulWidgetLifeCycle({Key? key, required this.count})
      : super(key: key) {
    print('[#${identityHashCode(this)}][StatefulWidget] call constructor!');
  }

  @override
  StatefulElement createElement() {
    print('[#${identityHashCode(this)}][StatefulWidget] call createElement!');
    return super.createElement();
  }

  @override
  _TestStatefulWidgetLifeCycleState createState() {
    print('[#${identityHashCode(this)}][StatefulWidget] call create state!');
    return _TestStatefulWidgetLifeCycleState();
  }
}

class _TestStatefulWidgetLifeCycleState
    extends State<_TestStatefulWidgetLifeCycle> {
  _TestStatefulWidgetLifeCycleState() : super() {
    print(
        '[#${identityHashCode(this)}][StatefulWidgetState] call constructor!');
  }

  @override
  void initState() {
    super.initState();
    print('[#${identityHashCode(this)}][StatefulWidgetState] init state!');
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print('run postFrameCallback');
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(
        '[#${identityHashCode(this)}][StatefulWidgetState] didChangeDependencies!');
  }

  @override
  void didUpdateWidget(covariant _TestStatefulWidgetLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('[#${identityHashCode(this)}][StatefulWidgetState] didUpdateWidget!');
  }

  @override
  void deactivate() {
    print('[#${identityHashCode(this)}][StatefulWidgetState] deactivate!');
    super.deactivate();
  }

  @override
  void dispose() {
    print('[#${identityHashCode(this)}][StatefulWidgetState] dispose!');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('[#${identityHashCode(this)}][StatefulWidgetState] build!');

    return Container(
      child: Text('stateful widget, count: ${widget.count}'),
    );
  }
}
