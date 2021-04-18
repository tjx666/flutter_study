import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:random_color/random_color.dart';

class TestKeepAliveWidget extends StatefulWidget {
  TestKeepAliveWidget({Key? key}) : super(key: key);

  @override
  _TestKeepAliveWidgetState createState() => _TestKeepAliveWidgetState();
}

class _TestKeepAliveWidgetState extends State<TestKeepAliveWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        addSemanticIndexes: false,
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListItem(index: index);
        },
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  final int index;
  ListItem({Key? key, required this.index}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  static final randomColor = RandomColor();

  @override
  void dispose() {
    print('List item ${widget.index} dispose!');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('List item ${widget.index} build!');
    return KeepAlive(
      keepAlive: true,
      child: Container(
        height: 100,
        color: randomColor.randomColor(colorBrightness: ColorBrightness.light),
        child: Center(
          child: Text('${widget.index}'),
        ),
      ),
    );
  }
}
