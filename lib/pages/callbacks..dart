import 'package:flutter/material.dart';

class A extends StatelessWidget {
  const A({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build A');
    return Container();
  }
}

class TestCallbacks extends StatefulWidget {
  TestCallbacks({Key? key}) : super(key: key);

  @override
  _TestCallbacksState createState() => _TestCallbacksState();
}

class _TestCallbacksState extends State<TestCallbacks> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        print('postFrameCallback 0');
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('测试...'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              A(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    print('setState');
                  });
                  print('execute sync code');
                  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                    print('postFrameCallback');
                  });

                  Future.delayed(Duration(seconds: 2), () {
                    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                      print('postFrameCallback 2');
                    });
                  });
                },
                child: Text('click me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
