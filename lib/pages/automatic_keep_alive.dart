import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:random_color/random_color.dart';

class TestAutomaticKeepAlive extends StatefulWidget {
  TestAutomaticKeepAlive({Key? key}) : super(key: key);

  @override
  _TestAutomaticKeepAliveState createState() => _TestAutomaticKeepAliveState();
}

class _TestAutomaticKeepAliveState extends State<TestAutomaticKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: ListView.builder(
        addAutomaticKeepAlives: true,
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListItem(index: index);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ListItem extends StatefulWidget {
  final int index;
  ListItem({Key? key, required this.index}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem>
    with AutomaticKeepAliveClientMixin {
  static final randomColor = RandomColor();

  @override
  void dispose() {
    print('List item ${widget.index} dispose!');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    print('List item ${widget.index} build!');
    return Container(
      height: 100,
      color: randomColor.randomColor(colorBrightness: ColorBrightness.light),
      child: Center(
        child: Text('${widget.index}'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
