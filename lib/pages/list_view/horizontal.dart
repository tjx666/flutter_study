import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TestHorizontalListView extends StatefulWidget {
  TestHorizontalListView({Key? key}) : super(key: key);

  @override
  _TestHorizontalListViewState createState() => _TestHorizontalListViewState();
}

class _TestHorizontalListViewState extends State<TestHorizontalListView> {
  List<String> wallpaperPaths = [];

  @override
  void initState() {
    super.initState();

    fetchWallpapers().then((paths) => setState(() {
          wallpaperPaths = paths;
        }));
  }

  Future<List<String>> fetchWallpapers() async {
    final resp =
        await Dio().get('https://wallhaven.cc/api/v1/search?sorting=toplist');
    return (resp.data['data'] as List)
        .map((wallpaper) {
          return wallpaper['thumbs']['original'];
          // return wallpaper['path'];
        })
        .toList()
        .cast<String>();
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          // height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: wallpaperPaths.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: wallpaperPaths[index],
                width: 400,
                height: 300,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }
}
