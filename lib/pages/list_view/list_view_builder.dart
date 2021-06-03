import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

import 'package:flutter/material.dart';

class TestListViewBuilder extends StatefulWidget {
  TestListViewBuilder({Key? key}) : super(key: key);

  @override
  _TestListViewBuilderState createState() => _TestListViewBuilderState();
}

class _TestListViewBuilderState extends State<TestListViewBuilder> {
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        return 'PROXY 172.16.20.236:7890';
      };
    };

    fetchStories();
  }

  Future<void> fetchStories() async {
    final Response response;
    try {
      response = await dio
          .get('https://hacker-news.firebaseio.com/v0/topstories.json');
    } catch (e) {
      print(e);
      return;
    }
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView.Builder')),
      body: Container(),
    );
  }
}
