import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TestCachedNetworkImage extends StatefulWidget {
  TestCachedNetworkImage({Key? key}) : super(key: key);

  @override
  _TestCachedNetworkImageState createState() => _TestCachedNetworkImageState();
}

class _TestCachedNetworkImageState extends State<TestCachedNetworkImage> {
  List<String> wallpaperPaths = [];

  @override
  void initState() {
    super.initState();

    fetchWallpapers().then((paths) => setState(() {
          wallpaperPaths = paths;
        }));
  }

  Future<List<String>> fetchWallpapers() async {
    final resp = await Dio().get(
      'https://wallhaven.cc/api/v1/search?sorting=toplist',
      options: Options(
        headers: {'Access-Control-Allow-Origin': '*'},
      ),
    );
    return (resp.data['data'] as List)
        .map((wallpaper) {
          // return wallpaper['thumbs']['original'];
          return wallpaper['path'];
        })
        .toList()
        .cast<String>();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        children: wallpaperPaths.map((wallpaperPath) {
          // return Image.network(
          //   wallpaperPath,
          //   height: (screenWidth - 3) / 4,
          //   fit: BoxFit.cover,
          // );
          return CachedNetworkImage(
            imageUrl: wallpaperPath,
            height: (screenWidth - 3) / 4,
            fit: BoxFit.cover,
          );
        }).toList(),
      ),
    );
  }
}
