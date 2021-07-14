import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_study/pages/list_view/item.dart';

class _ListItem extends StatefulWidget {
  const _ListItem({
    Key? key,
    required this.index,
    required this.story,
  }) : super(key: key);

  final int index;
  final HackNewsItem story;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<_ListItem> {
  @override
  void initState() {
    super.initState();

    print('item ${widget.index} init');
  }

  @override
  void dispose() {
    print('item ${widget.index} dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${widget.index}.'),
      title: Text(widget.story.title),
    );
  }
}

class TestListViewBuilder extends StatefulWidget {
  TestListViewBuilder({Key? key}) : super(key: key);

  @override
  _TestListViewBuilderState createState() => _TestListViewBuilderState();
}

class _TestListViewBuilderState extends State<TestListViewBuilder> {
  Dio dio = Dio();
  List<int> itemIds = [];
  List<HackNewsItem> stories = [];

  @override
  void initState() {
    super.initState();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        // 测试的时候替换成你自己的 ip
        return 'PROXY 172.16.20.236:7890';
      };
    };

    fetchStories();
  }

  Future<void> fetchStories() async {
    final response =
        await dio.get('https://hacker-news.firebaseio.com/v0/topstories.json');
    itemIds = response.data.cast<int>();
    stories =
        await Future.wait<HackNewsItem>(itemIds.sublist(0, 50).map((id) async {
      final response =
          await dio.get('https://hacker-news.firebaseio.com/v0/item/$id.json');
      final story = HackNewsItem.fromMap(response.data);
      return story;
    }));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (var index = 0; index < stories.length; index++) {
      final story = stories[index];
      children.add(_ListItem(index: index, story: story));
    }

    return Scaffold(
      appBar: AppBar(title: Text('ListView.Builder')),
      // body: ListView.builder(
      //   itemCount: stories.length,
      //   itemBuilder: (context, index) {
      //     final story = stories[index];
      //     return _ListItem(index: index, story: story);
      //   },
      // ),
      body: ListView(children: children),
    );
  }
}
