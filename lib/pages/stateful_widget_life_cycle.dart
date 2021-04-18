import 'package:flutter/material.dart';

class StatefulWidgetLifeCycle extends StatefulWidget {
  StatefulWidgetLifeCycle({Key? key}) : super(key: key) {
    print('[$runtimeType#$hashCode] call constructor!');
  }

  @override
  StatefulElement createElement() {
    print('[$runtimeType#$hashCode] call createElement!');
    return super.createElement();
  }

  @override
  _StatefulWidgetLifeCycleState createState() {
    print('[$runtimeType#$hashCode] call create state!');
    return _StatefulWidgetLifeCycleState();
  }
}

class _StatefulWidgetLifeCycleState extends State<StatefulWidgetLifeCycle> {
  int count = 0;

  _StatefulWidgetLifeCycleState() : super() {
    print('[$runtimeType#$hashCode] call constructor!');
  }

  @override
  void initState() {
    super.initState();
    print('[$runtimeType#$hashCode] init state!');
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print('[$runtimeType#$hashCode] run postFrameCallback!');
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('[$runtimeType#$hashCode] didChangeDependencies!');
  }

  @override
  void didUpdateWidget(covariant StatefulWidgetLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('[$runtimeType#$hashCode] didUpdateWidget!');
  }

  @override
  void deactivate() {
    print('[$runtimeType#$hashCode] deactivate!');
    super.deactivate();
  }

  @override
  void dispose() {
    print('[$runtimeType#$hashCode] dispose!');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('[$runtimeType#$hashCode] build!');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$count'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text('+'),
        )
      ],
    );
  }
}

class ConstStatefulWidget extends StatefulWidget {
  const ConstStatefulWidget({Key? key}) : super(key: key);

  @override
  StatefulElement createElement() {
    print('[$runtimeType#$hashCode] call createElement!');
    return super.createElement();
  }

  @override
  _ConstStatefulWidgetState createState() {
    print('[$runtimeType#$hashCode] call create state!');
    return _ConstStatefulWidgetState();
  }
}

class _ConstStatefulWidgetState extends State<ConstStatefulWidget> {
  _ConstStatefulWidgetState() : super() {
    print('[$runtimeType#$hashCode] call constructor!');
  }

  @override
  void initState() {
    super.initState();
    print('[$runtimeType#$hashCode] init state!');
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print('[$runtimeType#$hashCode] run postFrameCallback!');
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('[$runtimeType#$hashCode] didChangeDependencies!');
  }

  @override
  void didUpdateWidget(covariant ConstStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('[$runtimeType#$hashCode] didUpdateWidget!');
  }

  @override
  void deactivate() {
    print('[$runtimeType#$hashCode] deactivate!');
    super.deactivate();
  }

  @override
  void dispose() {
    print('[$runtimeType#$hashCode] dispose!');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('[$runtimeType#$hashCode] build!');
    return Text('const stateful widget');
  }
}

class TestStatefulWidgetLifeCycle extends StatefulWidget {
  TestStatefulWidgetLifeCycle({Key? key}) : super(key: key);

  @override
  _TestStatefulWidgetLifeCycleState createState() =>
      _TestStatefulWidgetLifeCycleState();
}

class ColorizeBgRed extends StatefulWidget {
  ColorizeBgRed({Key? key, required this.disable, required this.child})
      : super(key: key) {
    print('[$runtimeType#$hashCode] call constructor!');
  }

  final Widget child;
  final bool disable;

  @override
  StatefulElement createElement() {
    print('[$runtimeType#$hashCode] call createElement!');
    return super.createElement();
  }

  @override
  _ColorizeBgRedState createState() {
    print('[$runtimeType#$hashCode] call create state!');
    return _ColorizeBgRedState();
  }
}

class _ColorizeBgRedState extends State<ColorizeBgRed> {
  final key = GlobalKey();
  int count = 0;

  _ColorizeBgRedState() : super() {
    print('[$runtimeType#$hashCode] call constructor!');
  }

  @override
  void initState() {
    super.initState();
    print('[$runtimeType#$hashCode] init state!');
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print('[$runtimeType#$hashCode] run postFrameCallback!');
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('[$runtimeType#$hashCode] didChangeDependencies!');
  }

  @override
  void didUpdateWidget(covariant ColorizeBgRed oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('[$runtimeType#$hashCode] didUpdateWidget!');
  }

  @override
  void deactivate() {
    print('[$runtimeType#$hashCode] deactivate!');
    super.deactivate();
  }

  @override
  void dispose() {
    print('[$runtimeType#$hashCode] dispose!');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('[$runtimeType#$hashCode] build!');

    final child = KeyedSubtree(key: key, child: widget.child);

    if (widget.disable) {
      return child;
    }

    return ColoredBox(color: Colors.red, child: child);
  }
}

class _TestStatefulWidgetLifeCycleState
    extends State<TestStatefulWidgetLifeCycle> {
  bool visible = true;
  bool disableRed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试 stateful widget 生命周期'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // const ConstStatefulWidget(),
            ColorizeBgRed(
              disable: disableRed,
              child: StatefulWidgetLifeCycle(),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text('parent call setState'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
              child:
                  Text((visible ? 'hide' : 'show') + ' ConstStatelessWidget'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  disableRed = !disableRed;
                });
              },
              child: const Text('test deactivate'),
            ),
          ],
        ),
      ),
    );
  }
}
