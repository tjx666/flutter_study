import 'package:flutter/material.dart';

class StatelessWidgetLifeCycle extends StatelessWidget {
  StatelessWidgetLifeCycle({Key? key}) : super(key: key) {
    print('[$runtimeType#$hashCode] call constructor!');
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print('[$runtimeType#$hashCode] PostFrameCallback called!');
    });
  }

  @override
  StatelessElement createElement() {
    print('[$runtimeType#$hashCode] call createElement!');
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    print('[$runtimeType#$hashCode] build!');

    return Container(
      child: Text('stateless widget'),
    );
  }
}

class ConstStatelessWidget extends StatelessWidget {
  const ConstStatelessWidget({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    print('[$runtimeType#$hashCode] call createElement!');
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    print('[$runtimeType#$hashCode] build!');
    return Center(
      child: Text('const stateless widget'),
    );
  }
}

class TestStatelessWidgetLifeCycle extends StatefulWidget {
  const TestStatelessWidgetLifeCycle({Key? key}) : super(key: key);

  @override
  _TestStatelessWidgetLifeCycleState createState() =>
      _TestStatelessWidgetLifeCycleState();
}

class _TestStatelessWidgetLifeCycleState
    extends State<TestStatelessWidgetLifeCycle> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试 stateless widget 生命周期'),
      ),
      body: Center(
        child: Column(
          children: [
            StatelessWidgetLifeCycle(),
            if (visible) const ConstStatelessWidget(),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text('call setState'),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                child:
                    Text((visible ? 'hide' : 'show') + ' ConstStatelessWidget'))
          ],
        ),
      ),
    );
  }
}
